package br.com.agnellovinheria.model;

import java.util.List;

public class Vinho {
	private String nome;
	private double preco;
	private String imagem;
	private String linkDetalhes;
	private String tipo;
	private String origem;
	private String uva;
	private String safra;
	private String teor;
	private String volume;
	private String temperatura;
	private String produtor;
	private String porcFruta;
	private String porcAcucar;
	private String porcAcidez;
	private String porcTanino;
	private List<Degustacao> degustacao;
    private List<Review> reviews;

	public Vinho(String nome, double preco, String imagem, String linkDetalhes) {
		this.nome = nome;
		this.preco = preco;
		this.imagem = imagem;
		this.linkDetalhes = linkDetalhes;
	}

	public Vinho(String nome, double preco, String imagem, String linkDetalhes, String tipo, String origem, String uva,
			String safra, String teor, String volume, String temperatura, String produtor, String porcFruta,
			String porcAcucar, String porcAcidez, String porcTanino) {
		this.nome = nome;
		this.preco = preco;
		this.imagem = imagem;
		this.linkDetalhes = linkDetalhes;
		this.tipo = tipo;
		this.origem = origem;
		this.uva = uva;
		this.safra = safra;
		this.teor = teor;
		this.volume = volume;
		this.temperatura = temperatura;
		this.produtor = produtor;
		this.porcFruta = porcFruta;
		this.porcAcucar = porcAcucar;
		this.porcAcidez = porcAcidez;
		this.porcTanino = porcTanino;
	}

	public Vinho() {
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public double getPreco() {
		return preco;
	}

	public void setPreco(double preco) {
		this.preco = preco;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public String getLinkDetalhes() {
		return linkDetalhes;
	}

	public void setLinkDetalhes(String linkDetalhes) {
		this.linkDetalhes = linkDetalhes;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getOrigem() {
		return origem;
	}

	public void setOrigem(String origem) {
		this.origem = origem;
	}

	public String getUva() {
		return uva;
	}

	public void setUva(String uva) {
		this.uva = uva;
	}

	public String getSafra() {
		return safra;
	}

	public void setSafra(String safra) {
		this.safra = safra;
	}

	public String getTeor() {
		return teor;
	}

	public void setTeor(String teor) {
		this.teor = teor;
	}

	public String getVolume() {
		return volume;
	}

	public void setVolume(String volume) {
		this.volume = volume;
	}

	public String getTemperatura() {
		return temperatura;
	}

	public void setTemperatura(String temperatura) {
		this.temperatura = temperatura;
	}

	public String getProdutor() {
		return produtor;
	}

	public void setProdutor(String produtor) {
		this.produtor = produtor;
	}

	public String getPorcFruta() {
		return porcFruta;
	}

	public void setPorcFruta(String porcFruta) {
		this.porcFruta = porcFruta;
	}

	public String getPorcAcucar() {
		return porcAcucar;
	}

	public void setPorcAcucar(String porcAcucar) {
		this.porcAcucar = porcAcucar;
	}

	public String getPorcAcidez() {
		return porcAcidez;
	}

	public void setPorcAcidez(String porcAcidez) {
		this.porcAcidez = porcAcidez;
	}

	public String getPorcTanino() {
		return porcTanino;
	}

	public void setPorcTanino(String porcTanino) {
		this.porcTanino = porcTanino;
	}
	
	public List<Degustacao> getDegustacao() {
        return degustacao;
    }

    public void setDegustacao(List<Degustacao> degustacao) {
        this.degustacao = degustacao;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

}
