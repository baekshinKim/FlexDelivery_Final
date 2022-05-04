package com.project.fd.owner.temporary.model;

import java.util.Map;

import com.project.fd.owner.store.model.OwnerTemporaryVO;

public interface OwnerTemporaryService {
	public Map<String,Object> selectOwnerInfoAll(String ownerId);
	public int selectLocationNoByLocationName(String locationName);
	public int selectAgreeCount(int ownerNo);
	public int insertTemporary(OwnerTemporaryVO ownerTemporaryVo);
	public int realInsertTemporary(OwnerTemporaryVO ownerTemporaryVo);
}
