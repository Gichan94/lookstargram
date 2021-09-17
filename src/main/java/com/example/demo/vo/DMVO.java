package com.example.demo.vo;


public class DMVO {

	private int dm_no;
	private int room_no;
	private String from_nickname;
	private String to_nickname;
	private String send_time;
	private String read_time;
	private String dm_content;
	private int read_chk;
	
	//현재 사용자의 메세지 상대 nickname
	private String your_nickname;
	
	//현재 사용자의 메세지 상대 profile
	private String your_profile;
	
	//현재 사용자의 nickname
	private String my_nickname;
	
	//안읽은 메세지 개수
	private int unread;

	
	//setter & getter
	public int getDm_no() {
		return dm_no;
	}

	public void setDm_no(int dm_no) {
		this.dm_no = dm_no;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}

	public String getFrom_nickname() {
		return from_nickname;
	}

	public void setFrom_nickname(String from_nickname) {
		this.from_nickname = from_nickname;
	}

	public String getTo_nickname() {
		return to_nickname;
	}

	public void setTo_nickname(String to_nickname) {
		this.to_nickname = to_nickname;
	}

	public String getSend_time() {
		return send_time;
	}

	public void setSend_time(String send_time) {
		this.send_time = send_time;
	}

	public String getRead_time() {
		return read_time;
	}

	public void setRead_time(String read_time) {
		this.read_time = read_time;
	}

	public String getDm_content() {
		return dm_content;
	}

	public void setDm_content(String dm_content) {
		this.dm_content = dm_content;
	}

	public int getRead_chk() {
		return read_chk;
	}

	public void setRead_chk(int read_chk) {
		this.read_chk = read_chk;
	}

	public String getYour_nickname() {
		return your_nickname;
	}

	public void setYour_nickname(String your_nickname) {
		this.your_nickname = your_nickname;
	}

	public String getYour_profile() {
		return your_profile;
	}

	public void setYour_profile(String your_profile) {
		this.your_profile = your_profile;
	}

	public String getMy_nickname() {
		return my_nickname;
	}

	public void setMy_nickname(String my_nickname) {
		this.my_nickname = my_nickname;
	}

	public int getUnread() {
		return unread;
	}

	public void setUnread(int unread) {
		this.unread = unread;
	}


	
	public DMVO(int dm_no, int room_no, String from_nickname, String to_nickname, String send_time, String read_time,
			String dm_content, int read_chk, String your_nickname, String your_profile, String my_nickname,
			int unread) {
		super();
		this.dm_no = dm_no;
		this.room_no = room_no;
		this.from_nickname = from_nickname;
		this.to_nickname = to_nickname;
		this.send_time = send_time;
		this.read_time = read_time;
		this.dm_content = dm_content;
		this.read_chk = read_chk;
		this.your_nickname = your_nickname;
		this.your_profile = your_profile;
		this.my_nickname = my_nickname;
		this.unread = unread;
	}


	public DMVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	@Override
	public String toString() {
		return "DMVO [dm_no=" + dm_no + ", room_no=" + room_no + ", from_nickname=" + from_nickname + ", to_nickname="
				+ to_nickname + ", send_time=" + send_time + ", read_time=" + read_time + ", dm_content=" + dm_content
				+ ", read_chk=" + read_chk + ", your_nickname=" + your_nickname + ", your_profile=" + your_profile
				+ ", my_nickname=" + my_nickname + ", unread=" + unread + "]";
	}	
}