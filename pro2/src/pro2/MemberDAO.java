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
    // Address
	public static final String USER_NAME = "project"; // Oracle user ID
	public static final String USER_PASSWD = "comp322";

    private static MemberDAO instance;
    
    // 싱글톤 패턴
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
            // 커넥션을 가져온다.

            conn = DriverManager.getConnection(URL, USER_NAME, USER_PASSWD);
            //conn.setAutoCommit(false);

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
            
            // 쿼리 실행
            pstmt.executeUpdate();
            // 완료시 커밋
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
    } // end insertMember()
    
    
    // 로그인시 아이디, 비밀번호 체크 메서드
    // 아이디, 비밀번호를 인자로 받는다.
    public int loginCheck(String id, String pw) 
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
 
        String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
        int x = -1;
 
        try {
            // 쿼리 - 먼저 입력된 아이디로 DB에서 비밀번호를 조회한다.
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
 
            if (rs.next()) // 입려된 아이디에 해당하는 비번 있을경우
            {
                dbPW = rs.getString("password"); // 비번을 변수에 넣는다.
 
                if (dbPW.equals(pw)) 
                    x = 1; // 넘겨받은 비번과 꺼내온 배번 비교. 같으면 인증성공
                else                  
                    x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
                
            } else {
                x = -1; // 해당 아이디가 없을 경우
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
            conn.rollback(); // 오류시 롤백
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
            // 쿼리
            StringBuffer query = new StringBuffer();
            query.append("SELECT * FROM ACCOUNT WHERE ID=?");
 
            pstmt = conn.prepareStatement(query.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
 
            if (rs.next()) // 회원정보를 DTO에 담는다.
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
            // Connection, PreparedStatement를 닫는다.
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
	            System.out.println("정보수정 완료 ");
	            conn.commit();
	            num=0;
	            x=1; 
	           
	        } catch (Exception sqle) {
	            conn.rollback(); // 오류시 롤백
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
	 
	       
	            query.append("DELETE FROM ACCOUNT WHERE ID = ?");
	
	
	            pstmt = conn.prepareStatement(query.toString());
	            pstmt.setString(1, id);
	            pstmt.executeUpdate();
	            conn.commit(); 
	            x=1; 
	           
	        } catch (Exception sqle) {
	            conn.rollback(); // 오류시 롤백
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
	            
	            if (rs.next()) // 입려된 아이디에 해당하는 비번 있을경우
	            {
	                return 1;
	                
	            } 
	            return 0;
	 
	            
	           
	        } catch (Exception sqle) {
	            conn.rollback(); // 오류시 롤백
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
			            
			            if (rs.next()) // 입려된 아이디에 해당하는 비번 있을경우
			            {
			                return 1;
			                
			            } 
			            return 0;
			 
			            
			           
			        } catch (Exception sqle) {
			            conn.rollback(); // 오류시 롤백
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
		            System.out.println("가입 완료 ");
		            conn.commit();
		          
		            x=1; 
		           
		        } catch (Exception sqle) {
		            conn.rollback(); // 오류시 롤백
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
	                         return 1; // 로그인 성공
	                      } else
	                         return 0; // 아이디 비밀번호 불일치
	                   }
	                   return 2; // 아이디가 없음
	                } else
	                   return 3; // manage 계정 일치하지 않음
	             }
	             return -1; // 매니저 아이디가 없음
	 
	            
	           
	        } catch (Exception sqle) {
	            conn.rollback(); // 오류시 롤백
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
                      System.out.println("현재 남은 관리자 계정이 1개 이므로 탈퇴 불가");
                
                      return 2;
                   }
                }
	
	            pstmt = conn.prepareStatement(query.toString());
	            pstmt.setString(1, id);
	            pstmt.executeUpdate();
	            conn.commit(); 
	            x=1; 
	           
	        } catch (Exception sqle) {
	            conn.rollback(); // 오류시 롤백
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
		            conn.rollback(); // 오류시 롤백
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
			        String SQL;
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
			 
			        try {
			        	
			            pstmt3 = conn.createStatement();
			            StringBuffer query = new StringBuffer();
			            StringBuffer query2 = new StringBuffer();
			            StringBuffer sb = new StringBuffer();
			       	 
			           
			            stmt = conn.createStatement();
			            int onum = 0;
				          while(true) {
				             // 주문번호가 이미 있는지 검사
				             onum = (int)((Math.random()*10000 + 1) + 100000);
				             SQL = "SELECT ORDER_NUMBER FROM ORDERED WHERE ORDER_NUMBER = " + Integer.toString(onum);
				             
							rs = stmt.executeQuery(SQL);
				             if(rs.next()){
				             } else{
				               break;
				             }
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
			            	
			            	System.out.println("구매 완료");
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
			  	              String month = Integer.toString(cal.get(Calendar.MONTH) + 1);
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
			            conn.rollback(); // 오류시 롤백
			            return -1;
			            //throw new RuntimeException(sqle.getMessage());
			           
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