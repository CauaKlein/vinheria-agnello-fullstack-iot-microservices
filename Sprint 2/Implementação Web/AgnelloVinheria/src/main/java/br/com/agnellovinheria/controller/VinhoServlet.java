package br.com.agnellovinheria.controller;

import br.com.agnellovinheria.service.VinhoService;
import br.com.agnellovinheria.model.Vinho;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/vinhos")
public class VinhoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Vinho> vinhos = VinhoService.getVinhos();
        request.setAttribute("listaVinhos", vinhos);

        String pagina = request.getParameter("page");
        if ("vinhos".equals(pagina)) {
            request.getRequestDispatcher("/vinhos.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}
