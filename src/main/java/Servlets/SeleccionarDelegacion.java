/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlets;

import Metodos.Validaciones;
import Modelo.MNegocio;
import Modelo.Municipios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MARIA DEL REFUGIO
 */
public class SeleccionarDelegacion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Validaciones val = new Validaciones();
            Vector<Municipios> mun = new Vector<Municipios>();
            Municipios aux_mun = new Municipios();
            Municipios del = new Municipios();
            MNegocio neg = new MNegocio();
            HttpSession sesionneg = request.getSession();
            neg = (MNegocio) sesionneg.getAttribute("Negocio");
            String pagina = "error.html", alcaldia;
            int longitud = 0;
            if(neg != null){
                pagina = "error_neg.jsp";
                alcaldia = request.getParameter("Alcaldia");
                mun = aux_mun.Delegaciones();
                if(mun != null){
                    longitud = mun.size();
                    if(val.Validar_Delegacion(alcaldia, longitud)){
                        del = mun.elementAt(Integer.parseInt(alcaldia));
                        sesionneg.setAttribute("Delegacion", del);
                        pagina = "agregarcliente.jsp";
                    }
                }
            }
            response.sendRedirect(pagina);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
