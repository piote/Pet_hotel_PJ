package com.myboot.admin.user.service;

import java.util.List;

public interface AdminUserService {
	public List listUsers() throws Exception;
	public List searchUsersById(String keyword) throws Exception;
	public List searchUsersByName(String keyword) throws Exception;
	public List searchUsersByTel(String keyword) throws Exception;
	public List searchUsersByEmail(String keyword) throws Exception;
}
