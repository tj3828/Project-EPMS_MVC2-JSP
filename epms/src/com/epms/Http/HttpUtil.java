package com.epms.Http;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HttpUtil {
	public static void forward(HttpServletRequest request, HttpServletResponse response, String path) {
		try {
			RequestDispatcher rd = request.getRequestDispatcher(path);
			rd.forward(request, response);
		} catch (Exception e) {
			System.out.println("RequestDispatcher ����");
		}
	}
	// HttpUtil.forward(request, response, path) �� �ٷ� ȣ���ؼ� ����ϸ� ��. RequestDispatcher ��ü ���� �ʿ����.
}
