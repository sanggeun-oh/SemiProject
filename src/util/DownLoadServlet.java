package util;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/download")
public class DownLoadServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = getServletContext().getRealPath("/save");
		String filename = request.getParameter("clip");
		File file = new File(path + "/" + filename);
		System.out.println("파일경로 : " + file);
		
		setHeaderType(response, file); // 파일이름설정
		transport(new FileInputStream(file), response.getOutputStream(), file); // 파일전송(다운로드)
	}

	private void setHeaderType(HttpServletResponse response, File file) {
		String mime = getServletContext().getMimeType(file.toString());
		
		if (mime != null)
			mime = "application/octet-stream";
		
		response.setContentType(mime);
		response.setHeader("Content-Disposition", "attachment;filename=" + toEng(file.getName()));
		response.setHeader("Content-Length", "" + file.length());

	}

	private void transport(InputStream in, OutputStream out, File file) throws IOException {
		BufferedInputStream bin = null;
		BufferedOutputStream bos = null;

		try {
			bin = new BufferedInputStream(in);
			bos = new BufferedOutputStream(out);

			byte[] buf = new byte[(int) file.length()];
			int read = 0;
			
			while ((read = bin.read(buf)) != -1) {
				bos.write(buf, 0, read); // 객체, 시작(offset), 길이
			}
		} catch (Exception e) {
			System.out.println("transport error : " + e);
		} finally {
			bos.close();
			bin.close();
		}
	}

	////////////////////////////////////////////////////////////// 한글파일일때, 영어로 전환
	public String toEng(String str) {
		String tmp = null;
		try {
			tmp = new String(str.getBytes("utf-8"), "8859_1");
		} catch (Exception e) {
		}
		
		return tmp;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}



