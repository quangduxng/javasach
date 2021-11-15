package dao;

import java.sql.Connection;
import java.sql.DriverManager;
// sa 1234
public class DungChung {
	public Connection cn;
    public void KetNoi() throws Exception{
   	 //;B1: Xac dinh hqtcsdl
   	 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
   cn= DriverManager.getConnection("jdbc:sqlserver://QUANGDUXNG:1433;databaseName=QlSach;user=sa; password=1234");
    System.out.println("Da ket noi");
    }
}