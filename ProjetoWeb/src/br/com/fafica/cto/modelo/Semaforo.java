package br.com.fafica.cto.modelo;

public class Semaforo {
	private String Latitude;
	private String Longitude;
	private String Sentido;
	private String Cruzamento;

	public Semaforo(String latitude, String longitude) {

		this.Latitude = latitude;
		this.Longitude = longitude;
	}

	public String getLatitude() {
		return Latitude;
	}

	public void setLatitude(String latitude) {
		Latitude = latitude;
	}

	public String getLongitude() {
		return Longitude;
	}

	public void setLongitude(String longitude) {
		Longitude = longitude;
	}

	public String getSentido() {
		return Sentido;
	}

	public void setSentido(String sentido) {
		Sentido = sentido;
	}

	public String getCruzamento() {
		return Cruzamento;
	}

	public void setCruzamento(String cruzamento) {
		Cruzamento = cruzamento;
	}

}
