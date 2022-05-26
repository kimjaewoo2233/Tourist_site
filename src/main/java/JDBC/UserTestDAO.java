package JDBC;

import java.util.List;
import java.util.Vector;

public class UserTestDAO extends Connection {

	
			public List<UserTestDTO> selectList(){
				List<UserTestDTO> bbs = new Vector<UserTestDTO>();
				
				String query = "SELECT * FROM user "; 
				
				 try {
			            stmt = con.createStatement();   // 쿼리문 생성
			            rs = stmt.executeQuery(query);  // 쿼리 실행

			            while (rs.next()) {  // 결과를 순화하며...
			                // 한 행(게시물 하나)의 내용을 DTO에 저장
			                UserTestDTO dto = new UserTestDTO(); 

			                dto.setName(rs.getString("name"));          // 일련번호
			                dto.setMajor(rs.getString("major"));      // 제목
			                dto.setEmail(rs.getString("email"));  // 내용

			                bbs.add(dto);  // 결과 목록에 저장
			            }
			        } 
			        catch (Exception e) {
			            System.out.println("게시물 조회 중 예외 발생");
			            e.printStackTrace();
			        }

			        return bbs;
			    }
			
}
