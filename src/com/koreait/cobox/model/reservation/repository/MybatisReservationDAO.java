package com.koreait.cobox.model.reservation.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.cobox.exception.ReservationDeleteException;
import com.koreait.cobox.exception.ReservationEditException;
import com.koreait.cobox.exception.ReservationRegistException;
import com.koreait.cobox.model.domain.Member;
import com.koreait.cobox.model.domain.Reservation;
import com.koreait.cobox.model.domain.Schedule;

@Repository
public class MybatisReservationDAO implements ReservationDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List selectById(int member_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Reservation select(int reservation_id) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public void insert(Reservation reservation) throws ReservationRegistException{
		int result=sqlSessionTemplate.insert("Reservation.insert",reservation);
		if(result==0) {
			throw new ReservationRegistException("���ſ� ���� �߽��ϴ�.");
		}
	}

	@Override
	public void update(Reservation reservation) throws ReservationEditException{
		int result=sqlSessionTemplate.update("Reservation.update",reservation);
		if(result==0) {
			throw new ReservationEditException("���ຯ�����");
		}
	}

	@Override
	public void delete(Reservation reservation) throws ReservationDeleteException{
		int result=sqlSessionTemplate.delete("Reservation.delete", reservation);
		if(result==0) {
			throw new ReservationDeleteException("������ҽ���");
		}
		
	}

	@Override
	public void delete(Member member) {
		
	}

	@Override
	public void insert(Schedule schedule) {
		// TODO Auto-generated method stub
		
	}

}