package com.project.fd.owner.menu.model;

import java.util.List;
import java.util.Map;

import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryVO;

public interface OwnerMenuService {
	public static final int SUCCESS_POST = 1;
	public static final int FAIL_POST = 2;
	
	public List<OwnerMenuAllVO> selectMenuAllView(int storeNo);
	public OwnerMenuAllVO selectMenuViewBymenuNo(int menuNo);
	public List<OwnerMenuOptionAllVO> selectMenuOptionAllView(int menuNo);
	public List<OwnerStoreMenuGroupVO> selectMenuGroupByNo(int storeNo);
	public int updateMenuGroupByNo(OwnerStoreMenuGroupVO ownerStoreMenuGroupVo);
	public OwnerStoreMenuGroupVO selectMenuGroupByGroupNo(int sMGroupNo);
	public int deleteMenuGroupByNo(int sMGroupNo);
	public int insertMenuGroup(OwnerStoreMenuGroupVO ownerStoreMenuGroupVo);
	public List<OwnerMenuAllVO> selectMenuViewBymenuGroupNo(OwnerStoreMenuGroupVO ownerStoreMenuGroupVo);
	
	public int insertMenu(OwnerMenuVO ownerMenuVo);
	public int deleteMenuByNo(int menuNo);
	public OwnerMenuVO selectMenuByMenuNo(int menuNo);
	public int updateMenuByNo(OwnerMenuVO ownerMenuVo);
	public int selectCountMainMenu(int storeNo);
	public OwnerStoreMainMenuVO selectMainMenuByStoreNo(int storeNo) ;
	/*public AdminMediumCategoryViewVO selectMCAllView(int mCategoryNo);*/
	
	public OwnerMainMenuAllVO selectMainMenuAll(int storeNo);

	public List<AdminMediumCategoryVO> selectAllMCByLCByStoreNo(int storeNo);
	public int insertMainMenu(OwnerStoreMainMenuVO mainVo);
	public int updateMainMenu(OwnerStoreMainMenuVO mainVo);
	
	public int checkDupGroupName(Map<String, Object> map) ;
	public int checkDupMenuName(Map<String, Object> map);
	public List<OwnerMenuVO> selectMenuByGroupNo(int sMGroupNo);
	public List<OwnerMenuOptionVO> selectOptionAllByMenuNo(Map<String, String> map);
	
	public List<OwnerOptionRankVO> selectOptionRankAll();

	public int checkOptionName(Map<String, String> map);
	public int insertOption(OwnerMenuOptionVO optionVo);
	public OwnerMenuOptionVO selectOptionByOptionNo(int mOptionNo);
	public int updateOption(OwnerMenuOptionVO optionVo);
	
	public int deleteOption(int mOptionNo);
}
