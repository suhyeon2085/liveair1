package org.zerock.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReservationDTO {

	private int num;
	private String model;
	private String type;
	private String detail;
	private String loc;
	private Date date;
}
