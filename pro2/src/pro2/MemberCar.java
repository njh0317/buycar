package pro2;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.Date;
 


public class MemberCar 
{
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl"; // Oracle
    // Address
	public static final String USER_NAME = "teamp"; // Oracle user ID
	public static final String USER_PASSWD = "comp322";

    private static MemberCar instance;
    
    // �떛湲��넠 �뙣�꽩
    private MemberCar(){}
    public static MemberCar getInstance(){
        if(instance==null)
            instance=new MemberCar();
        return instance;
    }
    
 
    public void insertMember(MemberBean member) throws SQLException
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // 而ㅻ꽖�뀡�쓣 媛��졇�삩�떎.

            conn = DriverManager.getConnection(URL, USER_NAME, USER_PASSWD);
            conn.setAutoCommit(false);

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
            
            // 荑쇰━ �떎�뻾
            pstmt.executeUpdate();
            // �셿猷뚯떆 而ㅻ컠
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
    
    
    //signupMember(carnum, model_year, mileage, price, Color1, Color2, Fuel1, Fuel2, Category, Transmission, engine, selectmake, selectmodel, selectdmodel);
    public int signupMember(String carnum, String myear, int mileage, int price, String c1, String c2, 
			String f1, String f2, String cat, String trans, int engine, String make, String model, String dmodel) throws SQLException{
	
    		String SQL = "INSERT INTO VEHICLE (CAR_NUMBER, MODEL_YEAR, MILEAGE, PRICE, COLOR1, COLOR2, FUEL1, FUEL2, CATEGORY_T, TRANSMISSION_T, ENGINE_T, CAR_MAKE, CAR_MODEL, CAR_DETAILED) "
                + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        java.sql.Date modelyear = null;
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
	            pstmt = conn.prepareStatement(SQL);
	         } catch (SQLException ex) {
	            System.err.println("Cannot get a connection : " + ex.getMessage());
	            System.exit(1);
	         }
	 
