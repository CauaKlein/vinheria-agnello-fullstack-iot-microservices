package br.com.agnellovinheria.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import br.com.agnellovinheria.model.Degustacao;
import br.com.agnellovinheria.model.Review;
import br.com.agnellovinheria.model.Vinho;

public class VinhoService {

	public static List<Vinho> getVinhos() {
		List<Vinho> vinhos = new ArrayList<>();
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			String url = "jdbc:sqlserver://vinheria-agnello.database.windows.net:1433;"
					+ "database=vinheria-agnello-db;" + "user=fiap-2-vinheria-agnello@vinheria-agnello;"
					+ "password=1F2\\haAR1M?0;" + "encrypt=true;" + "trustServerCertificate=false;"
					+ "loginTimeout=30;";
			Connection conn = DriverManager.getConnection(url);

			String sql = "SELECT v.id_vinho, v.nm_vinho, v.vl_vinho, v.ds_imagem, v.ds_linkDetalhes, "
					+ "t.ds_tipo, l.nm_pais, u.nm_uva, YEAR(v.dt_safra) AS ano_safra, "
					+ "v.ds_teor, v.vl_volume, v.vl_temperatura, pr.nm_produtor, "
					+ "v.vl_porcFruta, v.vl_porcAcucar, v.vl_porcAcidez, v.vl_porcTanino, "
					+ "d.ds_cores, d.ds_aroma, d.ds_sabor, d.ds_harmonia " + "FROM T_VINHO v "
					+ "JOIN T_TIPO_VINHO t ON v.id_tipo_vinho = t.id_tipo "
					+ "JOIN T_LOCALIDADE l ON v.id_localidade = l.id_local " + "JOIN T_UVA u ON v.id_uva = u.id_uva "
					+ "JOIN T_PRODUTOR pr ON v.id_produtor = pr.id_produtor "
					+ "LEFT JOIN T_DEGUSTACAO d ON v.id_vinho = d.id_vinho " + "ORDER BY v.id_vinho";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			Map<Integer, Vinho> mapaVinhos = new HashMap<>();

			while (rs.next()) {
				int idVinho = rs.getInt("id_vinho");
				String nome = rs.getString("nm_vinho");
				double preco = rs.getDouble("vl_vinho");
				String imagem = rs.getString("ds_imagem");
				String linkDet = rs.getString("ds_linkDetalhes");
				String tipo = rs.getString("ds_tipo");
				String origem = rs.getString("nm_pais");
				String uva = rs.getString("nm_uva");
				String safra = rs.getString("ano_safra");
				String teor = rs.getString("ds_teor");
				String volume = rs.getString("vl_volume");
				String temperatura = rs.getString("vl_temperatura");
				String produtor = rs.getString("nm_produtor");
				String porcFruta = rs.getString("vl_porcFruta");
				String porcAcucar = rs.getString("vl_porcAcucar");
				String porcAcidez = rs.getString("vl_porcAcidez");
				String porcTanino = rs.getString("vl_porcTanino");

				Vinho vinho = new Vinho(nome, preco, imagem, linkDet, tipo, origem, uva, safra, teor, volume,
						temperatura, produtor, porcFruta, porcAcucar, porcAcidez, porcTanino);

				List<Degustacao> degustacoes = new ArrayList<>();
				degustacoes.add(new Degustacao("Observar a cor", rs.getString("ds_cores")));
				degustacoes.add(new Degustacao("Sinta os aromas", rs.getString("ds_aroma")));
				degustacoes.add(new Degustacao("Prove o sabor", rs.getString("ds_sabor")));
				degustacoes.add(new Degustacao("Harmonize com", rs.getString("ds_harmonia")));

				vinho.setDegustacao(degustacoes);
				vinho.setReviews(new ArrayList<>());

				mapaVinhos.put(idVinho, vinho);
				vinhos.add(vinho);
			}
			rs.close();

			String sqlReviews = "SELECT a.id_vinho, a.vl_nota, a.ds_descricao, a.dt_avaliacao, u.nm_user "
					+ "FROM T_AVALIACAO a JOIN T_USER u ON a.id_user = u.id_user";
			ResultSet rs2 = stmt.executeQuery(sqlReviews);
			DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd/MM/yyyy");

			while (rs2.next()) {
				int vinhoId = rs2.getInt("id_vinho");
				double nota = rs2.getDouble("vl_nota");
				String desc = rs2.getString("ds_descricao");
				Timestamp dataTs = rs2.getTimestamp("dt_avaliacao");
				String data = dataTs.toLocalDateTime().format(fmt);
				String nomePessoa = rs2.getString("nm_user");

				String tituloReview;
				if (nota >= 5.0) {
					tituloReview = "Incrível";
				} else if (nota >= 4.5) {
					tituloReview = "Excelente";
				} else if (nota >= 4.0) {
					tituloReview = "Muito bom";
				} else {
					tituloReview = "Bom";
				}

				Review review = new Review(tituloReview, desc, nomePessoa, data);
				Vinho vin = mapaVinhos.get(vinhoId);
				if (vin != null) {
					vin.getReviews().add(review);
				}
			}
			rs2.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vinhos;
	}

}