package com.myboot.admin.user.service;

import java.util.List;
import java.util.Map;

public interface AdminUserService {
	public List listUsers() throws Exception;
	public List searchUsersOption (Map searchOption) throws Exception;
}
