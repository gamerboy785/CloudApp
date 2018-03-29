package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBHandler;
import com.google.gson.Gson;

import java.util.*;


/**
 * Servlet implementation class CheckAvailabilityServlet
 */
@WebServlet("/CheckAvailabilityServlet")
public class CheckAvailabilityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckAvailabilityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		boolean isAvail = false;
		int roomID = Integer.parseInt(request.getParameter("roomID"));
		int month = Integer.parseInt(request.getParameter("month"));	
		int day = Integer.parseInt(request.getParameter("day"));	
		int year = Integer.parseInt(request.getParameter("year"));	
		
		Calendar startDate = Calendar.getInstance();
		startDate.set(year, month-1, day);
		
		int month2 = Integer.parseInt(request.getParameter("month2"));	
		int day2 = Integer.parseInt(request.getParameter("day2"));	
		int year2 = Integer.parseInt(request.getParameter("year2"));	
		
		Calendar endDate = Calendar.getInstance();
		endDate.set(year2, month2-1, day2);
		
		isAvail = DBHandler.shared.isAvailable(roomID,startDate,endDate);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("isAvail", isAvail);
		toJson(response,map);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void toJson(HttpServletResponse response,Map<String,Object> map)
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