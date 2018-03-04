package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import db.DBHandler;
import models.User;

import java.util.*;
/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Cross site scripting handler

		boolean hasUser = false;
		boolean userAdded = false;
		String firstName = request.getParameter("firstName");
		String parseFN = request.getParameter("firstName");
		parseFN = parseFN.replaceAll("//", " ");
		parseFN = parseFN.replaceAll("<script>"," ");
		parseFN = parseFN.replaceAll("<"," ");
		parseFN = parseFN.replaceAll(">"," ");
		String lastName = request.getParameter("lastName");
		String parseLN = request.getParameter("lastName");
		parseLN = parseLN.replaceAll("//", " ");
		parseLN = parseLN.replaceAll("<script>"," ");
		parseLN = parseLN.replaceAll("<"," ");
		parseLN = parseLN.replaceAll(">"," ");
		String gender = request.getParameter("gender");
		String username = request.getParameter("new_username");
		String parseUN = request.getParameter("new_username");
		parseUN = parseUN.replaceAll("//", " ");
		parseUN = parseUN.replaceAll("<script>"," ");
		parseUN = parseUN.replaceAll("<"," ");
		parseUN = parseUN.replaceAll(">"," ");
		String password = request.getParameter("new_password");
		String parseP = request.getParameter("new_password");
		parseP = parseP.replaceAll("//", " ");
		parseP = parseP.replaceAll("<script>"," ");
		parseP = parseP.replaceAll("<"," ");
		parseP = parseP.replaceAll(">"," ");
		
		//cross site scripting handling complete
		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			hasUser = DBHandler.shared.hasUser(username);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		if(hasUser)
		{
			map.put("src","images/sad.jpg");
		}
		else if(!firstName.equals(parseFN) || !lastName.equals(parseLN) || !username.equals(parseUN) || !password.equals(parseP))
		{
			hasUser = true;
			map.put("src","images/sad.jpg");
		}
		else
		{
			User user = new User(1,firstName,lastName,gender,0,username,
					password, "images/profile.jpg");
			try {
			userAdded = DBHandler.shared.addUser(user);
			}
			catch (Exception e) {
				System.out.println(e.getMessage());
			}
			map.put("src", "images/happy.jpg");
		}
		
		map.put("hasUser", hasUser);
		map.put("userAdded", userAdded);
		toJson(response,map);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void toJson(HttpServletResponse response, Map<String,Object> map)
	{
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(new Gson().toJson(map));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
