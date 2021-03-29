package com.example.hello.controller;

import com.example.hello.domain.QueryDTO;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/get")
public class GetAPI {

    @GetMapping(path = "/newGet")
    public String newGet(){


        return "new Get";
    }

    @RequestMapping(value = "/oldGet", method = RequestMethod.GET)
    public String oldGet(){


        return "old Get";

    }

    //@PathVariable(name="name") String PathName
    @GetMapping(path = "/path-variable/{name}")
    public String pathGet(@PathVariable String name){

        System.out.println("path-variable"+name);

        return name;
    }

    @GetMapping("/query-param")
    public String queryGet(@RequestParam(name = "user",value = "user",required = false) String user,
                           @RequestParam(name = "mail",value = "mail",required = false) String mail,
                           @RequestParam(name = "age",value = "age",required = false) String age
                           ){



        return user+mail+age;

    }

    @GetMapping("/query-param2")
    public String queryGet(@RequestParam Map<String,Object> queryMap){


        StringBuilder sb=new StringBuilder();
        queryMap.entrySet().forEach(entry-> {

            System.out.println("key"+entry.getKey());

            System.out.println("value"+entry.getValue());

            sb.append(entry.getKey()+"=" +entry.getValue());

        });

        return sb.toString();

    }

    @GetMapping("/query-param3")
    public String queryGet(@ModelAttribute QueryDTO dto){


        return dto.getUser()+dto.getMail()+dto.getAge();

    }


}
