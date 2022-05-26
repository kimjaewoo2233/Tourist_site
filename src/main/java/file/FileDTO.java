package file;

import java.util.Date;

public class FileDTO {
		
		private String id;
		private String name;
		private String title;
		private String content;
		private String ofile;
		private String sfile;
		private String dateCreated;
		
		public String getId() {
			return id;	
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getName() {
			return name;	
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getContent() {
			return content;	
		}
		public void setContent(String Content) {
			this.content = Content;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getOfile() {
			return ofile;
		}
		public void setOfile(String ofile) {
			this.ofile = ofile;
		}
		public String getSfile() {
			return sfile;
		}
		public void setSfile(String sfile) {
			this.sfile = sfile;
		}
		public String getDateCreated() {
			return dateCreated;
		}
		public void setDateCreated(String dateCreated) {
			this.dateCreated = dateCreated;
		}
}
