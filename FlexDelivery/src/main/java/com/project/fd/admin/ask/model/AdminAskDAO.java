package com.project.fd.admin.ask.model;

import java.util.List;
import java.util.Map;

public interface AdminAskDAO {

	List<AdminAskVO> selectAll();

	List<AdminAskVO> selectByAuthority(int no);

	List<AdminAskVO> selectByReply(String flag);

	int insertAskReply(AdminAskVO askVo);

	int updateAskReply(AdminAskVO askVo);

	int deleteAskReply(int no);

	AdminAskVO selectByNo(int no);

	AdminAskVO selectReplyByNo(int no);

	int updateAsk(AdminAskVO askVo);

	List<Map<String, Object>> selectNewAsk();

	int selectNewAsk2();

}
