package JDBC;

import java.util.List;
import java.util.Vector;

public class UserTestDAO extends Connection {

	
			public List<UserTestDTO> selectList(){
				List<UserTestDTO> bbs = new Vector<UserTestDTO>();
				
				String query = "SELECT * FROM user "; 
				
				 try {
			            stmt = con.createStatement();   // 荑쇰━臾� �깮�꽦
			            rs = stmt.executeQuery(query);  // 荑쇰━ �떎�뻾

			            while (rs.next()) {  // 寃곌낵瑜� �닚�솕�븯硫�...
			                // �븳 �뻾(寃뚯떆臾� �븯�굹)�쓽 �궡�슜�쓣 DTO�뿉 ���옣
			                UserTestDTO dto = new UserTestDTO(); 

			                dto.setName(rs.getString("name"));          // �씪�젴踰덊샇
			                dto.setMajor(rs.getString("major"));      // �젣紐�
			                dto.setEmail(rs.getString("email"));  // �궡�슜

			                bbs.add(dto);  // 寃곌낵 紐⑸줉�뿉 ���옣
			            }
			        } 
			        catch (Exception e) {
			            e.printStackTrace();
			        }

			        return bbs;
			    }
			
}
