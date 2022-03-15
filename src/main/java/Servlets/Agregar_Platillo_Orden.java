/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlets;

import Metodos.AES;
import Metodos.Validaciones;
import Modelo.CPlatillo;
import Modelo.MNegocio;
import Modelo.Orden_Platillos;
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
public class Agregar_Platillo_Orden extends HttpServlet {

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
            HttpSession sesionneg = request.getSession();
            MNegocio neg = new MNegocio();
            neg = (MNegocio) sesionneg.getAttribute("Negocio");
            String platillo, cantidad, pagina = "error.html"; 
            AES aes = new AES();
            if(neg != null){
                pagina = "error_neg.jsp";
                platillo = request.getParameter("Platillo");
                cantidad = request.getParameter("Cantidad");
                Validaciones val = new Validaciones();
                Vector<CPlatillo> plat = new Vector<CPlatillo>();
                CPlatillo pla = new CPlatillo();            
                plat = pla.Platillos(neg.getId_mneg());
                int longitud = 0, indice = 0, cant, costo;
                Vector<Orden_Platillos> voplat = new Vector<Orden_Platillos>();
                voplat = (Vector<Orden_Platillos>)sesionneg.getAttribute("Vector_Orden");
                Orden_Platillos ins = new Orden_Platillos();
                if(plat != null && voplat != null){
                    if(plat.size() > 0){
                        longitud = plat.size();
                        if(val.Validar_Agregar_Platillo_Orden(platillo, cantidad, longitud)){
                            indice = Integer.parseInt(platillo);
                            pla = plat.elementAt(indice);
                            cant = Integer.parseInt(cantidad);
                            int num = Integer.parseInt(pla.getCos_cpla());
                            costo = num * cant;
                            ins = new Orden_Platillos(pla.getNom_cpla(), pla.getId_cpla(), cant, costo);
                            voplat.add(ins);
                            sesionneg.setAttribute("Vector_Orden", voplat);
                            pagina = "agregarorden.jsp";
                        }
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