	        try {
	        	
	        	 pstmt.setString(1, carnum);
	       	  	 modelyear = java.sql.Date.valueOf(myear);
	             pstmt.setDate(2, (java.sql.Date) modelyear);
	             pstmt.setInt(3, mileage);
	             pstmt.setInt(4, price);
	             pstmt.setString(5, c1);
	             pstmt.setString(6, c2);
	             pstmt.setString(7, f1);
	             pstmt.setString(8, f2);
	             pstmt.setString(9, cat);
	             pstmt.setString(10, trans);
	             pstmt.setInt(11, engine);
	             pstmt.setString(12, make);
	             pstmt.setString(13, model);
	             pstmt.setString(14, dmodel);
	             
	             if (c2.equals("")) {
	                 //pstmt.setString(6, "NULL");
	                 pstmt.setNull(6, Types.VARCHAR);
	              } else {
	                 pstmt.setString(6, c2);
	              }
	              if (f2.equals("")) {
	                 //pstmt.setString(8, "NULL");
	                 pstmt.setNull(8, Types.VARCHAR);
	              } else {
	                 pstmt.setString(8, f2);
	              }
	              if (dmodel.equals("")) {
	                 //pstmt.setString(14, "NULL");
	                 pstmt.setNull(14, Types.VARCHAR);
	              } else {
	                 pstmt.setString(14, dmodel);
	              }
	              pstmt.executeUpdate();
	              System.out.println("1 vehicle added");
	              conn.commit();
	              return 1;
	        } catch (Exception sqle) {
	            conn.rollback(); // �삤瑜섏떆 濡ㅻ갚
	            return -1;
	            
	        } finally {
	            try{
	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
			
	    } // end updateMembe
    
	    public int nonvisible(String car)throws SQLException{
	
		        Connection conn = null;
		        String SQL = "";
		        PreparedStatement pstmt;
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
	         SQL = "UPDATE VEHICLE SET visible = 'false' WHERE car_number = ?";
	         pstmt = conn.prepareStatement(SQL);
	         pstmt.setString(1, car);
	         if (pstmt.executeUpdate() != 1)
	         {
	            System.out.println("update error!");
	            return 0;
	         }
	         conn.commit();
	         return 1;
	    	
	    }
	    public int visible(String car)throws SQLException{
	
	        Connection conn = null;
	        String SQL = "";
	        PreparedStatement pstmt;
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
	     SQL = "UPDATE VEHICLE SET visible = 'true' WHERE car_number = ?";
	     pstmt = conn.prepareStatement(SQL);
	     pstmt.setString(1, car);
	     if (pstmt.executeUpdate() != 1)
	     {
	        System.out.println("update error!");
	        return 0;
	     }
	     conn.commit();
	     return 1;
	     
		
	}
	    public int updateMember(String carnum, String myear, int mileage, int price, String c1, String c2, 
				String f1, String f2, String category, String trans, int engine, String make, String model, String dmodel) throws SQLException{
		
	    		
		        Connection conn = null;
		        PreparedStatement pstmt = null;
		        Statement stmt = null;
            	
		        java.sql.Date modelyear = null;
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
		            stmt = conn.createStatement();
		         } catch (SQLException ex) {
		            System.err.println("Cannot get a connection : " + ex.getMessage());
		            System.exit(1);
		         }
		 
		        int num = 0;
		         StringBuffer sb = new StringBuffer();

		         sb.append("UPDATE VEHICLE set ");
		 
		         if(!myear.equals("")) {
		            sb.append("model_year = TO_DATE(\'"+ myear +"\'), ");
		            num++;
		         }
		         
		            sb.append("mileage = \'"+ mileage +"\', ");
		           
		            sb.append("price = \'"+ price +"\', ");
		      
		         if(!c1.equals("")) {
		            sb.append("color1 = \'"+ c1 +"\', ");
		            num++;
		         }
		      
		         if(!c2.equals("")) {
		            sb.append("color2 = \'"+ c2 +"\', ");
		            num++;
		         }
		     
		         if(!f1.equals("")) {
		            sb.append("fuel1 = \'"+ f1 +"\', ");
		            num++;
		         }
		        
		         if(!f2.equals("")) {
		            sb.append("fuel2 = \'"+ f2 +"\', ");
		            num++;
		         }
		   
		         if(!category.equals("")) {
		            sb.append("Category_t = \'"+ category +"\', ");
		            num++;
		         }
		       
		         if(!trans.equals("")) {
		            sb.append("Transmission_T = \'"+ trans +"\', ");
		            num++;
		         }
		        
		    
		            sb.append("Engine_T = \'"+ engine +"\', ");
		           
		     
		         if(!make.equals("")) {
		            sb.append("Car_Make = \'"+ make +"\', ");
		            num++;
		         }
		         if(model == null)
		         {
		        	 return -2;
		         }
		         else if(!model.equals("")) {
		            sb.append("Car_Model = \'"+ model +"\', ");
		            num++;
		         }
		         
		        	 
	
		         if(dmodel == null)
		         {
		        	 return -3;
		         }
		         else if(!dmodel.equals("")) {
		            sb.append("Car_Detailed = \'"+ dmodel +"\', ");
		            num++;
		         }
		        

		         sb.delete(sb.length()-2, sb.length()-1);
		         
		         sb.append("WHERE car_number = \'" + carnum + "\'");
		            String SQL = sb.toString();
		            System.out.println(SQL);
		            
		            try
		            {
		            	
					int res = stmt.executeUpdate(SQL);
		                if (res == 1)
		                   System.out.println("\n�젙蹂댁닔�젙 �셿猷�");
		                conn.commit();
		                return 1;
		            }catch (Exception sqle) {
			            conn.rollback(); // �삤瑜섏떆 濡ㅻ갚
			            return -1;
			            
			        } finally {
			            try{
			                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
			                if ( conn != null ){ conn.close(); conn=null;    }
			            }catch(Exception e){
			                throw new RuntimeException(e.getMessage());
			            }
			        }
					

				
		    } // end updateMembe
	    
	    

    
}