<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Detalhes - ${vinho.nome}</title>
  <link rel="stylesheet" href="style.css" />
  <link rel="stylesheet" href="style2.css" />
  <link rel="icon" type="image/png" href="assets/images/favicon.svg">
</head>
<body>
  <header>
    <nav class="HomeNavBar">
      <ul>
        <li><a href="vinhos?page=vinhos">VINHOS</a></li>
        <li><a href="sobre.html">SOBRE</a></li>
        <li><a href="clube.html">CLUBE</a></li>
      </ul>
      <a class="logonavbar" href="index.jsp"><img src="assets/images/Logo.png" alt="" /></a>
      <div class="search-cart">
        <input class="barradepesquisa" type="text" placeholder="Buscar vinhos" />
        <div class="icones-nav">
          <img src="assets/images/Person.svg" alt="" />
          <img src="assets/images/Cart.svg" alt="" />
        </div>
      </div>
    </nav>
  </header>

  <main class="produto-detalhe">
    <!-- Seção de detalhes -->
    <section class="produto-detalhes">
      <div class="produto-imagem-detalhes">
        <img src="${vinho.imagem}" alt="${vinho.nome}" />
      </div>
      <div class="produto-info-detalhes">
        <h1>
          ${vinho.nome}
          <br />
          <span class="preco-detalhes">R$ ${vinho.preco}</span>
        </h1>
        <ul class="detalhes-lista-detalhes">
          <li style="display: flex; gap: 0.5em;">
            <img style="width: 29%;" src="assets/images/tipo_icon.svg" alt="" />
            <div>
              <p style="font-weight: 600;">
                Tipo <br />
                <strong style="font-weight: 200;">${vinho.tipo}</strong>
              </p>
            </div>
          </li>
          <li style="display: flex; gap: 0.5em;">
            <img style="width: 35%;" src="assets/images/teor_icon.svg" alt="" />
            <div>
              <p style="font-weight: 600; white-space: nowrap; text-align: left;">
                Teor alcoólico<br />
                <strong style="font-weight: 200;">${vinho.teor}</strong>
              </p>
            </div>
          </li>
          <li style="display: flex; gap: 0.5em;">
            <img style="width: 20%;" src="assets/images/origem_icon.svg" alt="" />
            <div>
              <p style="font-weight: 600; white-space: nowrap; text-align: left;">
                Origem<br />
                <strong style="font-weight: 200;">${vinho.origem}</strong>
              </p>
            </div>
          </li>
          <li style="display: flex; gap: 0.5em;">
            <img style="width: 35%;" src="assets/images/volume_icon.svg" alt="" />
            <div>
              <p style="font-weight: 600; white-space: nowrap; text-align: left;">
                Volume<br />
                <strong style="font-weight: 200;">${vinho.volume}</strong>
              </p>
            </div>
          </li>
          <li style="display: flex; gap: 0.5em;">
            <img style="width: 25%;" src="assets/images/uva_icon.svg" alt="" />
            <div>
              <p style="font-weight: 600; white-space: nowrap; text-align: left;">
                Uva<br />
                <strong style="font-weight: 200;">${vinho.uva}</strong>
              </p>
            </div>
          </li>
          <li style="display: flex; gap: 0.5em;">
            <img style="width: 45%;" src="assets/images/temperatura_icon.svg" alt="" />
            <div>
              <p style="font-weight: 600; white-space: nowrap; text-align: left;">
                Temperatura<br />
                <strong style="font-weight: 200;">${vinho.temperatura}</strong>
              </p>
            </div>
          </li>
          <li style="display: flex; gap: 0.5em;">
            <img style="width: 20%;" src="assets/images/safra_icon.svg" alt="" />
            <div>
              <p style="font-weight: 600; white-space: nowrap; text-align: left;">
                Safra<br />
                <strong style="font-weight: 200;">${vinho.safra}</strong>
              </p>
            </div>
          </li>
          <li style="display: flex; gap: 0.5em;">
            <img style="width: 20%;" src="assets/images/produtor_icon.svg" alt="" />
            <div>
              <p style="font-weight: 600; white-space: nowrap; text-align: left;">
                Produtor<br />
                <strong style="font-weight: 200;">${vinho.produtor}</strong>
              </p>
            </div>
          </li>
        </ul>
        <div class="comprar-detalhes">
          <input type="text" value="1" min="1" class="quantidade-detalhes" />
          <button class="btn-detalhes">Adicionar ao Carrinho</button>
        </div>
      </div>
    </section>

    <!-- Seção “Como degustar” dinamicamente -->
    <section class="como-degustar-detalhes">
      <div class="degustacao-detalhes">
        <h2 class="titulo-detalhes">Como degustar</h2>

        <!-- wrapper flex que alinha colunas -->
        <div class="como-degustar">
          <!-- coluna de itens -->
          <div class="como-degustar-itens">
            <c:forEach var="deg" items="${vinho.degustacao}">
              <div class="item-detalhes">
                <!-- Alterado para acessar a propriedade correta "titulo" -->
                <h3><c:out value="${deg.titulo}"/></h3>
                <p><c:out value="${deg.descricao}"/></p>
              </div>
            </c:forEach>
          </div>

          <!-- coluna de barras -->
          <div class="provar-vinho-detalhes">
            <h3 class="titulo-detalhes-vinhos">Prove o vinho</h3>
            <div class="barra-container-detalhes">
              <div class="barra-item-detalhes">
                <span>Fruta</span>
                <div class="barra-detalhes">
                  <div class="barra-preenchida-detalhes"
                       style="width: ${vinho.porcFruta};"></div>
                </div>
              </div>
              <div class="barra-item-detalhes">
                <span>Açúcar</span>
                <div class="barra-detalhes">
                  <div class="barra-preenchida-detalhes"
                       style="width: ${vinho.porcAcucar};"></div>
                </div>
              </div>
              <div class="barra-item-detalhes">
                <span>Acidez</span>
                <div class="barra-detalhes">
                  <div class="barra-preenchida-detalhes"
                       style="width: ${vinho.porcAcidez};"></div>
                </div>
              </div>
              <div class="barra-item-detalhes">
                <span>Tanino</span>
                <div class="barra-detalhes">
                  <div class="barra-preenchida-detalhes"
                       style="width: ${vinho.porcTanino};"></div>
                </div>
              </div>
            </div>
          </div>
        </div> <!-- .como-degustar -->
      </div> <!-- .degustacao-detalhes -->
    </section>

    <!-- Seção de reviews dinamicamente -->
    <section class="reviews-detalhes">
      <h2>Reviews de clientes</h2>
      <div class="reviews">
        <c:forEach var="rev" items="${vinho.reviews}">
          <div class="review-detalhes">
            <p>★★★★★</p>
            <h3>${rev.titulo}</h3>
            <p>${rev.desc}</p>
            <p><strong>${rev.nomePessoa}</strong><br/>${rev.data}</p>
          </div>
        </c:forEach>
      </div>
    </section>
  </main>

  <footer>
    <div class="newsletter">
      <h3>Receba todas as novidades</h3>
      <p>Cadastre seu email abaixo</p>
      <input type="email" placeholder="you@example.com" />
      <button>Enviar</button>
    </div>
    <div class="footer-links">
      <div>
        <h4>Sobre</h4>
        <ul class="links-sobre">
          <li><a href="#">Nossa história</a></li>
          <li><a href="#">Trabalhe Conosco</a></li>
        </ul>
      </div>
      <div>
        <h4>Ajuda</h4>
        <ul class="links-ajuda">
          <li><a href="#">Trocas e devoluções</a></li>
          <li><a href="#">Política de Privacidade</a></li>
          <li><a href="#">Termos e Condições</a></li>
        </ul>
      </div>
    </div>
  </footer>
</body>
</html>
