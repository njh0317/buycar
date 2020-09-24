package pro2;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
 


public class MemberDAO 
{
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:xe"; // Oracle
	public static final String USER_NAME = "project"; // Oracle user ID
	public static final String USER_PASSWD = "comp322";

    private static MemberDAO instance;

    private MemberDAO(){}
    public static MemberDAO getInstance(){
        if(instance==null)
            instance=new MemberDAO();
        return instance;
    }
    
 
    public void insertMember(MemberBean member) throws SQLException
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
   

            conn = DriverManager.getConnection(URL, USER_NAME, USER_PASSWD);
   

            StringBuffer sql = new StringBuffer();
            sql.append("insert into JSP_MEMBER values");
            sql.append("(?, ?, ?, ?, ?, ?, ?, ?, sysdate)");        

          
           
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPassword());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getGender());

            pstmt.setString(7, member.getPhone());
            pstmt.setString(8, member.getAddress());
            
       
            pstmt.executeUpdate();
        
            conn.commit(); 
            
        }catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }// end try~catch 
    } 
    
    

    public int loginCheck(String id, String pw) 
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
 
        String dbPW = "";
        int x = -1;
 
        try {
  
            StringBuffer query = new StringBuffer();
            query.append("SELECT Password FROM ACCOUNT WHERE ID = ?");
 
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                System.out.println("Success!");
             } catch (ClassNotFoundException e) {
                System.err.println("error = " + e.getMessage());
                System.exit(1);
             }

             try {
                conn = DriverManager.getConnection(URL, USER_NAME, USER_PASSWD);
                //conn.setAutoCommit(false);
             } catch (SQLException ex) {
                System.err.println("Cannot get a connection : " + ex.getMessage());
                System.exit(1);
             }
             
            pstmt = conn.prepareStatement(query.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
 
            if (rs.next()) // �엯�젮�맂 �븘�씠�뵒�뿉 �빐�떦�븯�뒗 鍮꾨쾲 �엳�쓣寃쎌슦
            {
                dbPW = rs.getString("password"); // 鍮꾨쾲�쓣 蹂��닔�뿉 �꽔�뒗�떎.
 
                if (dbPW.equals(pw)) 
                    x = 1; // �꽆寃⑤컺�� 鍮꾨쾲怨� 爰쇰궡�삩 諛곕쾲 鍮꾧탳. 媛숈쑝硫� �씤利앹꽦怨�
                else                  
                    x = 0; // DB�쓽 鍮꾨�踰덊샇�� �엯�젰諛쏆� 鍮꾨�踰덊샇 �떎由�, �씤利앹떎�뙣
                
            } else {
                x = -1; // �빐�떦 �븘�씠�뵒媛� �뾾�쓣 寃쎌슦
            }
 
            return x;

 
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end loginCheck()
    public int updateMemberpw(String id, String pw) throws SQLException{
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int x = 0;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            System.out.println("Success!");
         } catch (ClassNotFoundException e) {
            System.err.println("error = " + e.getMessage());
            System.exit(1);
         }

         try {
            conn = DriverManager.getConnection(URL, USER_NAME, USER_PASSWD);
            //conn.setAutoCommit(false);
         } catch (SQLException ex) {
            System.err.println("Cannot get a connection : " + ex.getMessage());
            System.exit(1);
         }
 
        try {
        	
            StringBuffer query = new StringBuffer();
 
       
            query.append("UPDATE ACCOUNT set Password = ? WHERE ID = ?");


            pstmt = conn.prepareStatement(query.toString());
            pstmt.setString(1, pw);
            pstmt.setString(2, id);
            pstmt.executeUpdate();
            conn.commit(); 
            x=1; 
           
        } catch (Exception sqle) {
            conn.rollback(); // �삤瑜섏떆 濡ㅻ갚
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
		return x;
    } // end updateMembe
    
    public MemberBean getUserInfo(String id) 
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberBean member = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            System.out.println("Success!");
         } catch (ClassNotFoundException e) {
            System.err.println("error = " + e.getMessage());
            System.exit(1);
         }
 
        try {
            // 荑쇰━
            StringBuffer query = new StringBuffer();
            query.append("SELECT * FROM ACCOUNT WHERE ID=?");
 
            pstmt = conn.prepareStatement(query.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
 
            if (rs.next()) // �쉶�썝�젙蹂대�� DTO�뿉 �떞�뒗�떎.
            {

                member = new MemberBean();
                member.setId(rs.getString(1));
                member.setPassword(rs.getString(2));
                member.setPhone(rs.getString(3));
                member.setGender(rs.getString(4));
                member.setOccupation(rs.getString(5));
                member.setDate(rs.getString(6));
                member.setName(rs.getString(7));
                member.setAddress(rs.getString(8));
            }
 
            return member;
 
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            // Connection, PreparedStatement瑜� �떕�뒗�떎.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    }    // end getUserInfo
	
	public int updateMember2(String id, String pw, String Name, String Phone_Number, String Occupation,
			String Address, String Birth_Date, String gender) throws SQLException{
	        //String Phone_Number, Gender, Occupation, Birth_Date, Name, Address;
	        Connection conn = null;
	        Statement pstmt = null;
	
	        String Gender = null;
	        System.out.println(id+" "+gender);
	        if(gender==null)
	        {
	        	Gender = "null";
	        }
	        else if(gender.equals("1"))
	        	Gender = "Female";
	        else if(gender.equals("0"))
	        	Gender = "Male";

	        int x = 0;
	        try {
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	            System.out.println("Success!");
	         } catch (ClassNotFoundException e) {
	            System.err.println("error = " + e.getMessage());
	            System.exit(1);
	         }
	
	         try {
	            conn = DriverManager.getConnection(URL, USER_NAME, USER_PASSWD);
	            //conn.setAutoCommit(false);
	            pstmt = conn.createStatement();
	         } catch (SQLException ex) {
	            System.err.println("Cannot get a connection : " + ex.getMessage());
	            System.exit(1);
	         }
	 
	        try {
	        	
	            StringBuffer sb = new StringBuffer();
	 
	            int num = 0;
	            sb.append("UPDATE ACCOUNT set ");
	            if (Gender == "null")
					sb.append("gender = '', ");
				else
					sb.append("gender = '" + Gender + "', ");
	            
	                  sb.append("Name = '"+Name+"' ");
	                  num++;

	                  if(num!=0)
	                  {
	                     sb.append(", ");
	
	                  }
	                  sb.append("Phone_Number = '"+Phone_Number+"' ");
	                  num++;
	            
	 
	             if(num!=0)
	                  {
	                     sb.append(", ");
	                  }
	                  sb.append("Occupation = '"+Occupation+"' ");
	                  num++;
	            
	       
	            
	                  if(num!=0)
	                  {
	                     sb.append(", ");
	                  }
	                  sb.append("Birth_Date = '"+Birth_Date+"' ");
	                  num++;
	            
	         
	            
	                  if(num!=0)
	                  {
	                     sb.append(", ");
	                  }
	                  sb.append("Address = '"+Address+"' ");
	                  num++;
	            
	
	            sb.append("WHERE ID = '"+id+"'");
	            String SQL = sb.toString();
	            System.out.println(SQL);
	            
	            
	            pstmt.executeUpdate(SQL);
	            //System.out.println(res+" row updated");
	            System.out.println("�젙蹂댁닔�젙 �셿猷� ");
	            conn.commit();
	            num=0;
	            x=1; 
	           
	        } catch (Exception sqle) {
	            conn.rollback(); // �삤瑜섏떆 濡ㅻ갚
	            throw new RuntimeException(sqle.getMessage());
	        } finally {
	            try{
	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
			return x;
	    } // end updateMembe
	public int deleteMember(String id, String pw) throws SQLException{
	        
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        Statement stmt = null;
	        ResultSet rs;
	        
	        int x = 0;
	        try {
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	            System.out.println("Success!");
	         } catch (ClassNotFoundException e) {
	            System.err.println("error = " + e.getMessage());
	            System.exit(1);
	         }
	
	         try {
	            conn = DriverManager.getConnection(URL, USER_NAME, USER_PASSWD);

		        conn.setAutoCommit(false);

	         } catch (SQLException ex) {
	            System.err.println("Cannot get a connection : " + ex.getMessage());
	            System.exit(1);
	         }
	 
	        try {
	        	
	            StringBuffer query = new StringBuffer();
	            
	            String SQL = "SELECT * FROM manage WHERE mng_id = \'"+ id + "\'";
	            stmt = conn.createStatement();
	            rs = stmt.executeQuery(SQL);
	            int cnt = 0;
	            if(rs.next()) {									// id is manager
		            	System.out.println("I am manager");
		            	cnt++;
	            } else {										// id is not manager
	            	// ResultSet값이 null인 경우 처리하고 싶은 코드를 작성하면 된다.
	            	System.out.println("I am not manager");
		            query.append("DELETE FROM ACCOUNT WHERE ID = ?");
		
		            pstmt = conn.prepareStatement(query.toString());
		            pstmt.setString(1, id);
		            pstmt.executeUpdate();
		            conn.commit(); 
		            x=1; 
	            }
	            
	            if (cnt == 1)
	            	x = 2;
	            else if (cnt > 1)
	            	x = 3;
	            System.out.printf("%d %s\n", cnt, SQL);
		        conn.setAutoCommit(true);
	        } catch (Exception sqle) {
	            conn.rollback(); // �삤瑜섏떆 濡ㅻ갚
	            throw new RuntimeException(sqle.getMessage());
	        } finally {
	            try{
	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
			return x;
	    } // end updateMembe
		public int checkID(String id) throws SQLException{
	        
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	    
	        try {
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	            System.out.println("Success!");
	         } catch (ClassNotFoundException e) {
	            System.err.println("error = " + e.getMessage());
	            System.exit(1);
	         }
	
	         try {
	            conn = DriverManager.getConnection(URL, USER_NAME, USER_PASSWD);
	            //conn.setAutoCommit(false);
	         } catch (SQLException ex) {
	            System.err.println("Cannot get a connection : " + ex.getMessage());
	            System.exit(1);
	         }
	 
	        try {
	        	
	            StringBuffer query = new StringBuffer();
	 
	       
	            query.append("select id from account where id = ?");
	
	
	            pstmt = conn.prepareStatement(query.toString());
	            pstmt.setString(1, id);
	            rs = pstmt.executeQuery();
	            
	            if (rs.next()) // �엯�젮�맂 �븘�씠�뵒�뿉 �빐�떦�븯�뒗 鍮꾨쾲 �엳�쓣寃쎌슦
	            {
	                return 1;
	                
	            } 
	            return 0;
	 
	            
	           
	        } catch (Exception sqle) {
	            conn.rollback(); // �삤瑜섏떆 濡ㅻ갚
	            throw new RuntimeException(sqle.getMessage());
	        } finally {
	            try{
	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
		
	    } // end updateMembe
		
		public int mngcheckID(int id) throws SQLException{
			        
			        Connection conn = null;
			        PreparedStatement pstmt = null;
			        ResultSet rs = null;
			    
			        try {
			            Class.forName("oracle.jdbc.driver.OracleDriver");
			            System.out.println("Success!");
			         } catch (ClassNotFoundException e) {
			            System.err.println("error = " + e.getMessage());
			            System.exit(1);
			         }
			
			         try {
			            conn = DriverManager.getConnection(URL, USER_NAME, USER_PASSWD);
			            //conn.setAutoCommit(false);
			         } catch (SQLException ex) {
			            System.err.println("Cannot get a connection : " + ex.getMessage());
			            System.exit(1);
			         }
			 
			        try {
			        	
			            StringBuffer query = new StringBuffer();
			 
			       
			            query.append("select manage_number from manage where manage_number = ?");
			
			
			            pstmt = conn.prepareStatement(query.toString());
			            pstmt.setInt(1, id);
			            rs = pstmt.executeQuery();
			            
			            if (rs.next()) // �엯�젮�맂 �븘�씠�뵒�뿉 �빐�떦�븯�뒗 鍮꾨쾲 �엳�쓣寃쎌슦
			            {
			                return 1;
			                
			            } 
			            return 0;
			 
			            
			           
			        } catch (Exception sqle) {
			            conn.rollback(); // �삤瑜섏떆 濡ㅻ갚
			            throw new RuntimeException(sqle.getMessage());
			        } finally {
			            try{
			                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
			                if ( conn != null ){ conn.close(); conn=null;    }
			            }catch(Exception e){
			                throw new RuntimeException(e.getMessage());
			            }
			        }
				
			    } // end updateMembe
		
		public int signupMember(String id, String pw, String Name, String Phone_Number, String Occupation,
				String Address, String Birth_Date, String gender) throws SQLException{
		        //String Phone_Number, Gender, Occupation, Birth_Date, Name, Address;
		        Connection conn = null;
		        Statement pstmt = null;
		        String Gender = null;
		        if(gender==null)
		        {
		        	Gender = "null";
		        }
		        else if(gender.equals("1"))
		        	Gender = "Female";
		        else if(gender.equals("0"))
		        	Gender = "Male";
		        
		        System.out.println("signup : "+Gender);
		        int x = 0;
		        try {
		            Class.forName("oracle.jdbc.driver.OracleDriver");
		            System.out.println("Success!");
		         } catch (ClassNotFoundException e) {
		            System.err.println("error = " + e.getMessage());
		            System.exit(1);
		         }
		
		         try {
		            conn = DriverManager.getConnection(URL, USER_NAME, USER_PASSWD);
		            //conn.setAutoCommit(false);
		            pstmt = conn.createStatement();
		         } catch (SQLException ex) {
		            System.err.println("Cannot get a connection : " + ex.getMessage());
		            System.exit(1);
		         }
		 
		        try {
		        	
		            StringBuffer sb = new StringBuffer();
		 
		         
		            sb.append("INSERT INTO ACCOUNT VALUES('" + id + "', ");
		            sb.append("'" + pw + "', ");
		            sb.append("'" + Phone_Number + "', ");
		            
		            if (Gender.equals("null"))
						sb.append("NULL, ");
					else
						sb.append("'" + Gender + "', ");
		             
		             if (Occupation.equals("")) {
		                sb.append("NULL, ");
		             } else {
		                sb.append("'" + Occupation + "', ");
		             }

		             if (Birth_Date.equals("")) {
		                sb.append("NULL, ");
		             } else {
		                sb.append("TO_DATE('" + Birth_Date + "', 'YYYY-MM-DD'), ");
		             }

		             sb.append("'" + Name + "', ");
		             if (Address.equals("")) {
		                sb.append("NULL, 0)");
		             } else {
		                sb.append("'" + Address + "', 0)");
		             }
		            
		            String SQL = sb.toString();
		            pstmt.executeUpdate(SQL);
		            //System.out.println(res+" row updated");
		            System.out.println("媛��엯 �셿猷� ");
		            conn.commit();
		          
		            x=1; 
		           
		        } catch (Exception sqle) {
		            conn.rollback(); // �삤瑜섏떆 濡ㅻ갚
		            throw new RuntimeException(sqle.getMessage());
		        } finally {
		            try{
		                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
		                if ( conn != null ){ conn.close(); conn=null;    }
		            }catch(Exception e){
		                throw new RuntimeException(e.getMessage());
		            }
		        }
				return x;
		    } // end updateMembe
		public int mngCheck(String id, String pass, int num) throws SQLException{
	        
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        PreparedStatement pstmt2 = null;
	        ResultSet rs = null;
	        ResultSet rs2=null;
	        System.out.println(id +" "+pass+" "+num);
	    
	        try {
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	            System.out.println("Success!");
	         } catch (ClassNotFoundException e) {
	            System.err.println("error = " + e.getMessage());
	            System.exit(1);
	         }
	
	         try {
	            conn = DriverManager.getConnection(URL, USER_NAME, USER_PASSWD);
	            //conn.setAutoCommit(false);
	         } catch (SQLException ex) {
	            System.err.println("Cannot get a connection : " + ex.getMessage());
	            System.exit(1);
	         }
	 
	        try {
	        	
	            StringBuffer query = new StringBuffer();
	            StringBuffer query2 = new StringBuffer();
	            
	       
	            query.append("SELECT Password FROM ACCOUNT WHERE ID = ?");
	            query2.append("SELECT Manage_number FROM ACCOUNT, Manage WHERE ID = ? AND Mng_ID = ID");
	
	
	            pstmt = conn.prepareStatement(query.toString());
	            pstmt.setString(1, id);
	            
	            pstmt2 = conn.prepareStatement(query2.toString());
	            pstmt2.setString(1, id);
	            
	            rs2 = pstmt2.executeQuery();
	            
	            if (rs2.next()) 
	            {
	                if (rs2.getInt(1) == num) {
	                   rs = pstmt.executeQuery();
	                   if (rs.next()) {
	                      if (rs.getString(1).equals(pass)) {
	                         return 1; // 濡쒓렇�씤 �꽦怨�
	                      } else
	                         return 0; // �븘�씠�뵒 鍮꾨�踰덊샇 遺덉씪移�
	                   }
	                   return 2; // �븘�씠�뵒媛� �뾾�쓬
	                } else
	                   return 3; // manage 怨꾩젙 �씪移섑븯吏� �븡�쓬
	             }
	             return -1; // 留ㅻ땲�� �븘�씠�뵒媛� �뾾�쓬
	 
	            
	           
	        } catch (Exception sqle) {
	            conn.rollback(); // �삤瑜섏떆 濡ㅻ갚
	            throw new RuntimeException(sqle.getMessage());
	        } finally {
	            try{
	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
		
	    } // end updateMembe
		public int deleteMMember(String id, String pw) throws SQLException{
	        
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        int x = 0;
	        try {
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	            System.out.println("Success!");
	         } catch (ClassNotFoundException e) {
	            System.err.println("error = " + e.getMessage());
	            System.exit(1);
	         }
	
	         try {
	            conn = DriverManager.getConnection(URL, USER_NAME, USER_PASSWD);
	            //conn.setAutoCommit(false);
	         } catch (SQLException ex) {
	            System.err.println("Cannot get a connection : " + ex.getMessage());
	            System.exit(1);
	         }
	 
	        try {
	        	
	            StringBuffer query = new StringBuffer();
	            String SQL2 = "SELECT count(*) from manage ";
	            
	       
	            query.append("DELETE FROM ACCOUNT WHERE ID = ?");
	            PreparedStatement pstmt2;
                pstmt2 = conn.prepareStatement(SQL2);
                ResultSet rs2 = pstmt2.executeQuery();
                if(rs2.next())
                {
                   int num = rs2.getInt(1);
                   if(num == 1)
                   {
                      System.out.println("�쁽�옱 �궓�� 愿�由ъ옄 怨꾩젙�씠 1媛� �씠誘�濡� �깉�눜 遺덇�");
                
                      return 2;
                   }
                }
	
	            pstmt = conn.prepareStatement(query.toString());
	            pstmt.setString(1, id);
	            pstmt.executeUpdate();
	            conn.commit(); 
	            x=1; 
	           
	        } catch (Exception sqle) {
	            conn.rollback(); // �삤瑜섏떆 濡ㅻ갚
	            throw new RuntimeException(sqle.getMessage());
	        } finally {
	            try{
	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
			return x;
	    } // end updateMembe
		public int signupManager(String id, String pw, String Name, String Phone_Number, String Occupation,
				String Address, String Birth_Date, String gender, int mngnum) throws SQLException{
		        //String Phone_Number, Gender, Occupation, Birth_Date, Name, Address;
		        Connection conn = null;
		        Statement pstmt = null;
		        String Gender = null;
		        PreparedStatement pstmt2 = null;
		        if(gender==null)
		        {
		        	Gender = "null";
		        }
		        else if(gender.equals("1"))
		        	Gender = "Female";
		        else if(gender.equals("0"))
		        	Gender = "Male";
		        
		        System.out.println("signup : "+Gender);
		        int x = 0;
		        try {
		            Class.forName("oracle.jdbc.driver.OracleDriver");
		            System.out.println("Success!");
		         } catch (ClassNotFoundException e) {
		            System.err.println("error = " + e.getMessage());
		            System.exit(1);
		         }
		
		         try {
		            conn = DriverManager.getConnection(URL, USER_NAME, USER_PASSWD);
		            //conn.setAutoCommit(false);
		            pstmt = conn.createStatement();
		         } catch (SQLException ex) {
		            System.err.println("Cannot get a connection : " + ex.getMessage());
		            System.exit(1);
		         }
		 
		        try {
		        	
		            StringBuffer sb = new StringBuffer();
		            StringBuffer query2 = new StringBuffer();
		            
		            query2.append("INSERT INTO MANAGE VALUES(?,?)");
		            pstmt2 = conn.prepareStatement(query2.toString());
		            pstmt2.setInt(1, mngnum);
		            pstmt2.setString(2, id);
		            
		            
		            sb.append("INSERT INTO ACCOUNT VALUES('" + id + "', ");
		            sb.append("'" + pw + "', ");
		            sb.append("'" + Phone_Number + "', ");
		            
		            if (Gender.equals("null"))
						sb.append("NULL, ");
					else
						sb.append("'" + Gender + "', ");
		             
		             if (Occupation.equals("")) {
		                sb.append("NULL, ");
		             } else {
		                sb.append("'" + Occupation + "', ");
		             }

		             if (Birth_Date.equals("")) {
		                sb.append("NULL, ");
		             } else {
		                sb.append("TO_DATE('" + Birth_Date + "', 'YYYY-MM-DD'), ");
		             }

		             sb.append("'" + Name + "', ");
		             if (Address.equals("")) {
		                sb.append("NULL, 0)");
		             } else {
		                sb.append("'" + Address + "', 0)");
		             }
		            
		            String SQL = sb.toString();
		            pstmt.executeUpdate(SQL);
		            pstmt2.executeQuery();
		            conn.commit();
		          
		            x=1; 
		           
		        } catch (Exception sqle) {
		            conn.rollback(); // �삤瑜섏떆 濡ㅻ갚
		            throw new RuntimeException(sqle.getMessage());
		        } finally {
		            try{
		                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
		                if ( conn != null ){ conn.close(); conn=null;    }
		            }catch(Exception e){
		                throw new RuntimeException(e.getMessage());
		            }
		        }
				return x;
		    } // end updateMembe
		public int Buycar(String id, String carid) throws SQLException{
			        
			        Connection conn = null;
			        PreparedStatement pstmt = null;
			        PreparedStatement pstmt2 = null;
			        Statement pstmt3 = null;
			        PreparedStatement pstmt4 = null;
			        String SQL,TRANS;
			        
			        ResultSet rs = null;
			        Statement stmt = null;
			        Calendar cal = Calendar.getInstance();
			        
			        int x = 0;
			        try {
			            Class.forName("oracle.jdbc.driver.OracleDriver");
			            System.out.println("Success!");
			         } catch (ClassNotFoundException e) {
			            System.err.println("error = " + e.getMessage());
			            System.exit(1);
			         }
			
			         try {
			            conn = DriverManager.getConnection(URL, USER_NAME, USER_PASSWD);
			            //conn.setAutoCommit(false);
			         } catch (SQLException ex) {
			            System.err.println("Cannot get a connection : " + ex.getMessage());
			            System.exit(1);
			         }
			        try 
			        {	
			            
			            StringBuffer query = new StringBuffer();
			            StringBuffer query2 = new StringBuffer();
			            StringBuffer query3 = new StringBuffer();
			            StringBuffer sb = new StringBuffer();
			            
			            stmt = conn.createStatement();
			            
			            int onum = 0;
				          while(true) {
		
				             onum = (int)((Math.random()*10000 + 1) + 100000);
				             SQL = "SELECT ORDER_NUMBER FROM ORDERED WHERE ORDER_NUMBER = " + Integer.toString(onum);
				             
							rs = stmt.executeQuery(SQL);
				             if(rs.next()){
				             } 
				             else{
				            	 stmt.close(); stmt = null;
				         
				               break;
				             }
				          }
				          
				        
				        pstmt3 = conn.createStatement();
				       
				        
				        TRANS = "LOCK TABLE BUY IN EXCLUSIVE MODE";
				        
				        ResultSet rs4 = pstmt3.executeQuery(TRANS);
				        
				        
				        query3.append("SELECT * FROM BUY WHERE CAR_NUM = ?");
				        
				        pstmt4 = conn.prepareStatement(query3.toString());
				        pstmt4.setString(1, carid);
				        ResultSet rs3 = pstmt4.executeQuery();
				        
				        if(rs3.next())
				        {
				        	try{
				                if ( pstmt4 != null ){ pstmt4.close(); pstmt4=null; }
				                
				            }catch(Exception e){
				                throw new RuntimeException(e.getMessage());
				            }
				        	return 2;
				        }
				        
				        
			            query.append("INSERT INTO BUY VALUES(?,?,?)");
			            pstmt = conn.prepareStatement(query.toString());
			            pstmt.setInt(1, onum);
			            pstmt.setString(2, id);
			            pstmt.setString(3, carid);
			            int cnt = pstmt.executeUpdate();
			        
			            conn.commit();
			            
			            
			            try{
			                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
			                
			            }catch(Exception e){
			                throw new RuntimeException(e.getMessage());
			            }
			            
			            if(cnt>0)
			            {
			            	
			            	query2.append("UPDATE ACCOUNT SET Order_count = Order_count + 1 WHERE ID = ?");
			            	pstmt2=conn.prepareStatement(query2.toString());
			            	pstmt2.setString(1, id);
			            	cnt = pstmt2.executeUpdate();
			            	conn.commit();
			            	try{
				                if ( pstmt2 != null ){ pstmt2.close(); pstmt2=null; }
				                
				            }catch(Exception e){
				                throw new RuntimeException(e.getMessage());
				            }
			            	if(cnt>0)
			            	{
			            		String year = Integer.toString(cal.get(Calendar.YEAR));
			  	              	String month = Integer.toString(cal.get(Calendar.MONTH)+1);
			  	              	String date = Integer.toString(cal.get(Calendar.DATE));
			  	              	sb.append("INSERT INTO ORDERED VALUES ("+onum+", TO_DATE('"+year+"-"+month+"-"+date+"', 'yyyy-mm-dd')) ");
			  	              	String SQL3 = sb.toString();
			  	              	System.out.println(SQL3);
				 
			  	              	pstmt3.executeUpdate(SQL3);
			  	              	conn.commit();
			  	              
			            	}
			            }
			            return 1; 
			           
			        } catch (Exception sqle) {
			            conn.rollback();
			            return 2;
			            
			           
			        } finally {
			            try{
			                if ( pstmt3 != null ){ pstmt3.close(); pstmt3=null; }
			                if ( conn != null ){ conn.close(); conn=null;    }
			            }catch(Exception e){
			                throw new RuntimeException(e.getMessage());
			            }
			        }
					
			    } // end updateMembe


    
    
}