package xyz.xioaxin12.web;

import org.apache.commons.beanutils.BeanUtils;
import xyz.xioaxin12.constant.Constants;
import xyz.xioaxin12.domain.Order;
import xyz.xioaxin12.domain.OrderItem;
import xyz.xioaxin12.domain.Product;
import xyz.xioaxin12.domain.User;
import xyz.xioaxin12.exception.OrderException;
import xyz.xioaxin12.exception.PrivilegeException;
import xyz.xioaxin12.factory.OrderServiceFactory;
import xyz.xioaxin12.service.OrderService;
import xyz.xioaxin12.utils.IdRandom;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 订单管理
 * @author 爱生活爱技术
 */
public class OrderServlet extends HttpServlet {
    private OrderService service = OrderServiceFactory.getInstance();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
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
            addOrder(request, response);
        }else if("search".equals(method)){
            searchOrder(request,response);
        }else if("del".equals(method)){
            delOrder(request,response);
        }
    }

    /**
     * 删除订单
     * @param request
     * @param response
     * @throws IOException
     */
    private void delOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //获得订单id
        String id = request.getParameter("id");

        try {
            service.delete(id);
            // 再次查询订单，更新
            response.sendRedirect(request.getContextPath()
                    + "/order?method=search");
        } catch (OrderException e) {
            e.printStackTrace();
        }

    }

    /**
     * 显示订单
     * @param request
     * @param response
     */
    private void searchOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute(Constants.HTTPSESSION_USER);
        if(user == null){
            response.getWriter().write(
                    "请先<a href='" + request.getContextPath()
                            + "/index.jsp'>登录</a>");
            return;
        }

        try {
            List<Order> orders = service.find(user);
            request.setAttribute(Constants.HTTPSESSION_ORDERS,orders);
            request.getRequestDispatcher(request.getContextPath()+"/showOrder.jsp").forward(request,
                    response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (PrivilegeException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()
                    + "/error/error.jsp");
            return;
        }
    }

    /**
     * 添加订单
     * @param request
     * @param response
     * @throws IOException
     */
    private void addOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Order order = new Order();

        //获取数据
        try {
            BeanUtils.populate(order, request.getParameterMap());
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        order.setId(IdRandom.getRandom());
        User user = (User) request.getSession().getAttribute(Constants.HTTPSESSION_USER);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/error/error.jsp");
            return;
        }
        order.setUser_id(user.getId());

        //订单项封装到订单中,得到购物车
        Map<Product, Integer> cart = (Map<Product, Integer>) request
                .getSession().getAttribute(Constants.HTTPSESSION_SHOPPING);

        List<OrderItem> items = new ArrayList<OrderItem>();
        for (Product p : cart.keySet()) {
            OrderItem item = new OrderItem();
            order.setBookname(p.getName());
            item.setOrder_id(order.getId());
            item.setProduct_id(p.getId());
            item.setBuynum(cart.get(p));
            items.add(item);
        }
        order.setOrderItems(items);

        try {
            service.add(user, order);

            //清空购物车
            if (cart.size() != 0) {
                request.getSession().removeAttribute(Constants.HTTPSESSION_SHOPPING);
            }

            response.getWriter().write(
                    "下单成功,<a href='" + request.getContextPath()
                            + "/index.jsp'>继续购物</a>，<a href='"
                            + request.getContextPath()
                            + "/order?method=search'>查看订单</a>");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
