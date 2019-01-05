package xyz.xioaxin12.web;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import xyz.xioaxin12.constant.Constants;
import xyz.xioaxin12.domain.Product;
import xyz.xioaxin12.domain.User;
import xyz.xioaxin12.exception.PrivilegeException;
import xyz.xioaxin12.factory.ProductServiceFactory;
import xyz.xioaxin12.service.ProductService;
import xyz.xioaxin12.utils.IdRandom;
import xyz.xioaxin12.utils.UploadUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 文件上传操作
 *
 * @author 爱生活爱技术
 */
public class AddProductServlet extends HttpServlet {
    private ProductService service = ProductServiceFactory.getInstance();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> map = new HashMap<String, String[]>();

        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(1024 * 1024 * 5);
        factory.setRepository(new File(this.getServletContext().getRealPath("/temp")));

        ServletFileUpload upload = new ServletFileUpload(factory);
        if (upload.isMultipartContent(request)) {
            upload.setHeaderEncoding("utf-8");
        }

        try {
            List<FileItem> items = upload.parseRequest(request);

            for (FileItem item : items) {
                if (item.isFormField()) {
                    String fieldName = item.getFieldName();
                    String value = item.getString("utf-8");

                    map.put(fieldName, new String[]{value});
                } else {
                    String fileName = item.getName();
                    //得到名称
                    fileName = UploadUtils.subFileName(fileName);

                    //得到随机名称
                    String uuidFileName = UploadUtils.getRandomFileName(fileName);

                    //得到随机目录
                    String randomDir = UploadUtils.getRandomDir(uuidFileName);

                    String path = this.getServletContext().getRealPath("/upload" + randomDir);

                    File pathFile = new File(path);
                    if (!pathFile.exists()) {
                        pathFile.mkdirs();
                    }

                    String imgurl = "/upload" + randomDir + "/" + uuidFileName;
                    map.put("imgurl", new String[]{imgurl});

                    try {
                        //文件上传
                        item.write(new File(pathFile, uuidFileName));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }

        map.put("id", new String[]{IdRandom.getRandom()});
        Product product = new Product();

        try {
            BeanUtils.populate(product, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        User user = (User) request.getSession().getAttribute(Constants.HTTPSESSION_USER);
        try {
            service.addProduct(user, product);
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (PrivilegeException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()
                    + "/error/error.jsp");
            return;
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
