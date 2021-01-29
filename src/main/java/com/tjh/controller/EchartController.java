package com.tjh.controller;

import com.tjh.service.DictionaryService;
import com.tjh.util.ResultMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("echart")
@Controller
public class EchartController {
    @Autowired
    private DictionaryService dictionaryService;

    @RequestMapping("pie")
    @ResponseBody
    public ResultMessage loadPie(){
        return ResultMessage.success(dictionaryService.loadPie(),"加载成功");
    }
}
