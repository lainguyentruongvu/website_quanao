package com.poly.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
public class SessionService {
@Autowired HttpSession session;


public <T> T getAttribute(String name){
	return (T)session.getAttribute(name);
}
public void setAttribute(String Username,Object value) {
	session.setAttribute(Username, value);
}
public void removeAttribute(String name) {
	session.removeAttribute(name);
}
}
