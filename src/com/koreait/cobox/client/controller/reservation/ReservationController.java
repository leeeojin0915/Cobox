package com.koreait.cobox.client.controller.reservation;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.cobox.model.common.MessageData;
import com.koreait.cobox.model.domain.ResSummary;
import com.koreait.cobox.model.domain.Reservation;
import com.koreait.cobox.model.domain.Schedule;
import com.koreait.cobox.model.domain.Seat;
import com.koreait.cobox.model.domain.Theater;
import com.koreait.cobox.model.movie.service.MovieService;
import com.koreait.cobox.model.payment.service.PaymentService;
import com.koreait.cobox.model.reservation.service.LocationService;
import com.koreait.cobox.model.reservation.service.ReservationService;
import com.koreait.cobox.model.schedule.service.ScheduleService;
import com.koreait.cobox.model.theater.service.TheaterService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ReservationController implements ServletContextAware {
   private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
   @Autowired
   private MovieService movieService;
   @Autowired
   private LocationService locationService;
   @Autowired
   private TheaterService theaterService;
   @Autowired
   private ReservationService reservationService;
   @Autowired
   private ScheduleService scheduleService;
   @Autowired
   private PaymentService paymentService;

   @Override
   public void setServletContext(ServletContext servletContext) {
   }

   //????????? ??????????????? ??????
   @GetMapping("/movie/reservation")
   public ModelAndView reserMovie(HttpServletRequest request) {
      List movieList = movieService.selectAll();
      List locationList = locationService.selectAll();
      //List theaterList = theaterService.selectAll();
      List scheduleList=scheduleService.selectAll();
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("movieList", movieList);
      mav.addObject("locationList", locationList);
      mav.addObject("scheduleList", scheduleList);
      //mav.addObject("theaterList", theaterList);
      mav.setViewName("client/payment/reservation5");
      return mav;
   }

   //??????????????? ?????? ????????????
   @RequestMapping(value = "/movie/theater", method = RequestMethod.GET)
   @ResponseBody
   public Schedule getTheaterList(int schedule_id) {
	   //log.debug(null);
      //List<Theater> theaterList = theaterService.selectAllById(location_id);
      Schedule schedule=scheduleService.select(schedule_id);
      return schedule;
   }

   //????????? ??????,??????,?????? ?????? ??? ????????? 
   @RequestMapping(value = "/movie/reserRegist", method = RequestMethod.POST )
   public String reserMovie(HttpServletRequest request, Schedule schedule) {

//      logger.debug("movie_id???? "+schedule.getMovie().getMovie_id());
//      logger.debug("theater_id???? "+schedule.getTheater().getTheater_id());
//      logger.debug("sdate???? "+schedule.getSdate());
//      logger.debug("stime???? "+schedule.getStime());

      //scheduleService.insert(schedule);
      
      return "/client/payment/reservation2";
   }
   
   //???????????? ??? ???????????? ??????????????? ??????(????????????) ?????? ?????????????????? ?????????(2->3)
   @RequestMapping(value = "/movie/reserRegist2", method = RequestMethod.GET)
   public String reservationfinal(Seat seat) {
      
         logger.debug("seat_id???? " +seat.getSeat_id());
         logger.debug("seat_name???? "+seat.getSeat_name());
         //logger.debug("seat_price???? "+seat.getSeat_price());
         
         return "/client/payment/reservation3";
   }
   
   //????????????(?????? paymentService????????!)
   @RequestMapping(value = "/movie/reservationfinal", method = RequestMethod.POST)
   public MessageData setReser(Schedule schedule, Reservation reservation, ResSummary resSummary) {
      //scheduleService.insert(schedule);
      
      //reservation.setSchedule(schedule);
      reservationService.insert(reservation);
      
      //logger.debug("schedule "+reservation.getSchedule().getSchedule_id());
     // logger.debug("resSummary "+reservation.getResSummary().getRes_summay_id());
      
      MessageData messageData=new MessageData();
      messageData.setResultCode(1);
      messageData.setMsg("????????? ?????????????????????.");
      messageData.setUrl("/client/payment/reservationfinal");
      
      return messageData;
   }

}
