package com.myboot.reservation.controller;


import org.springframework.ui.Model;


public interface ReservationController {
	public String reservationMain(Model model);
	public String reservationComplete(Model model);
}
