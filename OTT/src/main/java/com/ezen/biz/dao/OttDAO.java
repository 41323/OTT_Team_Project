package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.FavoriteVO;
import com.ezen.biz.dto.OttVO;
import com.ezen.biz.dto.UserVO;


@Repository("ottDAO")
public class OttDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public OttVO getOtt(OttVO vo) {
		System.out.println("===> MyBatis로 getott() 기능 처리");
		return (OttVO)mybatis.selectOne("Mapper.getOtt", vo);
	}
	
	public void upCnt(OttVO vo) {
		mybatis.update("Mapper.upCnt",vo);
	}
	public void dnCnt(OttVO vo) {
		mybatis.update("Mapper.dnCnt",vo);
	}
	
	public int insFav(FavoriteVO favVo) {
		return mybatis.insert("Mapper.insFav",favVo);
	}
	
	public int delFav(FavoriteVO favVo) {
		return mybatis.delete("Mapper.delFav",favVo);
	}
	
	public int findFav(FavoriteVO favVo) {
		int result = 0;
		try {
			result = mybatis.selectOne("Mapper.getFav", favVo);
		} catch (NullPointerException e) {
			System.out.println("즐겨찾기 없음 null");
		}
		return result;
	}
	
	// 게시글 목록 조회
	public List<OttVO> getOttList(OttVO Ott) {
		System.out.println("===> Mybatis로 getOttList() 기능 처리");
		
		return mybatis.selectList("Mapper.getOttList_D", Ott);
	}
	
	public List<OttVO> getOttDramaList(OttVO Ott) {
		System.out.println("===> Mybatis로 getOttDramaList() 기능 처리");
		
		return mybatis.selectList("Mapper.getOttDramaList");
	}
	
	public List<OttVO> getOttActionList(OttVO Ott) {
		System.out.println("===> Mybatis로 getActionOttList() 기능 처리");
		
		return mybatis.selectList("Mapper.getOttActionList");
	}
	
	public List<OttVO> getOttRomanceList(OttVO Ott) {
		System.out.println("===> Mybatis로 getOttRomensList() 기능 처리");
		
		return mybatis.selectList("Mapper.getOttRomanceList");
	}
	
	public List<OttVO> getFavoriteList(FavoriteVO vo){
		return mybatis.selectList("Mapper.getFavorite",vo);
	}
	
	public UserVO getUser(UserVO vo) {
		 UserVO user = mybatis.selectOne("Mapper.getUser",vo);
			System.out.println("user="+user);
		return user;
	}
	//회원가입
	public void insertUser(UserVO vo) {
		System.out.println("회원가입하기");
		vo.setRole("user");
		System.out.println(vo);
		mybatis.insert("Mapper.insertUser", vo);
	}
	
	//아이디 중복체크
	public UserVO idCheck(String id) {
		System.out.println("==> Mybatis로 idCheck() 기능 처리");
		UserVO user = mybatis.selectOne("Mapper.idCheck", id);
		return user;
	
	}
//작품 등록하기
	public void insertOtt(OttVO ott) {
		System.out.println("작품 등록하기");
		
		mybatis.insert("Mapper.insertOtt",ott);
	}
	
	//게시글 목록 조회
	public List<OttVO> ad_getOttList(OttVO ott){
		System.out.println("getOttList() 기능 처리");
			
		return mybatis.selectList("Mapper.getOttList",ott);
	}
	
	//게시글 수정
	public void updateOtt(OttVO ott) {
		System.out.println("updateOtt() 기능 처리");
		
		mybatis.update("Mapper.updateOtt", ott);
	}
	
	//게시글 삭제
	public void deleteOtt(OttVO ott) {
		System.out.println("deleteOtt() 기능 처리");
		
		mybatis.delete("Mapper.deleteOtt", ott);
	}


	
}
