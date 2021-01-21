package ino.jpa.hongik.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import ino.jpa.hongik.controller.FreeBoardDTO.FreeBoardDTO;
import ino.jpa.hongik.domain.FreeBoardEntity;
import ino.jpa.hongik.repository.FreeBoardDtoRepository;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class FreeBoardService {
	
	@Autowired
	private FreeBoardDtoRepository boardDtoRepository;
	
	
	
	public Page<FreeBoardEntity> mainList(Pageable pageable){
			
		
		System.out.println("pageable"+pageable);
		pageable=PageRequest.of(pageable.getPageNumber()<=0 ? 0: pageable.getPageNumber() -1, pageable.getPageSize());
		
			
		Page<FreeBoardEntity> mainList=boardDtoRepository.findAll(pageable);
	
		
		
		
		
			
		return mainList;
	}
		
	
	@Transactional
	public FreeBoardEntity insertList(String title,String content,String name, String codeType) {
			
			LocalDateTime regdate = LocalDateTime.now();
			
			Long num=boardDtoRepository.getNextValMySequence();
			

		
			FreeBoardEntity insert=new FreeBoardEntity();

			FreeBoardDTO dto=new FreeBoardDTO();
			
			dto.setCodeType(codeType).setContent(content).setName(name).setTitle(title).setRegdate(regdate).setNum(num);
			
			
			FreeBoardEntity entity=insert.setNum(dto.getNum()).setCodeType(dto.getCodeType()).setContent(dto.getContent()).setName(dto.getName())
					.setRegdate(dto.getRegdate()).setTitle(dto.getTitle());
			
			
			System.out.println("entity:::::::::::::::::::::::"+entity);
			
			FreeBoardEntity FreeBoardEntity=boardDtoRepository.save(entity);
			
			
			return FreeBoardEntity;
	    	
	    	
	   	
	}
	
	public FreeBoardEntity detail(Long num) {
		
		return boardDtoRepository.getOne(num);
		
	}
	
	public FreeBoardEntity update(Map<String,Object> updateMap) {
		
		FreeBoardDTO dto=new FreeBoardDTO();
		
		LocalDateTime regdate = LocalDateTime.now();
		
		if(updateMap.containsKey("num")) {
			
			Long num=Long.valueOf(updateMap.get("num").toString());	
			
			dto.setNum(num);
			
			
		}
		
		if(updateMap.containsKey("codeType")) {
			
			String codeType=updateMap.get("codeType").toString();	
			
			dto.setCodeType(codeType);
			
			
		}
		
		if(updateMap.containsKey("name")) {
			
			String name=updateMap.get("name").toString();
			dto.setName(name);
		}
		
		if(updateMap.containsKey("title")) {
			
			String title=updateMap.get("title").toString();
			
			dto.setTitle(title);
			
		}
		
		if(updateMap.containsKey("content")) {
			
			String content=updateMap.get("content").toString();
			
			dto.setContent(content);
			
		}
		
		
		FreeBoardEntity entity=new FreeBoardEntity();
		
		entity.setCodeType(dto.getCodeType()).setContent(dto.getContent()).setName(dto.getName()).setNum(dto.getNum()).setRegdate(regdate).setTitle(dto.getTitle());
		
		
		return boardDtoRepository.save(entity);
			
		}
	
	public void delete(Long num) {
		
		
		boardDtoRepository.deleteById(num);
		
	}
	
	public Page<FreeBoardEntity>  search(String option,String keyword,Pageable pageable){
		
		
		pageable=PageRequest.of(pageable.getPageNumber()<=0 ? 0: pageable.getPageNumber() -1, pageable.getPageSize());
	
		
		if(option.equals("title")) {
		
			
			
			Page<FreeBoardEntity>  search = boardDtoRepository.searchByTitleLike(keyword,pageable);
			System.out.println("search::::::::::"+search);
			
			
			return	search;
		}else  {
			
			Page<FreeBoardEntity>  search = boardDtoRepository.searchByNumLike(keyword,pageable);
			System.out.println("search::::::::::"+search);
			

			return	search;
		}
		
		
		
		
		
		
	}


}
