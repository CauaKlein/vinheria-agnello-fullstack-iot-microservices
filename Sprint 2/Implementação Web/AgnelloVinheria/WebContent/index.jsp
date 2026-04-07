<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="br.com.agnellovinheria.model.Vinho" %>
<%@ page import="br.com.agnellovinheria.service.VinhoService" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Recupera a lista de vinhos e seta como atributo para utilização do JSTL
    List<Vinho> vinhos = VinhoService.getVinhos();
    request.setAttribute("listaVinhos", vinhos);
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Agnello Vinheria</title>
  <link rel="stylesheet" href="style.css" />
  <link rel="icon" type="image/png" href="assets/images/favicon.svg">
</head>
<!-- Popup de verificação de idade -->
<div id="agePopup" class="popup">
  <div class="popup-content">
    <img src="assets/images/LogoPopUp.svg" alt="" />
    <p>
      Você deve ser maior de 18<br /> anos para acessar o site.
    </p>
    <div>
      <button class="naomaior18" onclick="window.location.href='https://www.google.com'">
        Ainda não tenho 18 anos
      </button>
      <button onclick="setAgeVerified()">Sou maior de 18 anos</button>
    </div>
    <label class="labelcheckpopup">
      <input type="checkbox" id="rememberMe" /> Lembre de mim
    </label>
  </div>
</div>
<body>
  <header>
    <nav class="HomeNavBar">
      <ul>
        <li><a href="vinhos?page=vinhos">VINHOS</a></li>
        <li><a href="sobre.html">SOBRE</a></li>
        <li><a href="clube.html">CLUBE</a></li>
      </ul>
      <a class="logonavbar" href="index.jsp">
        <img src="assets/images/Logo.png" alt="" />
      </a>
      <div class="search-cart">
        <input class="barradepesquisa" type="text" placeholder="Buscar vinhos" />
        <div class="icones-nav">
          <img src="assets/images/Person.svg" alt="" />
          <img src="assets/images/Cart.svg" alt="" />
        </div>
      </div>
    </nav>
    <div class="hero">
      <h2>EXPLORE NOSSA COLEÇÃO</h2>
    </div>
  </header>
  <main>
    <section class="best-sellers">
      <div class="best-sellers-header">
        <h3>BEST SELLERS</h3>
      </div>
      <div class="products">
        <!-- Itera sobre a lista de vinhos fornecida pelo Servlet -->
        <c:forEach var="vinho" items="${listaVinhos}" varStatus="status">
          <div class="product">
            <img src="${vinho.imagem}" alt="${vinho.nome}" />
            <div class="product-info">
              <h4 class="product-title">${vinho.nome}</h4>
              <p class="product-price">R$ ${vinho.preco}</p>
              <a href="detalhes?id=${status.index}">Ver detalhes do produto</a>
              <div class="cart-options">
                <input type="text" value="2" min="1" />
                <button>Adicionar ao Carrinho</button>
              </div>
            </div>
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
  <script src="scripts/script.js"></script>
</body>
</html>
