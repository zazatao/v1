package com.yc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yc.dao.orm.commons.GenericDao;
import com.yc.entity.Currency;
import com.yc.service.ICurrencyService;

@Component
public class CurrencyService extends GenericService<Currency> implements ICurrencyService{

	@Autowired
	GenericDao<Currency> currencyDao;
	
	@Override
	GenericDao<Currency> getDao() {
		return currencyDao;
	}

}
