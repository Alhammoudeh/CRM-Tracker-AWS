package com.crm.testdb;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

/**
 * Servlet implementation class TestDbServlet
 */
@WebServlet("/TestDbServlet")
public class TestDbServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//setting up the connection variables
		String user = "CRM_User";
		String pass = "crmuser";
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/crm_customer_tracker?useSSL=false&amp;serverTimezone=UTC";
		String driver = "com.mysql.cj.jdbc.Driver";
		
		//getting connection to the database
		try{
			PrintWriter pw = response.getWriter();
			
			pw.println("Connecting to database: " + jdbcUrl);
			
			Class.forName(driver);
			
			Connection myConnection = DriverManager.getConnection(jdbcUrl, user, pass);
			
			pw.println("Successfully connected.");
			
			myConnection.close();
			
		}
		catch(Exception e){
			e.printStackTrace();
			throw new ServletException(e);
		}
		
	}

}
