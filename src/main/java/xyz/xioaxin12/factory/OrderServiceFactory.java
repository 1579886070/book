package xyz.xioaxin12.factory;

import xyz.xioaxin12.annotation.PrivilegeInfo;
import xyz.xioaxin12.dao.PrivilegeDao;
import xyz.xioaxin12.domain.User;
import xyz.xioaxin12.exception.PrivilegeException;
import xyz.xioaxin12.service.OrderService;
import xyz.xioaxin12.service.impl.OrderServiceImpl;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class OrderServiceFactory{
        private static OrderService service = new OrderServiceImpl();

        public static OrderService getInstance() {

            return (OrderService) Proxy.newProxyInstance(service.getClass()
                            .getClassLoader(), service.getClass().getInterfaces(),
                    new InvocationHandler() {

                        public Object invoke(Object proxy, Method method,
                                             Object[] args) throws IllegalAccessException,
                                IllegalArgumentException, InvocationTargetException {
                            // 1.判断是否有注解
                            if (method.isAnnotationPresent(PrivilegeInfo.class)) {
                                // 2。得到注册对象
                                PrivilegeInfo pif = method
                                        .getAnnotation(PrivilegeInfo.class);
                                // 3.得到权限名称
                                String pname = pif.value();

                                // 4.得到用户
                                User user = (User) args[0];

                                if (user == null) {
                                    throw new PrivilegeException();
                                }
                                // 5.根据用户查询是否具有权限
                                PrivilegeDao pdao = new PrivilegeDao();
                                if (!pdao.checkPrivilege(user.getRole(), pname)) {
                                    throw new PrivilegeException(); // 抛出权限不足异常

                                }

                            }

                            return method.invoke(service, args);

                        }
                    });

        }
}
