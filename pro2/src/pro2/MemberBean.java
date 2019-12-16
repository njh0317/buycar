package pro2;

 
// 데이터의 전달을 담당하는 클래스 - DTO
public class MemberBean 
{
    private String id;            // 아이디
    private String password;     // 비밀번호
    private String name;        // 이름
    private String gender;        // 성별
    private String date;        
    private String phone;        // 전화
    private String address;        // 주소
    private String occupation;
    private int num;

 
    public String getId() {return id;}
    public void setId(String id) {this.id = id;}
    
    public String getPassword() {return password;}
    public void setPassword(String password) {this.password = password;}
    
    public String getName() {return name;}
    public void setName(String name) {this.name = name;}
    
    public String getGender() {return gender;}
    public void setGender(String gender) {this.gender = gender;}
    
    public String getPhone() {return phone;}
    public void setPhone(String phone) {this.phone = phone;}
    
    public String getAddress() {return address;}
    public void setAddress(String address) {this.address = address;}
    
    public String getOccupation() {return occupation;}
    public void setOccupation(String occupation) {this.occupation = occupation;}
    
    public String getDate() {return date;}
    public void setDate(String date) {this.date = date;}
    public int getNum() {return num;}
    public void setNum(int num) {this.num = num;}

}
