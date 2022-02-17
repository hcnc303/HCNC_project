package egovframework.example.hcnc.vo;

import org.springframework.web.multipart.MultipartFile;

public class TreeVO {
	private int no;
	private String year;
	private String type;
	private String title;
	private String cont;
	private String edate;
	private String fileName;
	private MultipartFile uploadFile;
	
	private CodeVo codeVO;

	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public CodeVo getCodeVO() {
		return codeVO;
	}
	public void setCodeVO(CodeVo codeVO) {
		this.codeVO = codeVO;
	}
}
