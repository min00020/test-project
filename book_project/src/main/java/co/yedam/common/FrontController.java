package co.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.book.web.BookInfoControl;
import co.yedam.book.web.BookMainControl;

public class FrontController extends HttpServlet {

	// init > service
	Map<String, Command> map = new HashMap<>();

	@Override
	public void init(ServletConfig config) throws ServletException {
		//강현진
		map.put("/main.do", new MainPageControl()); //메인 페이지
		map.put("/bookmain.do", new BookMainControl()); //
		map.put("/bookInfo.do", new BookInfoControl()); //상세 페이지
		
		
	}

	@Override //호출할 때마다 실행하는건 서비스, init은 처음에만 실행
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		System.out.println("FrontController");
		String uri = req.getRequestURI();
		String context = req.getServletContext().getContextPath(); 
		String page = uri.substring(context.length()); 
		System.out.println(page); 
		
		Command controller = map.get(page);
		System.out.println(page);
		controller.execute(req, resp);

	}
}
