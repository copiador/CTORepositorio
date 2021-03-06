function ClusterIcon(b, a) {
    b.getMarkerClusterer().extend(ClusterIcon, google.maps.OverlayView);
    this.cluster_ = b;
    this.styles_ = a;
    this.center_ = null;
    this.div_ = null;
    this.sums_ = null;
    this.visible_ = false;
    this.setMap(b.getMap())
}
ClusterIcon.prototype.onAdd = function () {
    var c = this;
    var f;
    var d;
    this.div_ = document.createElement("div");
    if (this.visible_) {
        this.show()
    }
    this.getPanes().overlayMouseTarget.appendChild(this.div_);
    google.maps.event.addListener(this.getMap(), "bounds_changed", function () {
        d = f
    });
    google.maps.event.addDomListener(this.div_, "mousedown", function () {
        f = true;
        d = false
    });
    google.maps.event.addDomListener(this.div_, "click", function (e) {
        f = false;
        if (!d) {
            var a;
            var b = c.cluster_.getMarkerClusterer();
            google.maps.event.trigger(b, "click", c.cluster_);
            google.maps.event.trigger(b, "clusterclick", c.cluster_);
            if (b.getZoomOnClick()) {
                a = b.getMaxZoom();
                b.getMap().fitBounds(c.cluster_.getBounds());
                if (a !== null && (b.getMap().getZoom() > a)) {
                    b.getMap().setZoom(a + 1)
                }
            }
            e.cancelBubble = true;
            if (e.stopPropagation) {
                e.stopPropagation()
            }
        }
    });
    google.maps.event.addDomListener(this.div_, "mouseover", function () {
        var a = c.cluster_.getMarkerClusterer();
        google.maps.event.trigger(a, "mouseover", c.cluster_)
    });
    google.maps.event.addDomListener(this.div_, "mouseout", function () {
        var a = c.cluster_.getMarkerClusterer();
        google.maps.event.trigger(a, "mouseout", c.cluster_)
    })
};
ClusterIcon.prototype.onRemove = function () {
    if (this.div_ && this.div_.parentNode) {
        this.hide();
        google.maps.event.clearInstanceListeners(this.div_);
        this.div_.parentNode.removeChild(this.div_);
        this.div_ = null
    }
};
ClusterIcon.prototype.draw = function () {
    if (this.visible_) {
        var a = this.getPosFromLatLng_(this.center_);
        this.div_.style.top = a.y + "px";
        this.div_.style.left = a.x + "px"
    }
};
ClusterIcon.prototype.hide = function () {
    if (this.div_) {
        this.div_.style.display = "none"
    }
    this.visible_ = false
};
ClusterIcon.prototype.show = function () {
    if (this.div_) {
        var a = this.getPosFromLatLng_(this.center_);
        this.div_.style.cssText = this.createCss(a);
        if (this.cluster_.printable_) {
            this.div_.innerHTML = "<img src='" + this.url_ + "'><div style='position: absolute; top: 0px; left: 0px; width: " + this.width_ + "px;'>" + this.sums_.text + "</div>"
        } else {
            this.div_.innerHTML = this.sums_.text
        }
        this.div_.title = this.cluster_.getMarkerClusterer().getTitle();
        this.div_.style.display = ""
    }
    this.visible_ = true
};
ClusterIcon.prototype.useStyle = function (a) {
    this.sums_ = a;
    var b = Math.max(0, a.index - 1);
    b = Math.min(this.styles_.length - 1, b);
    var c = this.styles_[b];
    this.url_ = c.url;
    this.height_ = c.height;
    this.width_ = c.width;
    this.anchor_ = c.anchor;
    this.anchorIcon_ = c.anchorIcon || [parseInt(this.height_ / 2, 10), parseInt(this.width_ / 2, 10)];
    this.textColor_ = c.textColor || "black";
    this.textSize_ = c.textSize || 11;
    this.textDecoration_ = c.textDecoration || "none";
    this.fontWeight_ = c.fontWeight || "bold";
    this.fontStyle_ = c.fontStyle || "normal";
    this.fontFamily_ = c.fontFamily || "Arial,sans-serif";
    this.backgroundPosition_ = c.backgroundPosition || "0 0"
};
ClusterIcon.prototype.setCenter = function (a) {
    this.center_ = a
};
ClusterIcon.prototype.createCss = function (b) {
    var a = [];
    if (!this.cluster_.printable_) {
        a.push('background-image:url(' + this.url_ + ');');
        a.push('background-position:' + this.backgroundPosition_ + ';')
    }
    if (typeof this.anchor_ === 'object') {
        if (typeof this.anchor_[0] === 'number' && this.anchor_[0] > 0 && this.anchor_[0] < this.height_) {
            a.push('height:' + (this.height_ - this.anchor_[0]) + 'px; padding-top:' + this.anchor_[0] + 'px;')
        } else {
            a.push('height:' + this.height_ + 'px; line-height:' + this.height_ + 'px;')
        } if (typeof this.anchor_[1] === 'number' && this.anchor_[1] > 0 && this.anchor_[1] < this.width_) {
            a.push('width:' + (this.width_ - this.anchor_[1]) + 'px; padding-left:' + this.anchor_[1] + 'px;')
        } else {
            a.push('width:' + this.width_ + 'px; text-align:center;')
        }
    } else {
        a.push('height:' + this.height_ + 'px; line-height:' + this.height_ + 'px; width:' + this.width_ + 'px; text-align:center;')
    }
    a.push('cursor:pointer; top:' + b.y + 'px; left:' + b.x + 'px; color:' + this.textColor_ + '; position:absolute; font-size:' + this.textSize_ + 'px; font-family:' + this.fontFamily_ + '; font-weight:' + this.fontWeight_ + '; font-style:' + this.fontStyle_ + '; text-decoration:' + this.textDecoration_ + ';');
    return a.join("")
};
ClusterIcon.prototype.getPosFromLatLng_ = function (b) {
    var a = this.getProjection().fromLatLngToDivPixel(b);
    a.x -= this.anchorIcon_[1];
    a.y -= this.anchorIcon_[0];
    return a
};

