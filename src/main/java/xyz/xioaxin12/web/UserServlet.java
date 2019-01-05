package xyz.xioaxin12.web;

import org.apache.commons.beanutils.BeanUtils;
import xyz.xioaxin12.constant.Constants;
import xyz.xioaxin12.domain.User;
import xyz.xioaxin12.exception.MyLoginException;
import xyz.xioaxin12.exception.RegistException;
import xyz.xioaxin12.service.UserService;
import xyz.xioaxin12.service.impl.UserServiceImpl;
import xyz.xioaxin12.utils.IdRandom;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;

/**
 * 用户注册 登陆
 *
 * @author 爱生活爱技术
 */
public class UserServlet extends HttpServlet {

    private UserService service = new UserServiceImpl();

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

        //判断执行什么方法
        String method = request.getParameter("method");
        if ("regist".equals(method)) {
            registUser(request, response);
        } else if ("login".equals(method)) {
            loginUser(request, response);
        } else if ("logout".equals(method)) {
            logoutUser(request, response);
        }
    }

    /**
     * 用户注销
     *
     * @param request
     * @param response
     * @throws IOException
     */
    private void logoutUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //销毁session
        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath() + "index.jsp");
    }

    /**
     * 登陆
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void loginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取表单的值
        String name = request.getParameter("name");
        String passsword = request.getParameter("password");
        try {
            User user = service.loginUser(name, passsword);

            // 用户如果登录成功，判断是否勾选了记住用户名.
            String saveUsername = request.getParameter("checkbox");
            if ("on".equals(saveUsername)) {
                // 记住用户名,存储utf-8码
                Cookie cookie = new Cookie("saveusername",
                        URLEncoder.encode(name, "utf-8"));
                // 可以记住7天
                cookie.setMaxAge(7 * 24 * 60 * 60);
                cookie.setPath("/");
                response.addCookie(cookie);
            } else {
                Cookie cookie = new Cookie("saveusername",
                        URLEncoder.encode(name, "utf-8"));
                cookie.setMaxAge(0);
                cookie.setPath("/");
                response.addCookie(cookie);
            }


            if (user != null) {
                //有值则存入session中
                request.getSession().invalidate();
                request.getSession().setAttribute(Constants.HTTPSESSION_USER, user);
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            } else {
                //不然转发输出错误信息
                request.setAttribute("login.message", "用户名或密码错误");
                request.getRequestDispatcher(request.getContextPath() + "/login.jsp").forward(request, response);
            }

        } catch (MyLoginException e) {
            e.printStackTrace();
            request.setAttribute("login.message", e.getMessage());
            request.getRequestDispatcher(request.getContextPath() + "/login.jsp").forward(request, response);
            return;
        }
    }

    /**
     * 注册
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void registUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //验证码校对
        String checkcode = request.getParameter("checkcode");

        String checkcodes = (String) request.getSession().getAttribute("checkcode_session");

        request.getSession().removeAttribute("checkcode_session");
        System.out.println(checkcode);

        //若为空或者不一致，转发到注册页面
        if ((checkcodes == null) || (!checkcodes.equals(checkcode))) {
            request.setAttribute("regist.message", "验证码不正确");
            request.getRequestDispatcher(request.getContextPath() + "/register.jsp").forward(request, response);
            return;
        }

        User user = new User();
        //设置id为随机值
        user.setId(IdRandom.getRandom());
        //得到请求参数，封装到javaBean中
        try {
            //使用apache的BeanUtils工具进行封装
            BeanUtils.populate(user, request.getParameterMap());
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        try {
            service.regitsUser(user);

        } catch (RegistException e) {
            request.setAttribute("regist.message", e.getMessage());
            request.getRequestDispatcher(request.getContextPath() + "/register.jsp").forward(request, response);
            return;
        }
        response.getWriter().write("注册成功！2秒后转向登陆界面");
        response.setHeader("Refresh", "2;URL=" + request.getContextPath() + "/login.jsp");

    }
}
