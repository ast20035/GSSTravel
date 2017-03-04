package controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import model.TravelService;

@WebServlet("/fileupload")
public class fileupload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TravelService travelService =new TravelService();
	
	int yourMaxMemorySize = 1024 * 1024 * 1024;
	File yourTempDirectory = new File("/tmp");
	int yourMaxRequestSize = 100 * 1024 * 1024;
	String allowedFileTypes = ".txt .pdf .doc .ppt .xls .csv .dbf .gif .jpg .jpeg .png .swf .htm .html .zip .rar";
    public fileupload() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		File saveFolder=new File("C:\\travel");
		if (!saveFolder.exists()) {
			saveFolder.mkdirs();
		}
		HttpSession session = request.getSession();
		String tra_No=session.getAttribute("tra_No").toString();
		String tra_Name=session.getAttribute("tra_Name").toString();
		String saveDirectory = "C:\\travel\\";	
		List<String>error=new ArrayList<>();

		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		DiskFileItemFactory factory = new DiskFileItemFactory(yourMaxMemorySize, yourTempDirectory);
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(yourMaxRequestSize);
		ProgressListener progressListener = new ProgressListener() {
			private long megaBytes = -1;
			public void update(long pBytesRead, long pContentLength, int pItems) {
				long mBytes = pBytesRead / 1000000;
				if (megaBytes == mBytes) {
					return;
				}
				megaBytes = mBytes;
			}
		};
		upload.setProgressListener(progressListener);
		try {
			List items = upload.parseRequest(request);
			Iterator iter = items.iterator();
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();
				if (item.isFormField()) {      
					String name = item.getFieldName();					
					String value = item.getString("UTF-8");
				} else {                    
					String fieldName = item.getFieldName();
					String fileName = item.getName();
					String contentType = item.getContentType();					
					boolean isInMemory = item.isInMemory();
					long sizeInBytes = item.getSize();
					if (fileName != null && !"".equals(fileName)) {						
							fileName = FilenameUtils.getName(fileName);
							String extension = FilenameUtils.getExtension(fileName);							
							if (allowedFileTypes.indexOf(extension.toLowerCase()) != -1) {
								File uploadedFile = new File(saveDirectory, fileName);
								item.write(uploadedFile);
								request.setAttribute("fileName", fileName);
								travelService.updateraFile(fileName, tra_No);
							} else {
								error.add("檔案格式不對");
							}					 
					}else {
						error.add("沒有選擇檔案");
					}
				}
			}
		} catch (FileUploadBase.SizeLimitExceededException ex1) {
			error.add("檔案超過100MB");			
		} catch (Exception e) {
			e.printStackTrace();
		}	
		if(error.size()!=0){
			request.setAttribute("error", error);
			request.getRequestDispatcher("/fileupload_control.jsp").forward(request, response);
			return;
		}else{
			session.removeAttribute("tra_No");
			session.removeAttribute("tra_Name");
			request.setAttribute("tra_No", tra_No);
			request.setAttribute("tra_Name", tra_Name);
			
			request.getRequestDispatcher("/newTravelFile.jsp").forward(request, response);
			return;
		}

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