function Cluster(a) {
    this.markerClusterer_ = a;
    this.map_ = a.getMap();
    this.gridSize_ = a.getGridSize();
    this.minClusterSize_ = a.getMinimumClusterSize();
    this.averageCenter_ = a.getAverageCenter();
    this.printable_ = a.getPrintable();
    this.markers_ = [];
    this.center_ = null;
    this.bounds_ = null;
    this.clusterIcon_ = new ClusterIcon(this, a.getStyles())
}
Cluster.prototype.getSize = function () {
    return this.markers_.length
};
Cluster.prototype.getMarkers = function () {
    return this.markers_
};
Cluster.prototype.getCenter = function () {
    return this.center_
};
Cluster.prototype.getMap = function () {
    return this.map_
};
Cluster.prototype.getMarkerClusterer = function () {
    return this.markerClusterer_
};
Cluster.prototype.getBounds = function () {
    var i;
    var b = new google.maps.LatLngBounds(this.center_, this.center_);
    var a = this.getMarkers();
    for (i = 0; i < a.length; i++) {
        b.extend(a[i].getPosition())
    }
    return b
};
Cluster.prototype.remove = function () {
    this.clusterIcon_.setMap(null);
    this.markers_ = [];
    delete this.markers_
};
Cluster.prototype.addMarker = function (e) {
    var i;
    var c;
    var b;
    if (this.isMarkerAlreadyAdded_(e)) {
        return false
    }
    if (!this.center_) {
        this.center_ = e.getPosition();
        this.calculateBounds_()
    } else {
        if (this.averageCenter_) {
            var l = this.markers_.length + 1;
            var a = (this.center_.lat() * (l - 1) + e.getPosition().lat()) / l;
            var d = (this.center_.lng() * (l - 1) + e.getPosition().lng()) / l;
            this.center_ = new google.maps.LatLng(a, d);
            this.calculateBounds_()
        }
    }
    e.isAdded = true;
    this.markers_.push(e);
    c = this.markers_.length;
    b = this.markerClusterer_.getMaxZoom();
    if (b !== null && this.map_.getZoom() > b) {
        if (e.getMap() !== this.map_) {
            e.setMap(this.map_)
        }
    } else if (c < this.minClusterSize_) {
        if (e.getMap() !== this.map_) {
            e.setMap(this.map_)
        }
    } else if (c === this.minClusterSize_) {
        for (i = 0; i < c; i++) {
            this.markers_[i].setMap(null)
        }
    } else {
        e.setMap(null)
    }
    this.updateIcon_();
    return true
};
Cluster.prototype.isMarkerInClusterBounds = function (a) {
    return this.bounds_.contains(a.getPosition())
};
Cluster.prototype.calculateBounds_ = function () {
    var a = new google.maps.LatLngBounds(this.center_, this.center_);
    this.bounds_ = this.markerClusterer_.getExtendedBounds(a)
};
Cluster.prototype.updateIcon_ = function () {
    var c = this.markers_.length;
    var a = this.markerClusterer_.getMaxZoom();
    if (a !== null && this.map_.getZoom() > a) {
        this.clusterIcon_.hide();
        return
    }
    if (c < this.minClusterSize_) {
        this.clusterIcon_.hide();
        return
    }
    var b = this.markerClusterer_.getStyles().length;
    var d = this.markerClusterer_.getCalculator()(this.markers_, b);
    this.clusterIcon_.setCenter(this.center_);
    this.clusterIcon_.useStyle(d);
    this.clusterIcon_.show()
};
Cluster.prototype.isMarkerAlreadyAdded_ = function (a) {
    var i;
    if (this.markers_.indexOf) {
        return this.markers_.indexOf(a) !== -1
    } else {
        for (i = 0; i < this.markers_.length; i++) {
            if (a === this.markers_[i]) {
                return true
            }
        }
    }
    return false
};

