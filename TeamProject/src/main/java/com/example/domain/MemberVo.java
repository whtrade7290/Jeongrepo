package com.example.domain;



import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVo {
	
	private String id;
	private String pw;
	private String name;
	private String email;
	private String tel;
	private String address;
	private String gender;
	private String birthday;
	private String push;
	private Timestamp regDate;
	private int jmembership;
	
}
