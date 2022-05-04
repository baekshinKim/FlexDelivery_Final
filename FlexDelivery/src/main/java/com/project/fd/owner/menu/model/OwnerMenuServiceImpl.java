package com.project.fd.owner.menu.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryVO;
import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryViewVO;


@Service
public class OwnerMenuServiceImpl implements  OwnerMenuService{
	@Autowired
	private OwnerMenuDAO ownerMenuDao;
	
	public List<OwnerMenuAllVO> selectMenuAllView(int storeNo){
		return ownerMenuDao.selectMenuAllView(storeNo);
	}
	
	public OwnerMenuAllVO selectMenuViewBymenuNo(int menuNo) {
		return ownerMenuDao.selectMenuViewBymenuNo(menuNo);
	}
	
	public List<OwnerMenuOptionAllVO> selectMenuOptionAllView(int menuNo){
		return ownerMenuDao.selectMenuOptionAllView(menuNo);
	}
	
	public List<OwnerStoreMenuGroupVO> selectMenuGroupByNo(int storeNo){
		return ownerMenuDao.selectMenuGroupByNo(storeNo);
	}
	
	public int updateMenuGroupByNo(OwnerStoreMenuGroupVO ownerStoreMenuGroupVo) {
		return ownerMenuDao.updateMenuGroupByNo(ownerStoreMenuGroupVo);
	}
	
	public OwnerStoreMenuGroupVO selectMenuGroupByGroupNo(int sMGroupNo) {
		return ownerMenuDao.selectMenuGroupByGroupNo(sMGroupNo);
	}
	
	public int deleteMenuGroupByNo(int sMGroupNo) {
		return ownerMenuDao.deleteMenuGroupByNo(sMGroupNo);
	}
	
	public int insertMenuGroup(OwnerStoreMenuGroupVO ownerStoreMenuGroupVo) {
		return ownerMenuDao.insertMenuGroup(ownerStoreMenuGroupVo);
	}
	
	public List<OwnerMenuAllVO> selectMenuViewBymenuGroupNo(OwnerStoreMenuGroupVO ownerStoreMenuGroupVo){
		return ownerMenuDao.selectMenuViewBymenuGroupNo(ownerStoreMenuGroupVo);
	}
	
	
	public int insertMenu(OwnerMenuVO ownerMenuVo) {
		return ownerMenuDao.insertMenu(ownerMenuVo);
	}
	

	public int deleteMenuByNo(int menuNo) {
		return ownerMenuDao.deleteMenuByNo(menuNo);
	}
	
	public OwnerMenuVO selectMenuByMenuNo(int menuNo) {
		return ownerMenuDao.selectMenuByMenuNo(menuNo);
	}
	
	public int updateMenuByNo(OwnerMenuVO ownerMenuVo) {
		return ownerMenuDao.updateMenuByNo(ownerMenuVo);
	}
	
	public int selectCountMainMenu(int storeNo) {
		return ownerMenuDao.selectCountMainMenu(storeNo);
	}
	
	
	public int insertMainMenu(OwnerStoreMainMenuVO mainVo) {
		return ownerMenuDao.insertMainMenu(mainVo);
	}
	
	
	public OwnerStoreMainMenuVO selectMainMenuByStoreNo(int storeNo) {
		return ownerMenuDao.selectMainMenuByStoreNo(storeNo);
	}
	
	
	public int updateMainMenu(OwnerStoreMainMenuVO mainVo) {
		return ownerMenuDao.updateMainMenu(mainVo);
	}
	
	
	
	
	public int checkDupGroupName(Map<String, Object> map)  {
		return ownerMenuDao.checkDupGroupName(map);
	}
	
	public int checkDupMenuName(Map<String, Object> map) {
		return ownerMenuDao.checkDupMenuName(map);
	}
	
	
	public List<OwnerMenuVO> selectMenuByGroupNo(int sMGroupNo){
		return ownerMenuDao.selectMenuByGroupNo(sMGroupNo);
	}
	
	public List<OwnerMenuOptionVO> selectOptionAllByMenuNo(Map<String, String> map){
		return ownerMenuDao.selectOptionAllByMenuNo(map);
	}
	
	public List<OwnerOptionRankVO> selectOptionRankAll(){
		return ownerMenuDao.selectOptionRankAll();
	}
	
	public int checkOptionName(Map<String, String> map) {
		return ownerMenuDao.checkOptionName(map);
	}
	
	public int insertOption(OwnerMenuOptionVO optionVo) {
		return ownerMenuDao.insertOption(optionVo);
	}
	
	
	public OwnerMenuOptionVO selectOptionByOptionNo(int mOptionNo) {
		return ownerMenuDao.selectOptionByOptionNo(mOptionNo);
	};
	
	public int updateOption(OwnerMenuOptionVO optionVo) {
		return ownerMenuDao.updateOption(optionVo);
	};
	
	public int deleteOption(int mOptionNo) {
		return ownerMenuDao.deleteOption(mOptionNo);
	}
	/*
	  public OwnerStoreMainMenuVO selectMainMenuByStoreNo(int storeNo) { return
	  ownerMenuDao.selectMainMenuByStoreNo(storeNo); }
	  
	  public AdminMediumCategoryViewVO selectMCAllView(int mCategoryNo) { return
	  ownerMenuDao.selectMCAllView(mCategoryNo); }
	 */
	
	@Override
	@Transactional
	public OwnerMainMenuAllVO selectMainMenuAll(int storeNo) {
		OwnerMainMenuAllVO mmVo = new OwnerMainMenuAllVO();
		try {			
			OwnerStoreMainMenuVO mainMenuVo = ownerMenuDao.selectMainMenuByStoreNo(storeNo);
			if(mainMenuVo.getMenuNo()>0 && mainMenuVo.getmCategoryNo()>0) {
				OwnerMenuVO  menuVo= ownerMenuDao.selectMenuByMenuNo(mainMenuVo.getMenuNo());
				AdminMediumCategoryViewVO mCategoryVo = ownerMenuDao.selectMCAllView(mainMenuVo.getmCategoryNo());
				
				
				
				mmVo.setaMCategoryVo(mCategoryVo);
				mmVo.setMenuVo(menuVo);
				
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
			
		return mmVo;
	}
	
	@Override
	@Transactional
	public List<AdminMediumCategoryVO> selectAllMCByLCByStoreNo(int storeNo) {
		List<AdminMediumCategoryVO> list = null;
		try {			
			
			int lCategoryNo =  ownerMenuDao.selectLargeCategoryByStoreNo(storeNo);
			list = ownerMenuDao.selectAllMCByLC(lCategoryNo);
		}catch(RuntimeException e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
			
		return list;
	}


	
	
	
	
}