function MarkerClusterer(a, c, b) {
    this.extend(MarkerClusterer, google.maps.OverlayView);
    c = c || [];
    b = b || {};
    this.markers_ = [];
    this.clusters_ = [];
    this.listeners_ = [];
    this.activeMap_ = null;
    this.ready_ = false;
    this.gridSize_ = b.gridSize || 60;
    this.minClusterSize_ = b.minimumClusterSize || 2;
    this.maxZoom_ = b.maxZoom || null;
    this.styles_ = b.styles || [];
    this.title_ = b.title || "";
    this.zoomOnClick_ = true;
    if (b.zoomOnClick !== undefined) {
        this.zoomOnClick_ = b.zoomOnClick
    }
    this.averageCenter_ = false;
    if (b.averageCenter !== undefined) {
        this.averageCenter_ = b.averageCenter
    }
    this.ignoreHidden_ = false;
    if (b.ignoreHidden !== undefined) {
        this.ignoreHidden_ = b.ignoreHidden
    }
    this.printable_ = false;
    if (b.printable !== undefined) {
        this.printable_ = b.printable
    }
    this.imagePath_ = b.imagePath || MarkerClusterer.IMAGE_PATH;
    this.imageExtension_ = b.imageExtension || MarkerClusterer.IMAGE_EXTENSION;
    this.imageSizes_ = b.imageSizes || MarkerClusterer.IMAGE_SIZES;
    this.calculator_ = b.calculator || MarkerClusterer.CALCULATOR;
    this.batchSize_ = b.batchSize || MarkerClusterer.BATCH_SIZE;
    this.batchSizeIE_ = b.batchSizeIE || MarkerClusterer.BATCH_SIZE_IE;
    if (navigator.userAgent.toLowerCase().indexOf("msie") !== -1) {
        this.batchSize_ = this.batchSizeIE_
    }
    this.setupStyles_();
    this.addMarkers(c, true);
    this.setMap(a)
}
MarkerClusterer.prototype.onAdd = function () {
    var a = this;
    this.activeMap_ = this.getMap();
    this.ready_ = true;
    this.repaint();
    this.listeners_ = [google.maps.event.addListener(this.getMap(), "zoom_changed", function () {
        a.resetViewport_(false);
        if (this.getZoom() === 0) {
            google.maps.event.trigger(this, "idle")
        }
    }), google.maps.event.addListener(this.getMap(), "idle", function () {
        a.redraw_()
    })]
};
MarkerClusterer.prototype.onRemove = function () {
    var i;
    for (i = 0; i < this.markers_.length; i++) {
        this.markers_[i].setMap(this.activeMap_)
    }
    for (i = 0; i < this.clusters_.length; i++) {
        this.clusters_[i].remove()
    }
    this.clusters_ = [];
    for (i = 0; i < this.listeners_.length; i++) {
        google.maps.event.removeListener(this.listeners_[i])
    }
    this.listeners_ = [];
    this.activeMap_ = null;
    this.ready_ = false
};
MarkerClusterer.prototype.draw = function () {};
MarkerClusterer.prototype.setupStyles_ = function () {
    var i, size;
    if (this.styles_.length > 0) {
        return
    }
    for (i = 0; i < this.imageSizes_.length; i++) {
        size = this.imageSizes_[i];
        this.styles_.push({
            url: this.imagePath_ + (i + 1) + "." + this.imageExtension_,
            height: size,
            width: size
        })
    }
};
MarkerClusterer.prototype.fitMapToMarkers = function () {
    var i;
    var a = this.getMarkers();
    var b = new google.maps.LatLngBounds();
    for (i = 0; i < a.length; i++) {
        b.extend(a[i].getPosition())
    }
    this.getMap().fitBounds(b)
};
MarkerClusterer.prototype.getGridSize = function () {
    return this.gridSize_
};
MarkerClusterer.prototype.setGridSize = function (a) {
    this.gridSize_ = a
};
MarkerClusterer.prototype.getMinimumClusterSize = function () {
    return this.minClusterSize_
};
MarkerClusterer.prototype.setMinimumClusterSize = function (a) {
    this.minClusterSize_ = a
};
MarkerClusterer.prototype.getMaxZoom = function () {
    return this.maxZoom_
};
MarkerClusterer.prototype.setMaxZoom = function (a) {
    this.maxZoom_ = a
};
MarkerClusterer.prototype.getStyles = function () {
    return this.styles_
};
MarkerClusterer.prototype.setStyles = function (a) {
    this.styles_ = a
};
MarkerClusterer.prototype.getTitle = function () {
    return this.title_
};
MarkerClusterer.prototype.setTitle = function (a) {
    this.title_ = a
};
MarkerClusterer.prototype.getZoomOnClick = function () {
    return this.zoomOnClick_
};
MarkerClusterer.prototype.setZoomOnClick = function (a) {
    this.zoomOnClick_ = a
};
MarkerClusterer.prototype.getAverageCenter = function () {
    return this.averageCenter_
};
MarkerClusterer.prototype.setAverageCenter = function (a) {
    this.averageCenter_ = a
};
MarkerClusterer.prototype.getIgnoreHidden = function () {
    return this.ignoreHidden_
};
MarkerClusterer.prototype.setIgnoreHidden = function (a) {
    this.ignoreHidden_ = a
};
MarkerClusterer.prototype.getImageExtension = function () {
    return this.imageExtension_
};
MarkerClusterer.prototype.setImageExtension = function (a) {
    this.imageExtension_ = a
};
MarkerClusterer.prototype.getImagePath = function () {
    return this.imagePath_
};
MarkerClusterer.prototype.setImagePath = function (a) {
    this.imagePath_ = a
};
MarkerClusterer.prototype.getImageSizes = function () {
    return this.imageSizes_
};
MarkerClusterer.prototype.setImageSizes = function (a) {
    this.imageSizes_ = a
};
MarkerClusterer.prototype.getCalculator = function () {
    return this.calculator_
};
MarkerClusterer.prototype.setCalculator = function (a) {
    this.calculator_ = a
};
MarkerClusterer.prototype.getPrintable = function () {
    return this.printable_
};
MarkerClusterer.prototype.setPrintable = function (a) {
    this.printable_ = a
};
MarkerClusterer.prototype.getBatchSizeIE = function () {
    return this.batchSizeIE_
};
MarkerClusterer.prototype.setBatchSizeIE = function (a) {
    this.batchSizeIE_ = a
};
MarkerClusterer.prototype.getMarkers = function () {
    return this.markers_
};
MarkerClusterer.prototype.getTotalMarkers = function () {
    return this.markers_.length
};
MarkerClusterer.prototype.getClusters = function () {
    return this.clusters_
};
MarkerClusterer.prototype.getTotalClusters = function () {
    return this.clusters_.length
};
MarkerClusterer.prototype.addMarker = function (b, a) {
    this.pushMarkerTo_(b);
    if (!a) {
        this.redraw_()
    }
};
MarkerClusterer.prototype.addMarkers = function (b, a) {
    var i;
    for (i = 0; i < b.length; i++) {
        this.pushMarkerTo_(b[i])
    }
    if (!a) {
        this.redraw_()
    }
};
MarkerClusterer.prototype.pushMarkerTo_ = function (b) {
    if (b.getDraggable()) {
        var a = this;
        google.maps.event.addListener(b, "dragend", function () {
            if (a.ready_) {
                this.isAdded = false;
                a.repaint()
            }
        })
    }
    b.isAdded = false;
    this.markers_.push(b)
};
MarkerClusterer.prototype.removeMarker = function (c, a) {
    var b = this.removeMarker_(c);
    if (!a && b) {
        this.repaint()
    }
    return b
};
MarkerClusterer.prototype.removeMarkers = function (a, c) {
    var i, r;
    var b = false;
    for (i = 0; i < a.length; i++) {
        r = this.removeMarker_(a[i]);
        b = b || r
    }
    if (!c && b) {
        this.repaint()
    }
    return b
};
MarkerClusterer.prototype.removeMarker_ = function (b) {
    var i;
    var a = -1;
    if (this.markers_.indexOf) {
        a = this.markers_.indexOf(b)
    } else {
        for (i = 0; i < this.markers_.length; i++) {
            if (b === this.markers_[i]) {
                a = i;
                break
            }
        }
    } if (a === -1) {
        return false
    }
    b.setMap(null);
    this.markers_.splice(a, 1);
    return true
};
MarkerClusterer.prototype.clearMarkers = function () {
    this.resetViewport_(true);
    this.markers_ = []
};
MarkerClusterer.prototype.repaint = function () {
    var a = this.clusters_.slice();
    this.clusters_ = [];
    this.resetViewport_(false);
    this.redraw_();
    setTimeout(function () {
        var i;
        for (i = 0; i < a.length; i++) {
            a[i].remove()
        }
    }, 0)
};
MarkerClusterer.prototype.getExtendedBounds = function (d) {
    var f = this.getProjection();
    var c = new google.maps.LatLng(d.getNorthEast().lat(), d.getNorthEast().lng());
    var a = new google.maps.LatLng(d.getSouthWest().lat(), d.getSouthWest().lng());
    var e = f.fromLatLngToDivPixel(c);
    e.x += this.gridSize_;
    e.y -= this.gridSize_;
    var g = f.fromLatLngToDivPixel(a);
    g.x -= this.gridSize_;
    g.y += this.gridSize_;
    var b = f.fromDivPixelToLatLng(e);
    var h = f.fromDivPixelToLatLng(g);
    d.extend(b);
    d.extend(h);
    return d
};
MarkerClusterer.prototype.redraw_ = function () {
    this.createClusters_(0)
};
MarkerClusterer.prototype.resetViewport_ = function (a) {
    var i, marker;
    for (i = 0; i < this.clusters_.length; i++) {
        this.clusters_[i].remove()
    }
    this.clusters_ = [];
    for (i = 0; i < this.markers_.length; i++) {
        marker = this.markers_[i];
        marker.isAdded = false;
        if (a) {
            marker.setMap(null)
        }
    }
};
MarkerClusterer.prototype.distanceBetweenPoints_ = function (b, e) {
    var R = 6371;
    var g = (e.lat() - b.lat()) * Math.PI / 180;
    var f = (e.lng() - b.lng()) * Math.PI / 180;
    var a = Math.sin(g / 2) * Math.sin(g / 2) + Math.cos(b.lat() * Math.PI / 180) * Math.cos(e.lat() * Math.PI / 180) * Math.sin(f / 2) * Math.sin(f / 2);
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    var d = R * c;
    return d
};
MarkerClusterer.prototype.isMarkerInBounds_ = function (b, a) {
    return a.contains(b.getPosition())
};
MarkerClusterer.prototype.addToClosestCluster_ = function (c) {
    var i, d, cluster, center;
    var a = 40000;
    var b = null;
    for (i = 0; i < this.clusters_.length; i++) {
        cluster = this.clusters_[i];
        center = cluster.getCenter();
        if (center) {
            d = this.distanceBetweenPoints_(center, c.getPosition());
            if (d < a) {
                a = d;
                b = cluster
            }
        }
    }
    if (b && b.isMarkerInClusterBounds(c)) {
        b.addMarker(c)
    } else {
        cluster = new Cluster(this);
        cluster.addMarker(c);
        this.clusters_.push(cluster)
    }
};
MarkerClusterer.prototype.createClusters_ = function (e) {
    var i, marker;
    var d;
    var c = this;
    if (!this.ready_) {
        return
    }
    if (e === 0) {
        google.maps.event.trigger(this, "clusteringbegin", this);
        if (typeof this.timerRefStatic !== "undefined") {
            clearTimeout(this.timerRefStatic);
            delete this.timerRefStatic
        }
    }
    if (this.getMap().getZoom() > 3) {
        d = new google.maps.LatLngBounds(this.getMap().getBounds().getSouthWest(), this.getMap().getBounds().getNorthEast())
    } else {
        d = new google.maps.LatLngBounds(new google.maps.LatLng(85.02070771743472, -178.48388434375), new google.maps.LatLng(-85.08136444384544, 178.00048865625))
    }
    var a = this.getExtendedBounds(d);
    var b = Math.min(e + this.batchSize_, this.markers_.length);
    for (i = e; i < b; i++) {
        marker = this.markers_[i];
        if (!marker.isAdded && this.isMarkerInBounds_(marker, a)) {
            if (!this.ignoreHidden_ || (this.ignoreHidden_ && marker.getVisible())) {
                this.addToClosestCluster_(marker)
            }
        }
    }
    if (b < this.markers_.length) {
        this.timerRefStatic = setTimeout(function () {
            c.createClusters_(b)
        }, 0)
    } else {
        delete this.timerRefStatic;
        google.maps.event.trigger(this, "clusteringend", this)
    }
};
MarkerClusterer.prototype.extend = function (d, c) {
    return (function (b) {
        var a;
        for (a in b.prototype) {
            this.prototype[a] = b.prototype[a]
        }
        return this
    }).apply(d, [c])
};
MarkerClusterer.CALCULATOR = function (a, b) {
    var e = 0;
    var c = a.length.toString();
    var d = c;
    while (d !== 0) {
        d = parseInt(d / 10, 10);
        e++
    }
    e = Math.min(e, b);
    return {
        text: c,
        index: e
    }
};
MarkerClusterer.BATCH_SIZE = 2000;
MarkerClusterer.BATCH_SIZE_IE = 500;
MarkerClusterer.IMAGE_PATH = "http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerclustererplus/images/m";
MarkerClusterer.IMAGE_EXTENSION = "png";
MarkerClusterer.IMAGE_SIZES = [53, 56, 66, 78, 90];