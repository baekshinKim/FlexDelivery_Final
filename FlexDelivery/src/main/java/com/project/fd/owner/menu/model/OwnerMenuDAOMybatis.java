package com.project.fd.owner.menu.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryVO;
import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryViewVO;


@Repository
public class OwnerMenuDAOMybatis implements OwnerMenuDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.ownermenu.";
	
	public List<OwnerMenuAllVO> selectMenuAllView(int storeNo) {
		return sqlSession.selectList(namespace+"selectMenuAllView", storeNo);
	}
	
	public OwnerMenuAllVO selectMenuViewBymenuNo(int menuNo) {
		return sqlSession.selectOne(namespace+"selectMenuViewBymenuNo", menuNo);
	}
	
	
	public List<OwnerMenuOptionAllVO> selectMenuOptionAllView(int menuNo) {
		return sqlSession.selectList(namespace+"selectMenuOptionAllView", menuNo);
	}
	
	public List<OwnerStoreMenuGroupVO> selectMenuGroupByNo(int storeNo) {
		return sqlSession.selectList(namespace+"selectMenuGroupByNo", storeNo);
	}
	
	public int updateMenuGroupByNo(OwnerStoreMenuGroupVO ownerStoreMenuGroupVo) {
		return sqlSession.update(namespace+"updateMenuGroupByNo", ownerStoreMenuGroupVo);
	}
	
	
	public OwnerStoreMenuGroupVO selectMenuGroupByGroupNo(int sMGroupNo) {
		return sqlSession.selectOne(namespace+"selectMenuGroupByGroupNo", sMGroupNo);
	}
	
	public int deleteMenuGroupByNo(int sMGroupNo) {
		return sqlSession.delete(namespace+"deleteMenuGroupByNo", sMGroupNo);
	}
	
	public int insertMenuGroup(OwnerStoreMenuGroupVO ownerStoreMenuGroupVo) {
		return sqlSession.insert(namespace+"insertMenuGroup", ownerStoreMenuGroupVo);
	}
	
	
	public List<OwnerMenuAllVO> selectMenuViewBymenuGroupNo(OwnerStoreMenuGroupVO ownerStoreMenuGroupVo){
		return sqlSession.selectList(namespace+"selectMenuViewBymenuGroupNo", ownerStoreMenuGroupVo);
	}
	
	
	public int insertMenu(OwnerMenuVO ownerMenuVo) {
		return sqlSession.insert(namespace+"insertMenu", ownerMenuVo);
	}
	
	public int deleteMenuByNo(int menuNo) {
		return sqlSession.delete(namespace+"deleteMenuByNo", menuNo);
	}
	
	
	public OwnerMenuVO selectMenuByMenuNo(int menuNo) {
		return sqlSession.selectOne(namespace+"selectMenuByMenuNo", menuNo);
	}
	
	
	
	public int updateMenuByNo(OwnerMenuVO ownerMenuVo) {
		return sqlSession.update(namespace+"updateMenuByNo", ownerMenuVo);
	}
	
	
	//메인메뉴
	
	
	public int selectCountMainMenu(int storeNo) {
		return sqlSession.selectOne(namespace+"selectCountMainMenu", storeNo);
	}
	
	public OwnerStoreMainMenuVO selectMainMenuByStoreNo(int storeNo) {
		return sqlSession.selectOne(namespace+"selectMainMenuByStoreNo", storeNo);
	}
	
	public AdminMediumCategoryViewVO selectMCAllView(int mCategoryNo) {
		return sqlSession.selectOne(namespace+"selectMCAllView", mCategoryNo);
	}
	
	
	public int selectLargeCategoryByStoreNo(int storeNo) {
		return sqlSession.selectOne(namespace+"selectLargeCategoryByStoreNo", storeNo);
	}

	
	public List<AdminMediumCategoryVO> selectAllMCByLC(int lCategoryNo){
		return sqlSession.selectList(namespace+"selectAllMCByLC", lCategoryNo);
	}
	
	
	public int insertMainMenu(OwnerStoreMainMenuVO mainVo) {
		return sqlSession.insert(namespace+"insertMainMenu", mainVo);
	}
	
	
	
	public int updateMainMenu(OwnerStoreMainMenuVO mainVo) {
		return sqlSession.update(namespace+"updateMainMenu", mainVo);
	}
	
	
	public int checkDupGroupName(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"checkDupGroupName", map);
	}
	
	public int checkDupMenuName(Map<String, Object> map) {
		return sqlSession.selectOne(namespace+"checkDupMenuName", map);
	}

	
	public List<OwnerMenuVO> selectMenuByGroupNo(int sMGroupNo){
		return sqlSession.selectList(namespace+"selectMenuByGroupNo",  sMGroupNo);
	}
	
	
	public List<OwnerMenuOptionVO> selectOptionAllByMenuNo(Map<String, String> map){
		return sqlSession.selectList(namespace+"selectOptionAllByMenuNo",   map);
	}
	
	public List<OwnerOptionRankVO> selectOptionRankAll(){
		return sqlSession.selectList(namespace+"selectOptionRankAll");
	}
	
	
	public int checkOptionName(Map<String, String> map) {
		return sqlSession.selectOne(namespace+"checkOptionName", map);
	}
	
	
	public int insertOption(OwnerMenuOptionVO optionVo) {
		return sqlSession.insert(namespace+"insertOption", optionVo);
	}
	
	
	public OwnerMenuOptionVO selectOptionByOptionNo(int mOptionNo) {
		return sqlSession.selectOne(namespace+"selectOptionByOptionNo",  mOptionNo);
	}
	
	public int updateOption(OwnerMenuOptionVO optionVo) {
		return sqlSession.update(namespace+"updateOption",  optionVo);
	}
	
	
	public int deleteOption(int mOptionNo) {
		return sqlSession.delete(namespace+"deleteOption",  mOptionNo);
	}
	
	
}
