package com.project.fd.owner.store.model;

import java.util.List;
import java.util.Map;

import com.project.fd.owner.common.LocationVO;
import com.project.fd.owner.model.OwnerAuthorityVO;

public interface OwnerStoresService {
	
	//권한에 따른 확인 시 사용
		public static final int NO_LICENSE=1;  //회원가입은 했으나 사업자 등록증 없는 경우
		public static final int NO_STORE=2; // 사업자 등록은 했지만 점포가 없는 경우
		public static final int HAVE_ALL=3; // 모든것을 다 가진 경우 
		public static final int LICENSE_STAY=4; // 라이센스 승인대기중인 경우
		public static final int STORE_STAY=5; //점포 승인대기중인 경우

	//Stores
	int insertOwnerStores(OwnerStoresVO ownerStoresVo);

	public int selectStoreNoByNo(int ownerNo);
	List<LocationVO> AllLocaion(); 
	public int checkAuthority2(String userid);
	OwnerAuthorityVO selectOwnerAuthorityAll2(String userid);
	  
	OwnerStoresVO selectByNo(int storeNo);
	int updateStores(OwnerStoresVO ownerStoresVO);
	  public OwnerStoresVO selectStoreByOwnerNo(int ownerNo);
	  public Map<String, Object> selectOperationViewAll(int ownerNo);
	  public int holidayUpdate(Map<String, Object> map);
	  public int updateStatus(Map<String,Object> map); //지안20210211수정
	  public int updateTime(Map<String,Object> map);
	  public OwnerStoresVO selectBasic(int ownerNo);
	  public int updateContent(Map<String, Object> map);
	  public int updateLogo(OwnerStoresVO ownerStoresVo);

	public List<Map<String, Object>> selectsStatusAll();

	//지안 20210211 수정 재 시작
	public String selectLCategoryName(int lCategoryNo);
	//지안 20210211 수정끝

	
	public int updateMinPrice(Map<String,Object> map);//지안 20210217추가
	public int dupckstores(int ownerNo);
	public int dupckregi(int ownerNo);
}


