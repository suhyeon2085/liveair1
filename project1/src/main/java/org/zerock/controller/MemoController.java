package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.zerock.domain.MemoDTO;
import org.zerock.persistence.MemoDAO;

@Controller
public class MemoController {

    @Autowired
    private MemoDAO memoDAO;

    @PostMapping("/addMemo")
    public String addMemo(MemoDTO memo) {
        memoDAO.insertMemo(memo);
        return "redirect:/calendar?year=" + memo.getYear() + "&month=" + memo.getMonth();
    }

    @PostMapping("/updateMemo")
    public String updateMemo(MemoDTO memo) {
        memoDAO.updateMemo(memo);
        return "redirect:/calendar?year=" + memo.getYear() + "&month=" + memo.getMonth();
    }

    @PostMapping("/deleteMemo")
    public String deleteMemo(@RequestParam("id") int id, @RequestParam("year") int year, @RequestParam("month") int month) {
        memoDAO.deleteMemo(id);
        return "redirect:/calendar?year=" + year + "&month=" + month;
    }
}