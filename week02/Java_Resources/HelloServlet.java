package week02;

import jakarta.servlet.ServletException;
import.java.io.PrintWriter;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/HelloServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public HelloServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get 방식으로 요청한 경우 실행되는 메서드
		// 웹 페이지에 출력되는 내용을 HTML 코드를 포함하여 기술
		
		//응답할 때 한글타입 설정
	    response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<h1>Hello Servlet 결과 페이지입니다.</h1>");
		out.println("</body></html>");
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // post 방식으로 요청한 경우 실행되는 메서드
	    // 웹페이지에 출력되는 내용을 html 코드를 포함하여 기술
	    // get 방식 처리내용과 동일하다면 doGet() 메서드 호출해서 처리
		doGet(request, response);
	}

}
