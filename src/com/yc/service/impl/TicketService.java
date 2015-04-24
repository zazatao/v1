package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Ticket;
import com.yc.service.ITicketService;
@Component
public class TicketService extends GenericService<Ticket> implements ITicketService {

	@Autowired
	GenericDao<Ticket> tickeDao;
	
	@Override
	GenericDao<Ticket> getDao() {
		return tickeDao;
	}

}
