package com.jiwoong.springex.mapper;


import com.jiwoong.springex.domain.TodoVO;
import com.jiwoong.springex.util.PageRequestDTO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.time.LocalDate;
import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class TodoMapperTests {

    @Autowired(required = false)
    private TodoMapper todoMapper;

    // @Test
    public void testGetTime() {
        log.info(todoMapper.getTime());
    }


    //@Test
    public void testInsert() {
        TodoVO todoVO = TodoVO.builder()
                .title("insert test")
                .dueDate(LocalDate.of(2023, 05, 13))
                .writer("user00")
                .build();

        todoMapper.insert(todoVO);
    }

    //@Test
    public void testSelectAll() {
        List<TodoVO> todoVOList = todoMapper.selectAll();
        todoVOList.forEach(log::info);
    }

    // @Test
    public void testSelectOne() {
        TodoVO todoVO = todoMapper.selectOne(3L);
        log.info(todoVO);
    }

    //@Test
    public void testDelete() {
        todoMapper.delete(3L);
    }

    // @Test
    public void testUpdate() {

        TodoVO todoVO = new TodoVO().builder()
                .tno(4L)
                .title("수정 test")
                .dueDate(LocalDate.of(2022, 05, 23))
                .finished(true)
                .build();

        todoMapper.update(todoVO);
    }

    //@Test
    public void testGetList() {

        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .pageNum(1)
                .amount(10)
                .build();

        List<TodoVO> voList = todoMapper.getList(pageRequestDTO);
        voList.forEach(log::info);

    }

    @Test
    public void testSelectSearch() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .pageNum(1)
                .amount(10)
                .types(new String[]{"t"})
                .keyword("수정")
                .from(LocalDate.of(2023,06,01))
                .to(LocalDate.of(2023,06,07))
                .build();
        List<TodoVO> voList = todoMapper.selectList(pageRequestDTO);

        voList.forEach(vo -> log.info(vo));

        log.info(todoMapper.getTotal(pageRequestDTO));

    }


}
