package org.zerock.controller;

import java.time.LocalDate;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.zerock.domain.MemoDTO;
import org.zerock.persistence.MemoDAO;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CalendarController {

	 @Autowired
    private MemoDAO memoDAO;

    @RequestMapping("/calendar")
    public String calendar(
        @RequestParam(value = "year", required = false) Integer yearParam,
        @RequestParam(value = "month", required = false) Integer monthParam,
        Model model
    ) {
        LocalDate today = LocalDate.now();
        int year = (yearParam != null) ? yearParam : today.getYear();
        int month = (monthParam != null) ? monthParam : today.getMonthValue();

        if (month < 1) {
            month = 12; year--;
        } else if (month > 12) {
            month = 1; year++;
        }

        LocalDate firstDay = LocalDate.of(year, month, 1);
        int lengthOfMonth = firstDay.lengthOfMonth();
        int startDayOfWeek = firstDay.getDayOfWeek().getValue() % 7;

        List<String> days = new ArrayList<>();
        for (int i = 0; i < startDayOfWeek; i++) days.add("");
        for (int i = 1; i <= lengthOfMonth; i++) days.add(String.valueOf(i));

        int todayDay = (year == today.getYear() && month == today.getMonthValue()) ? today.getDayOfMonth() : -1;

        // 메모 리스트
        List<MemoDTO> memoList = memoDAO.getMemosByMonth(year, month);
        Map<String, String> memoMap = new HashMap<>();
        for (MemoDTO m : memoList) {
            memoMap.put(String.valueOf(m.getDay()), m.getMemo());
        }

        model.addAttribute("year", year);
        model.addAttribute("month", month);
        model.addAttribute("days", days);
        model.addAttribute("todayDay", todayDay);
        model.addAttribute("memoMap", memoMap);
        model.addAttribute("prevYear", (month == 1) ? year - 1 : year);
        model.addAttribute("prevMonth", (month == 1) ? 12 : month - 1);
        model.addAttribute("nextYear", (month == 12) ? year + 1 : year);
        model.addAttribute("nextMonth", (month == 12) ? 1 : month + 1);

        return "/calendar/calendar";
    }
}