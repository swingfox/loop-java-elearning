package com.loop.controller;

import com.card.loop.xyz.LOIDE.LOIDECommunicator;
import com.card.loop.xyz.LOIDE.LOIDEHandler;
import com.card.loop.xyz.LOIDE.LearningElementMeta;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/le")
public class QueryController {
    LOIDEHandler handler = new LOIDECommunicator();

    @RequestMapping("/query/{searchKey}")
    public List<LearningElementMeta> find(@PathVariable String searchKey) {
        return handler.findLearningElementMeta(searchKey);
    }

}
