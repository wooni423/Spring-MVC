package com.jiwoong.springex.mapper;

import com.jiwoong.springex.dto.TodoDTO;
import com.jiwoong.springex.service.TodoService;
import com.jiwoong.springex.util.PageRequestDTO;
import com.jiwoong.springex.util.PageResponseDTO;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.time.LocalDate;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations ="file:src/main/webapp/WEB-INF/root-context.xml")
public class TodoServiceTests {

    @Autowired
    private TodoService todoService;

    //@Test
    public void testRegister() {
        TodoDTO todoDTO = TodoDTO.builder()
                .title("register test")
                .dueDate(LocalDate.now())
                .writer("user01")
                .build();

        todoService.register(todoDTO);
    }

    @Test
    public void testPagingList(){
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder().pageNum(1).amount(10).build();

        PageResponseDTO<TodoDTO> responseDTO = todoService.getList(pageRequestDTO);

        log.info(responseDTO);
        responseDTO.getDtoList().forEach(log::info);
    }


}

