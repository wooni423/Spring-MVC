package com.jiwoong.springex.mapper;

import com.jiwoong.springex.domain.TodoVO;
import com.jiwoong.springex.util.PageRequestDTO;


import java.util.List;

public interface TodoMapper {

    String getTime();

    void insert(TodoVO todoVO);

    List<TodoVO> selectAll();

    TodoVO selectOne(Long tno);

    void delete(Long tno);

    void update(TodoVO todoVO);

    List<TodoVO> getList(PageRequestDTO pageRequestDTO);

    int getTotal(PageRequestDTO pageRequestDTO);

    List<TodoVO> selectList(PageRequestDTO pageRequestDTO);
}
