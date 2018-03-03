package servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import db.DBHandler;
import models.Room;

/**
 * Servlet implementation class AddRoomServlet
 */
@WebServlet("/AddRoomServlet")
public class AddRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRoomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String roomImage = (String)request.getParameter("roomImage");
		String roomType = (String)request.getParameter("roomType");
		double roomPrice = Double.valueOf(request.getParameter("roomPrice"));
		String balcony = (String)request.getParameter("balcony");
		String setBox = (String)request.getParameter("setBox");
		String coolingSystem = (String)request.getParameter("coolingSystem");
		Room room = new Room();
		room.setRoomImage(roomImage);
		room.setRoomType(roomType);
		room.setRoomPrice(roomPrice);
		room.setBalcony(balcony);
		room.setSetBox(setBox);
		room.setCoolingSystem(coolingSystem);
		boolean addRoom = DBHandler.shared.addRoom(room);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("isAdded", addRoom);
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
