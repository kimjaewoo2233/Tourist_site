package file;

import JDBC.Connection;

import java.util.List;
import java.util.Vector;

public class FileDAO extends Connection {

	public int insertFile(FileDTO dto) {
        int applyResult = 0;
        try {
            String query = "INSERT INTO myfile ( "
                + "   name,title,content,ofile,sfile) "
                + " VALUES ( "
                + "?,?,?,?,?)";
                        
            psmt = con.prepareStatement(query);
            psmt.setString(1,dto.getName());
            psmt.setString(2, dto.getTitle());
            psmt.setString(3, dto.getContent());
            psmt.setString(4, dto.getOfile());
            psmt.setString(5, dto.getSfile());
        
            applyResult = psmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("INSERT 중 예외 발생");
            e.printStackTrace();
        }        
        return applyResult;
    }
	public List<FileDTO> myFileList() {
        List<FileDTO> fileList = new Vector<FileDTO>();

        // 쿼리문 작성
        String query = "SELECT * FROM myfile ORDER BY id DESC";
        try {
            psmt = con.prepareStatement(query);  // 쿼리 준비
            rs = psmt.executeQuery();  // 쿼리 실행

            while (rs.next()) {  // 목록 안의 파일 수만큼 반복
                // DTO에 저장
            	FileDTO dto = new FileDTO();
            	dto.setId(rs.getString(1));
            	dto.setName(rs.getString(2));
                dto.setTitle(rs.getString(3));
                dto.setContent(rs.getString(4));
                dto.setOfile(rs.getString(5));
                dto.setSfile(rs.getString(6));
                dto.setDateCreated(rs.getString(7));
                
                fileList.add(dto);  // 목록에 추가
            }
        }
        catch (Exception e) {
            System.out.println("SELECT 시 예외 발생");
            e.printStackTrace();
        }        
        
        return fileList;  // 목록 반환
    }
	
	public FileDTO selectView(String id)
	{
		FileDTO dto = new FileDTO();
		String query = "SELECT * FROM myfile WHERE id=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setOfile(rs.getString(5));
				dto.setSfile(rs.getString(6));
				dto.setDateCreated(rs.getString(7));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
		
	}
	
	public int updatePost(FileDTO dto) {
		int result = 0;
		try {
			     String query = "UPDATE myfile"
	                     + " SET title=?, name=?, content=?, ofile=?, sfile=? "
	                     + " WHERE id=?";
		     	psmt = con.prepareStatement(query);
	            psmt.setString(1, dto.getTitle());
	            psmt.setString(2, dto.getName());
	            psmt.setString(3, dto.getContent());
	            psmt.setString(4, dto.getOfile());
	            psmt.setString(5, dto.getSfile());
	            psmt.setString(6, dto.getId());
	            // 쿼리문 실행
	            result = psmt.executeUpdate();
	        }
	        catch (Exception e) {
	            System.out.println("게시물 수정 중 예외 발생");
	            e.printStackTrace();
	        }
	        return result;
	    }
	
	public int deletePost(String id) {
		int result = 0;
		try {
			String query = "DELETE FROM myfile WHERE id=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
            e.printStackTrace();
		}
		return result;
	}
		}
	
