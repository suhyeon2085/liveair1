package org.zerock.domain;

import lombok.Data;

@Data
public class MemberDTO {

	private String id;
	private String password;
	private String name;
	private String address;
	private String phone;
	private String email;
	
}
