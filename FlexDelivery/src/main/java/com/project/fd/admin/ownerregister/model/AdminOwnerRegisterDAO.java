package com.project.fd.admin.ownerregister.model;

import java.util.List;

public interface AdminOwnerRegisterDAO {
	public List<AdminOwnerRegisterVo> adminOwnerRegistList();
	public AdminOwnerRegisterVo adminOwnerRegistDetail(long no);
	public int adminOwnerRegistApproval(long registNo);
	public int adminOwnerApproval(int ownerNo);
	public int adminOwnerRegistDeny(long registNo);
}
