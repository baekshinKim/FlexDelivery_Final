package com.project.fd.owner.ask.model;

import java.util.List;

public interface OwnerAskDAO {
	int insertASK(OwnerAskVO ownerAskVo);
	List<OwnerAskVO> selectAllAsk(OwnerAskSearchVO searchVo);
	int selectTotalRecord(OwnerAskSearchVO searchVo);
	int deleteAsk(int askNo);
	OwnerAskVO selectByNo(int askNo);
	int updateASK(OwnerAskVO ownerAskVo);
	OwnerAskVO replyAsk(int askNo);
}
