package user;

import JDBC.Connection;
import java.util.List;
import java.util.Vector;
public class UserDAO extends Connection {
	 String pro_email=null;
	public UserDTO getUserDTO(String username,String password) {
			UserDTO dto = new UserDTO();
			String query = "SELECT * FROM user WHERE username=? AND password=?";
	
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, username);
				psmt.setString(2, password);
				rs = psmt.executeQuery();
			
				if(rs.next()) {
					dto.setUsername(rs.getString("username"));
					dto.setPassword(rs.getString("password"));
					dto.setEmail(rs.getString(4));
					
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return dto;
	}
	public UserDTO getEmailUserDTO(String name) {
		UserDTO dto = new UserDTO();
		String query = "SELECT * FROM user WHERE username=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, name);
			rs = psmt.executeQuery();
		
			if(rs.next()) {
				dto.setUsername(rs.getString("username"));
				dto.setPassword(rs.getString("password"));
				dto.setEmail(rs.getString(4));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
}
	
	public List<UserDTO> allUser() {
	
		List<UserDTO> list = new Vector<UserDTO>();
		String query = "SELECT * FROM user ORDER BY id DESC";

		try {		
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setUsername(rs.getString("username"));
				dto.setPassword(rs.getString("password"));
				dto.setEmail(rs.getString(4));
				
				list.add(dto);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
}
	public int setUserDTO(String username,String password,String email) {
		int applyResult = 0;
		
		
		allUser().forEach( n ->{
			System.out.println(n.getEmail());
			if(n.getEmail().equals(email)) {
				System.out.println(n.getEmail());
				pro_email="test";
			}
		});
		try{
			if(pro_email != null) {
				return -2;
			}else {
				try {	
					String query = "INSERT INTO user(username,password,email) VALUES (?,?,?)";
					
					psmt = con.prepareStatement(query);
					psmt.setString(1, username);
					psmt.setString(2, password);
					psmt.setString(3, email);
				    applyResult = psmt.executeUpdate();
				}catch(Exception ex) {
					System.out.println("회원가입 실패");
		            ex.printStackTrace();
				}
			}
		}catch(Exception e) {
			pro_email="없음";
			
			
		}
		return applyResult;
	}			
}
