package netscript.pojo;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;
 
public class PoolCon extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	//database connection from pooling
	public Connection getDbConnection() throws NamingException, SQLException
    	{
        	Context envContext = null;
            envContext = new InitialContext();
            Context initContext  = (Context)envContext.lookup("java:/comp/env");
            DataSource ds = (DataSource)envContext.lookup("java:/comp/env/jdbc/sesdb");
            return ds.getConnection();
        
    	}
}