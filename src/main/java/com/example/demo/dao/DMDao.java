  
package com.example.demo.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.example.demo.db.DBManager;
import com.example.demo.vo.DMVO;

@Repository
public class DMDao {
		
	public List<DMVO> dmList(DMVO d){
		return DBManager.dmList(d);
	}
	
	public List<DMVO> getContentList(DMVO d){
		return DBManager.getContentList(d);
	}
	
	public int insertDM(DMVO d) {
		return DBManager.insertDM(d);
	}
	
}