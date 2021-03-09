package com.koreait.cobox.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.cobox.exception.ScheduleRegistException;
import com.koreait.cobox.model.box.service.BoxService;
import com.koreait.cobox.model.domain.Box;
import com.koreait.cobox.model.domain.Movie;
import com.koreait.cobox.model.domain.Schedule;
import com.koreait.cobox.model.domain.Sdate;
import com.koreait.cobox.model.domain.Stime;
import com.koreait.cobox.model.domain.Theater;
import com.koreait.cobox.model.movie.service.MovieService;
import com.koreait.cobox.model.reservation.service.LocationService;
import com.koreait.cobox.model.schedule.service.ScheduleService;
import com.koreait.cobox.model.theater.service.TheaterService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminScheduleController {
	@Autowired
	private LocationService locationService;
	@Autowired
	private TheaterService theaterService;
	@Autowired
	private BoxService boxService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private ScheduleService scheduleService;

	// 영화스케줄 폼
	@RequestMapping(value = "/schedule/registform")
	public String registForm() {
		return "admin/schedule/schedule_regist";
	}

	// 영화스케줄폼가져오기
	@GetMapping("/schedule/registform")
	public ModelAndView getRegistForm(HttpServletRequest request) {
		List locationList = locationService.selectAll();

		ModelAndView mav = new ModelAndView();
		mav.addObject("locationList", locationList);
		mav.setViewName("admin/schedule/schedule_regist");
		return mav;
	}

	// 영화관 불러오기
	@GetMapping("/schedule/theaterlist")
	@ResponseBody
	public List gettheaterList(HttpServletRequest request, int location_id) {
		log.debug("보낼 극장" + location_id);
		List<Theater> theaterList = theaterService.selectAllById(location_id);
		return theaterList;
	}

	// 상영관 불러오기
	@GetMapping("/schedule/boxlist")
	@ResponseBody
	public List getboxList(HttpServletRequest request, int theater_id) {
		log.debug("보낼 상영관" + theater_id);
		List<Box> boxList = boxService.selectAll(theater_id);
		return boxList;
	}

	// 영화목록 불러오기
	@GetMapping("/schedule/movielist")
	@ResponseBody
	public List getmovieList(HttpServletRequest request) {
		List<Movie> movieList = movieService.selectAll();
		return movieList;
	}

	// 영화스케줄등록
	@PostMapping("/schedule/regist")
	public String registSchedule(Schedule schedule,Sdate sdate) {
		log.debug("영화" + schedule.getMovie().getMovie_id());
		log.debug("상영관" + schedule.getBox().getBox_id());
	
		schedule.setSdate(sdate);
		log.debug("날짜확인"+schedule.getSdate().getDatepicker());

		for (Stime stime : schedule.getStime()) {
			log.debug("상영시간" + stime.getTimepicker());
		}
		scheduleService.regist(schedule,sdate);
		return "redirect:/admin/schedule/list";
	}

	//스케줄목록
	@GetMapping("/schedule/list")
	public ModelAndView getScheduleList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/schedule/list");
		List<Schedule> scheduleList = scheduleService.selectAll();
		mav.addObject("scheduleList", scheduleList);
		return mav;
	}
	
	//스케줄 디테일
	@GetMapping("/schedule/detail")
	public ModelAndView getScheduleDetail(HttpServletRequest request,int schedule_id) {
		ModelAndView mav=new ModelAndView("admin/schedule/detail");
		List locationList = locationService.selectAll();
		Schedule schedule=scheduleService.select(schedule_id);
		mav.addObject("locationList", locationList);
		mav.addObject("schedule",schedule);
		return mav;
	}
	
	@PostMapping("/schedule/edit")
	public String updateSchedule(Schedule schedule, Sdate sdate) {
		log.debug("스케줄 아이디"+schedule.getSchedule_id());
		scheduleService.update(schedule, sdate);

		return "redirect:/admin/schedule/detail?schedule_id="+schedule.getSchedule_id();
	}
	
	//스케줄 디테일
	@GetMapping("/schedule/delete")
	public String deleteSchedule(Schedule schedule,Sdate sdate) {
		scheduleService.delete(schedule, sdate);
		return "redirect:/admin/schedule/list";
	}

	// 예외처리
	@ExceptionHandler(ScheduleRegistException.class)
	@ResponseBody
	public String handlerException(ScheduleRegistException e) {
		StringBuilder sb = new StringBuilder();
		sb.append("{");
		sb.append("\"result\":0");
		sb.append("\"msg\":\"" + e.getMessage() + "\"");
		sb.append("}");
		return sb.toString();

	}

}