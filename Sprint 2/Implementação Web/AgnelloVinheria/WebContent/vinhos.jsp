<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Vinhos | Agnello Vinheria</title>
  <link rel="stylesheet" href="style.css" />
  <link rel="stylesheet" href="style2.css" />
  <link rel="icon" type="image/png" href="assets/images/favicon.svg">
</head>
<body>
  <header>
    <nav class="HomeNavBar">
      <ul>
        <li><a class="selecionado" href="vinhos?page=vinhos">VINHOS</a></li>
        <li><a href="sobre.html">SOBRE</a></li>
        <li><a href="clube.html">CLUBE</a></li>
      </ul>
      <a class="logonavbar" href="index.jsp">
        <img src="assets/images/Logo.png" alt="Logo Agnello" />
      </a>
      <div class="search-cart">
        <input class="barradepesquisa" type="text" placeholder="Buscar vinhos" />
        <div class="icones-nav">
          <img src="assets/images/Person.svg" alt="Perfil" />
          <img src="assets/images/Cart.svg" alt="Carrinho" />
        </div>
      </div>
    </nav>
  </header>

  <div class="container">
    <div class="container-conteudo">
      <!-- Filtros laterais -->
      <div class="filtros">
        <h2>Filtros</h2>
        <div class="filtro-box">
          <h3>Tipo</h3>
          <label><input type="checkbox" name="tipo" value="Tinto" /> Tinto</label>
          <label><input type="checkbox" name="tipo" value="Branco" /> Branco</label>
          <label><input type="checkbox" name="tipo" value="Rosé" /> Rosé</label>
        </div>
        <div class="filtro-box">
          <h3>Preço</h3>
          <input type="range" id="priceRange" min="50" max="500" value="500" />
          <span id="priceValue">Até R$1000</span>
        </div>
        <div class="filtro-box">
          <h3>País</h3>
          <label><input type="checkbox" name="pais" value="Espanha" /> Espanha</label>
          <label><input type="checkbox" name="pais" value="Argentina" /> Argentina</label>
          <label><input type="checkbox" name="pais" value="França" /> França</label>
        </div>
        <div class="filtro-box">
          <h3>Uva</h3>
          <label><input type="checkbox" name="uva" value="Malbec" /> Malbec</label>
          <label><input type="checkbox" name="uva" value="Syrah" /> Syrah</label>
          <label><input type="checkbox" name="uva" value="Grenache" /> Grenache</label>
        </div>
      </div>

      <!-- Produtos exibidos -->
      <div class="produtos">
        <div class="ordenar">
          <p>Mostrar apenas:</p>
          <div class="ordenar-botoes">
            <button id="btnMaisVendidos">Mais Vendidos</button>
            <button id="btnMenorPreco">Menor Preço</button>
            <button id="btnMaiorPreco">Maior Preço</button>
          </div>
        </div>

        <div class="products-vinhos">
          <c:forEach var="vinho" items="${listaVinhos}" varStatus="status">
            <div class="product-vinhos" 
                 data-type="${vinho.tipo}" 
                 data-price="${vinho.preco}" 
                 data-country="${vinho.origem}" 
                 data-grape="${vinho.uva}">
              <img src="${vinho.imagem}" alt="${vinho.nome}" />
              <div class="product-vinhos-info">
                <h4 class="product-vinhos-title">${vinho.nome}</h4>
                <p class="product-vinhos-price">R$ ${vinho.preco}</p>
                <a href="detalhes?id=${status.index}">Ver detalhes do produto</a>
                <div class="vinhos-cart-options">
                  <input type="text" value="1" min="1" />
                  <button>Adicionar</button>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>

        <div class="products-vinhos">
          <c:forEach var="vinho" items="${listaVinhos}" varStatus="status">
            <div class="product-vinhos" 
                 data-type="${vinho.tipo}" 
                 data-price="${vinho.preco}" 
                 data-country="${vinho.origem}" 
                 data-grape="${vinho.uva}">
              <img src="${vinho.imagem}" alt="${vinho.nome}" />
              <div class="product-vinhos-info">
                <h4 class="product-vinhos-title">${vinho.nome}</h4>
                <p class="product-vinhos-price">R$ ${vinho.preco}</p>
                <a href="detalhes?id=${status.index}">Ver detalhes do produto</a>
                <div class="vinhos-cart-options">
                  <input type="text" value="1" min="1" />
                  <button>Adicionar</button>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>

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
  
  <script src="scripts/filtro.js"></script>
</body>
</html>
