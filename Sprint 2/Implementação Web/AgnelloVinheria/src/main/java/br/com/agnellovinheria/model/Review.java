package br.com.agnellovinheria.model;

public class Review {
	private String titulo;
	private String desc;
	private String nomePessoa;
	private String data;
	
	public Review(String titulo, String desc, String nomePessoa, String data) {
		this.titulo = titulo;
		this.desc = desc;
		this.nomePessoa = nomePessoa;
		this.data = data;
	}
	
	public Review() {

	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getNomePessoa() {
		return nomePessoa;
	}

	public void setNomePessoa(String nomePessoa) {
		this.nomePessoa = nomePessoa;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}
	
	
	
	
	
	
	
}
