package gram.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBUtil {
   // CP 湲곕뒫�씠 �깙�옱�맂 留ㅼ슦 �쑀�슜�븳 �옄諛� 媛앹껜 : �꽌踰꾩쓽 �궡遺� 硫붾え由ъ뿉�꽌 Connection 媛앹껜 諛섑솚
   private static DataSource ds;
   
   static{
      // Server 利� Container�쓽 �꽕�젙 �젙蹂대벑�쓣 �젣怨듯빐二쇰뒗 �솚寃� 媛앹껜
      InitialContext ctx = null;      
      try {
         ctx = new InitialContext();
         
         // lookup() : �옄�썝�뿉 遺��뿬�븳 蹂꾩묶�쑝濡� �빐�떦 �옄�썝�쓽 愿�由ы븯�뒗 媛앹껜 �슂泥��븯�뒗 硫붿꽌�뱶 
         ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
      } catch (NamingException e) {
       
      }
   }
      public static Connection getConnection() throws SQLException{
      return ds.getConnection();
   }
   
   public static void close(Connection conn, Statement stmt) throws SQLException{      
      if(stmt!= null){
         stmt.close();
      }
      if(conn != null){
         conn.close();
      }
   }
   
   public static void close(Connection conn, Statement stmt, ResultSet rset) throws SQLException{
      if(rset != null){
         rset.close();
         rset = null;
      }
      if(stmt != null){
         stmt.close();
      }
      if(conn!=null){
         conn.close();
      }
   }   
}