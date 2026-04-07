package br.com.agnellovinheria.controller;

import br.com.agnellovinheria.service.VinhoService;
import br.com.agnellovinheria.model.Vinho;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/detalhes")
public class DetalhesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        int id = 0;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/vinhos?page=vinhos");
            return;
        }

        List<Vinho> vinhos = VinhoService.getVinhos();
        if (id < 0 || id >= vinhos.size()) {
            response.sendRedirect(request.getContextPath() + "/vinhos?page=vinhos");
            return;
        }

        Vinho vinho = vinhos.get(id);
        request.setAttribute("vinho", vinho);
        request.getRequestDispatcher("/detalhes.jsp").forward(request, response);
    }
}