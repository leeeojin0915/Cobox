package com.koreait.cobox.model.reservation.repository;

import java.util.List;

import com.koreait.cobox.model.domain.Member;
import com.koreait.cobox.model.domain.Reservation;
import com.koreait.cobox.model.domain.Schedule;

public interface ReservationDAO {
	public List selectAll();
	public List selectById(int member_id);//�������������� ���� ���� �Ѹ��� ����Ұ� 
	public Reservation select(int reservation_id); //
	public void insert(Schedule schedule);
	public void insert(Reservation reservation);
	public void update(Reservation reservation);
	public void delete(Reservation reservation);
	public void delete(Member member);
	
}