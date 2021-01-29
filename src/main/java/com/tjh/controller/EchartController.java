package com.tjh.controller;

import com.tjh.util.ResultMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("echart")
@Controller
public class EchartController {

    @RequestMapping("pie")
    @ResponseBody
    public ResultMessage loadPie(){
        return null;
    }
}
