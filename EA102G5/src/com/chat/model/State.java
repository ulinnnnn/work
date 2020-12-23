package com.chat.model;

import java.util.Collection;
import java.util.Map;
import java.util.Set;

public class State {
	private String type;
	// the user changing the state
	private String user;
	// total users
	private Set<String> users;
	
	private String trueUserName;
	
	private Collection<String> trueNames;
	
	private Map<String, String> allHisMsgs;
	
	private Set<String> allHisMsgsKeys;
	
	public State(String type, String user, String trueUserName,Set<String> users,Collection<String> trueNames) {
		super();
		this.type = type;
		this.user = user;
		this.users = users;
		this.trueUserName=trueUserName;
		this.trueNames=trueNames;
	}
	public State(String type, String user) {
		super();
		this.type = type;
		this.user = user;
	}
	
	public Set<String> getAllHisMsgsKeys() {
		return allHisMsgsKeys;
	}

	public void setAllHisMsgsKeys(Set<String> allHisMsgsKeys) {
		this.allHisMsgsKeys = allHisMsgsKeys;
	}

	public Map<String, String> getAllHisMsgs() {
		return allHisMsgs;
	}

	public void setAllHisMsgs(Map<String, String> allHistoryData) {
		this.allHisMsgs = allHistoryData;
	}

	public Collection<String> getTrueNames() {
		return trueNames;
	}

	public void setTrueNames(Collection<String> trueNames) {
		this.trueNames = trueNames;
	}

	public String getTrueUserName() {
		return trueUserName;
	}

	public void setTrueUserName(String trueUserName) {
		this.trueUserName = trueUserName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public Set<String> getUsers() {
		return users;
	}

	public void setUsers(Set<String> users) {
		this.users = users;
	}

}
