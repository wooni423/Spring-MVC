package com.jiwoong.springex.service;


import com.jiwoong.springex.dto.TodoDTO;
import com.jiwoong.springex.util.PageRequestDTO;
import com.jiwoong.springex.util.PageResponseDTO;

import java.util.List;

public interface TodoService {

    void register(TodoDTO todoDTO);

    PageResponseDTO<TodoDTO> getList(PageRequestDTO pageRequestDTO);

    TodoDTO getOne(Long tno);

    void remove(Long tno);

    void modify(TodoDTO todoDTO);

    int  getTotal(PageRequestDTO pageRequestDTO);

}
