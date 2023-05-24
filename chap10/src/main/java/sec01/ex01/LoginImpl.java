package sec01.ex01;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.tomcat.jni.User;


@WebListener
public class LoginImpl implements HttpSessionListener {
	String user_id;
	String user_pw;
	static int total =0;
	

    public LoginImpl() {
    }

    public LoginImpl(String user_id, String user_pw) {
    	this.user_id= user_id;
    	this.user_pw = user_pw;
    }

    public void sessionCreated(HttpSessionEvent se)  { 
    	++ total;
    }


    public void sessionDestroyed(HttpSessionEvent se)  { 
    	-- total;
    }
	
}
