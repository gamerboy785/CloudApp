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
 * Servlet implementation class BookRoomServlet
 */
@WebServlet("/BookRoomServlet")
public class BookRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookRoomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int roomID = Integer.parseInt(request.getParameter("bookRoomID"));		
		User user = (User)request.getSession().getAttribute("user");
		int userID = user.get_id();
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
		
		boolean isBooked = false;
		Map<String,Object> map = new HashMap<String,Object>();
		
		synchronized(request.getServletContext())
		{
			if(!DBHandler.shared.isAvailable(roomID,startDate,endDate))
			{
				map.put("isBooked", isBooked);
				toJson(response,map);
				return;
			}
			Calendar date = Calendar.getInstance();
			date.set(year, month-1, day);
			isBooked = DBHandler.shared.bookRoom(userID, roomID, startDate,endDate);
			map.put("isBooked", isBooked);
			toJson(response,map);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void toJson(HttpServletResponse response, Map<String,Object> map)
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
