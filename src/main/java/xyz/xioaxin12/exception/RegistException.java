package xyz.xioaxin12.exception;

/**
 * 注册自定义异常
 * @author 爱生活爱技术
 */

public class RegistException extends Exception {

    public RegistException() {
        super();
    }


    public RegistException(String message, Throwable cause) {
        super(message, cause);
    }

    public RegistException(String message) {
        super(message);
    }

    public RegistException(Throwable cause) {
        super(cause);
    }

}