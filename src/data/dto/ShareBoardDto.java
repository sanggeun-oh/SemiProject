package data.dto;

import java.sql.Timestamp;

public class ShareBoardDto {
   private String num;
   private String id;
   private String subject;
   private String content;
   private String addr;
   private int likes;
   private int regroup;
   private int relevel;
   private int restep;
   private String star;
   private String photo;
   private Timestamp writeday;
   
   
public String getNum() {
   return num;
}
public void setNum(String num) {
   this.num = num;
}
public String getId() {
   return id;
}
public void setId(String id) {
   this.id = id;
}
public String getSubject() {
   return subject;
}
public void setSubject(String subject) {
   this.subject = subject;
}
public String getContent() {
   return content;
}
public void setContent(String content) {
   this.content = content;
}
public String getAddr() {
   return addr;
}
public void setAddr(String addr) {
   this.addr = addr;
}
public int getLikes() {
   return likes;
}
public void setLikes(int likes) {
   this.likes = likes;
}
public int getRegroup() {
   return regroup;
}
public void setRegroup(int regroup) {
   this.regroup = regroup;
}
public int getRelevel() {
   return relevel;
}
public void setRelevel(int relevel) {
   this.relevel = relevel;
}
public int getRestep() {
   return restep;
}
public void setRestep(int restep) {
   this.restep = restep;
}
public String getStar() {
   return star;
}
public void setStar(String star) {
   this.star = star;
}
public String getPhoto() {
   return photo;
}
public void setPhoto(String photo) {
   this.photo = photo;
}
public Timestamp getWriteday() {
   return writeday;
}
public void setWriteday(Timestamp writeday) {
   this.writeday = writeday;
}
   
   
   
   
   
}  