package xyz.xioaxin12.web;

import xyz.xioaxin12.constant.Constants;
import xyz.xioaxin12.domain.Product;
import xyz.xioaxin12.domain.User;
import xyz.xioaxin12.exception.PrivilegeException;
import xyz.xioaxin12.factory.ProductServiceFactory;
import xyz.xioaxin12.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * 图书商品管理
 * @author 爱生活爱技术
 */
public class ProductServlet extends HttpServlet {
    private ProductService service = ProductServiceFactory.getInstance();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        设置输入的编码格式为utf-8
        request.setCharacterEncoding("utf8");
//		设置输入的编码格式为utf-8
        response.setCharacterEncoding("utf8");
//		给浏览器的标示，该字体为text/html
        response.setContentType("text/html");

        String method = request.getParameter("method");
        if("findAll".equals(method)||method == null){
            findAllProduct(request,response);
        }else if("findById".equals(method)){
            findByIdProduct(request,response);
        }else if("findProduct".equals(method)){
            findProduct(request,response);
        }else if("delById".equals(method)){
            delByIdProduct(request,response);
        }
    }

    /**
     * 删除图书
     * @param request
     * @param response
     */
    private void delByIdProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        try {
            service.delete(id);

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("图书删除失败，已有用户下单该图书。3秒后转向首页");
            response.setHeader("Refresh", "3;URL=" + request.getContextPath() + "/index.jsp");
            return;
        }
        response.sendRedirect(request.getContextPath()
                + "/product?method=findProduct");
    }

    /**
     * 图书删除管理
     * 查询所有返回到deleteproduct.jsp
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void findProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = null;
        User user = (User) request.getSession().getAttribute(Constants.HTTPSESSION_USER);
        try {
            productList = service.findAlldel(user);
            request.setAttribute(Constants.HTTPSESSION_PRODUCTLIST, productList);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (PrivilegeException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()
                    + "/error/error.jsp");
            return;
        }
        request.getRequestDispatcher(request.getContextPath() + "/deleteproduct.jsp").forward(request, response);
    }

    /**
     * 根据id查询
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void findByIdProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        try{
            Product product = service.findById(id);
            request.setAttribute(Constants.HTTPSESSION_PRODUCT,product);
            request.getRequestDispatcher(request.getContextPath()+"/productInfo.jsp").forward(request,response);
        }catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    /**
     * 查询所有返回到bookpage.jsp
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void findAllProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = null;
        try {
            productList = service.findAll();
            request.setAttribute(Constants.HTTPSESSION_PRODUCTLIST, productList);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher(request.getContextPath() + "/bookpage.jsp").forward(request, response);

    }
}
