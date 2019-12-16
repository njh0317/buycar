package pro2;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingListener;
import javax.servlet.http.HttpSessionBindingEvent;
import java.util.Hashtable;
import java.util.Enumeration;



public class LoginManager implements HttpSessionBindingListener{
	private static LoginManager loginManager = null;
	private static Hashtable loginUsers = new Hashtable();
	private LoginManager()
	{
		super();
	}
	public static synchronized LoginManager getInstance()
	{
		if(loginManager == null)
			loginManager = new LoginManager();
		return loginManager;
	}
	public boolean isLogin(String sessionID)
	{
		boolean isLogin = false;
		Enumeration e = loginUsers.keys();
		String key = "";
		while(e.hasMoreElements())
		{
			key = (String)e.nextElement();
			if(sessionID.equals(key))
				isLogin=true;
			
		}
		return isLogin;
	}
	public boolean isUsing(String userID)
	{
		boolean isUsing = false;
		Enumeration e = loginUsers.keys();
		String key ="";
		while(e.hasMoreElements())
		{
			key = (String)e.nextElement();
			if(userID.equals(loginUsers.get(key)))
			{
				isUsing = true;
			}
		}
		return isUsing;
	}
	public void setSession(HttpSession session, String userID)
	{
		loginUsers.put(session.getId(), userID);
		session.setAttribute("login", this.getInstance());
	}

	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		loginUsers.remove(event.getSession().getId());
		
	}
	public String getUserID(String sessionID) {
		return (String)loginUsers.get(sessionID);
	}
	public int getUserCount()
	{
		return loginUsers.size();
	}
}
