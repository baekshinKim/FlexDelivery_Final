package com.project.fd.owner.model;

import java.util.Map;

public interface OwnerDAO {
	public String selectPwd(String userid);
	OwnerVO selectOwner(String userid);
	public int insertowner(OwnerVO ownerVo);
	public int checkDup(String ownerId);
	public OwnerAuthorityVO selectOwnerAuthorityAll(String userid);
	public int withdrawOwner(int ownerNo);
	public int withdrawStore(int storeNo) ;
	public int updateOwner(OwnerVO vo);
	public int selectOwnerAuthorityCount(Map<String, Object> map);
}
