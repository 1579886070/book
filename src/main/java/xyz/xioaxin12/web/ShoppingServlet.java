package xyz.xioaxin12.web;

import xyz.xioaxin12.constant.Constants;
import xyz.xioaxin12.domain.Product;
import xyz.xioaxin12.service.ProductService;
import xyz.xioaxin12.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 * 购物车管理
 * @author 爱生活爱技术
 */
public class ShoppingServlet extends HttpServlet {
    private ProductService service = new ProductServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//      设置输入的编码格式为utf-8
        request.setCharacterEncoding("utf8");
//		设置输入的编码格式为utf-8
        response.setCharacterEncoding("utf8");
//		给浏览器的标示，该字体为text/html
        response.setContentType("text/html");

        String method = request.getParameter("method");
        if ("add".equals(method)) {
            addShopping(request, response);
        }
        else if("remove".equals(method)){
            removeShopping(request,response);
        }else if("update".equals(method)){
            updateShopping(request,response);
        }

    }

    private void updateShopping(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        int count = Integer.parseInt(request.getParameter("count"));

        // 这是要修改的商品
        Product p = new Product();
        p.setId(id);

        // 得到购物车
        Map<Product, Integer> shopping = (Map<Product, Integer>) request
                .getSession().getAttribute("shopping");

        // 修改商品的数量
        if (count == 0) {
            shopping.remove(p); // 将商品从购物车中移除
        } else {
            shopping.put(p, count);
        }
        request.getSession().setAttribute("shopping", shopping);

        response.sendRedirect(request.getContextPath() + "/showshopping.jsp");

    }

    /**
     * 清空购物车
     * @param request
     * @param response
     * @throws IOException
     */
    private void removeShopping(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 得到购物车
        Map<Product, Integer> cart = (Map<Product, Integer>) request
                .getSession().getAttribute(Constants.HTTPSESSION_SHOPPING);

        if (cart.size() != 0) {
            request.getSession().removeAttribute(Constants.HTTPSESSION_SHOPPING);
        }

        response.sendRedirect(request.getContextPath() + "/showshopping.jsp");
    }

    /**
     * 添加到购物车
     * @param request
     * @param response
     * @throws IOException
     */
    private void addShopping(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        try {
            Product product = service.findById(id);
            HttpSession session = request.getSession();
            Map<Product, Integer> shopping = (Map<Product, Integer>) session
                    .getAttribute(Constants.HTTPSESSION_SHOPPING);

            // 如果shopping不存在，说明是第一次购物.
            if (shopping == null) {
                shopping = new HashMap<Product, Integer>();
            }
            // 判断购物车中是否有要添加商品。

            Integer count = shopping.put(product, 1);
            if (count != null) {
                // 说明有
                shopping.put(product, count + 1);
            }

            session.setAttribute(Constants.HTTPSESSION_SHOPPING, shopping);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath()+"/index.jsp");
    }
}
