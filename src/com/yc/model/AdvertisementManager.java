package com.yc.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.ModelMap;

import com.yc.entity.AdvertiseDistribution;
import com.yc.entity.Advertisement;
import com.yc.entity.AdvertisementPage;
import com.yc.service.IAdvertisementDistributionService;
import com.yc.service.IAdvertisementService;

//广告
public class AdvertisementManager {
	
	public AdvertisementManager(){}
	
	public ModelMap getHomePageAdvertisements(IAdvertisementDistributionService adverDistributionService,IAdvertisementService advertisementService) {
		ModelMap mode = new ModelMap();
		AdvertiseDistribution adverDistribution1 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.homePage, 1);
		AdvertiseDistribution adverDistribution2 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.homePage, 2);
		AdvertiseDistribution adverDistribution3 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.homePage, 3);
		AdvertiseDistribution adverDistribution4 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.homePage, 4);
		AdvertiseDistribution adverDistribution5 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.homePage, 5);
		
		int position1 = 0;
		int position2 = 0;
		int position3 = 0;
		int position4 = 0;
		int position5 = 0;
		if ( adverDistribution1 != null ) {
			position1 = adverDistribution1.getId();
		}
		
		if ( adverDistribution2 != null ) {
			position2 = adverDistribution2.getId();
		}
		
		if ( adverDistribution3 != null ) {
			position3 = adverDistribution3.getId();
		}
		
		if ( adverDistribution4 != null ) {
			position4 = adverDistribution4.getId();
		}

		if ( adverDistribution5 != null ) {
			position5 = adverDistribution5.getId();
		}

    	List<Advertisement> advertisements = advertisementService.getAll();
    	
    	ArrayList<Advertisement> advertisements1 = new ArrayList<Advertisement>();
    	ArrayList<Advertisement> advertisements2 = new ArrayList<Advertisement>();
    	ArrayList<Advertisement> advertisements3 = new ArrayList<Advertisement>();
    	ArrayList<Advertisement> advertisements4 = new ArrayList<Advertisement>();
    	ArrayList<Advertisement> advertisements5 = new ArrayList<Advertisement>();
    	
    	for ( int i = 0; i < advertisements.size(); i++ ) {
    		if ( position1 != 0 && advertisements.get(i).getAdverDistribution().getId() == position1 ) {
    			advertisements1.add(advertisements.get(i));
    		} else if ( position2 != 0 && advertisements.get(i).getAdverDistribution().getId() == position2 ) {
    			advertisements2.add(advertisements.get(i));
    		} else if ( position3 != 0 && advertisements.get(i).getAdverDistribution().getId() == position3 ) {
    			advertisements3.add(advertisements.get(i));
    		} else if ( position4 != 0 && advertisements.get(i).getAdverDistribution().getId() == position4 ) {
    			advertisements4.add(advertisements.get(i));
    		} else if ( position5 != 0 && advertisements.get(i).getAdverDistribution().getId() == position5 ) {
    			advertisements5.add(advertisements.get(i));
    		}
    	}

    	mode.put("advertisements1", advertisements1);
    	mode.put("advertisements2", advertisements2);
    	mode.put("advertisements3", advertisements3);
    	mode.put("advertisements4", advertisements4);
    	mode.put("advertisements5", advertisements5);
    	
		return mode;
	}
	
	public ModelMap getInnerPageAdvertisements(IAdvertisementDistributionService adverDistributionService,IAdvertisementService advertisementService) {
		ModelMap mode = new ModelMap();	
		AdvertiseDistribution adverDistribution1 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.innerPage, 1);
		
		int position1 = 0;
		if ( adverDistribution1 != null ) {
			position1 = adverDistribution1.getId();
		}

    	List<Advertisement> advertisements = advertisementService.getAll();
    	
    	ArrayList<Advertisement> advertisements1 = new ArrayList<Advertisement>();
    	
    	for ( int i = 0; i < advertisements.size(); i++ ) {
    		if ( position1 != 0 && advertisements.get(i).getAdverDistribution().getId() == position1 ) {
    			advertisements1.add(advertisements.get(i));
    		}
    	}

    	mode.put("advertisements1", advertisements1);
    	
		return mode;
	}
	
	public ModelMap getDetailPageAdvertisements(IAdvertisementDistributionService adverDistributionService,IAdvertisementService advertisementService) {
		ModelMap mode = new ModelMap();
		
		AdvertiseDistribution adverDistribution1 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.detailPage, 1);
		AdvertiseDistribution adverDistribution2 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.detailPage, 2);
		AdvertiseDistribution adverDistribution3 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.detailPage, 3);

		int position1 = 0;
		int position2 = 0;
		int position3 = 0;
		if ( adverDistribution1 != null ) {
			position1 = adverDistribution1.getId();
		}
		
		if ( adverDistribution2 != null ) {
			position2 = adverDistribution2.getId();
		}
		
		if ( adverDistribution3 != null ) {
			position3 = adverDistribution3.getId();
		}

    	List<Advertisement> advertisements = advertisementService.getAll();
    	
    	ArrayList<Advertisement> advertisements1 = new ArrayList<Advertisement>();
    	ArrayList<Advertisement> advertisements2 = new ArrayList<Advertisement>();
    	ArrayList<Advertisement> advertisements3 = new ArrayList<Advertisement>();
    	
    	for ( int i = 0; i < advertisements.size(); i++ ) {
    		if ( position1 != 0 && advertisements.get(i).getAdverDistribution().getId() == position1 ) {
    			advertisements1.add(advertisements.get(i));
    		} else if ( position2 != 0 && advertisements.get(i).getAdverDistribution().getId() == position2 ) {
    			advertisements2.add(advertisements.get(i));
    		} else if ( position3 != 0 && advertisements.get(i).getAdverDistribution().getId() == position3 ) {
    			advertisements3.add(advertisements.get(i));
    		}
    	}

    	mode.put("advertisements1", advertisements1);
    	mode.put("advertisements2", advertisements2);
    	mode.put("advertisements3", advertisements3);
    	
		return mode;
	}
	
	public ModelMap getCarPageAdvertisements(IAdvertisementDistributionService adverDistributionService,IAdvertisementService advertisementService) {
		ModelMap mode = new ModelMap();
		
		AdvertiseDistribution adverDistribution1 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.carPage, 1);
		AdvertiseDistribution adverDistribution2 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.carPage, 2);
		AdvertiseDistribution adverDistribution3 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.carPage, 3);
		
		int position1 = 0;
		int position2 = 0;
		int position3 = 0;

		if ( adverDistribution1 != null ) {
			position1 = adverDistribution1.getId();
		}
		
		if ( adverDistribution2 != null ) {
			position2 = adverDistribution2.getId();
		}
		
		if ( adverDistribution3 != null ) {
			position3 = adverDistribution3.getId();
		}

    	List<Advertisement> advertisements = advertisementService.getAll();
    	
    	ArrayList<Advertisement> advertisements1 = new ArrayList<Advertisement>();
    	ArrayList<Advertisement> advertisements2 = new ArrayList<Advertisement>();
    	ArrayList<Advertisement> advertisements3 = new ArrayList<Advertisement>();

    	for ( int i = 0; i < advertisements.size(); i++ ) {
    		if ( position1 != 0 && advertisements.get(i).getAdverDistribution().getId() == position1 ) {
    			advertisements1.add(advertisements.get(i));
    		} else if ( position2 != 0 && advertisements.get(i).getAdverDistribution().getId() == position2 ) {
    			advertisements2.add(advertisements.get(i));
    		} else if ( position3 != 0 && advertisements.get(i).getAdverDistribution().getId() == position3 ) {
    			advertisements3.add(advertisements.get(i));
    		}
    	}

    	mode.put("advertisements1", advertisements1);
    	mode.put("advertisements2", advertisements2);
    	mode.put("advertisements3", advertisements3);
    	
		return mode;
	}
	
	public ModelMap getElecProductionPageAdvertisements(IAdvertisementDistributionService adverDistributionService,IAdvertisementService advertisementService) {
		ModelMap mode = new ModelMap();
		
		AdvertiseDistribution adverDistribution1 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.elecProductionPage, 1);
		AdvertiseDistribution adverDistribution2 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.elecProductionPage, 2);
		AdvertiseDistribution adverDistribution3 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.elecProductionPage, 3);
		AdvertiseDistribution adverDistribution4 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.elecProductionPage, 4);
		
		int position1 = 0;
		int position2 = 0;
		int position3 = 0;
		int position4 = 0;

		if ( adverDistribution1 != null ) {
			position1 = adverDistribution1.getId();
		}
		
		if ( adverDistribution2 != null ) {
			position2 = adverDistribution2.getId();
		}
		
		if ( adverDistribution3 != null ) {
			position3 = adverDistribution3.getId();
		}
		
		if ( adverDistribution4 != null ) {
			position4 = adverDistribution4.getId();
		}

    	List<Advertisement> advertisements = advertisementService.getAll();
    	
    	ArrayList<Advertisement> advertisements1 = new ArrayList<Advertisement>();
    	ArrayList<Advertisement> advertisements2 = new ArrayList<Advertisement>();
    	ArrayList<Advertisement> advertisements3 = new ArrayList<Advertisement>();
    	ArrayList<Advertisement> advertisements4 = new ArrayList<Advertisement>();
    	
    	for ( int i = 0; i < advertisements.size(); i++ ) {
    		if ( position1 != 0 && advertisements.get(i).getAdverDistribution().getId() == position1 ) {
    			advertisements1.add(advertisements.get(i));
    		} else if ( position2 != 0 && advertisements.get(i).getAdverDistribution().getId() == position2 ) {
    			advertisements2.add(advertisements.get(i));
    		} else if ( position3 != 0 && advertisements.get(i).getAdverDistribution().getId() == position3 ) {
    			advertisements3.add(advertisements.get(i));
    		} else if ( position4 != 0 && advertisements.get(i).getAdverDistribution().getId() == position4 ) {
    			advertisements4.add(advertisements.get(i));
    		}
    	}

    	mode.put("advertisements1", advertisements1);
    	mode.put("advertisements2", advertisements2);
    	mode.put("advertisements3", advertisements3);
    	mode.put("advertisements4", advertisements4);

		return mode;
	}
	
	public ModelMap getMyOfficePageAdvertisements(IAdvertisementDistributionService adverDistributionService,IAdvertisementService advertisementService) {
		ModelMap mode = new ModelMap();
		
		AdvertiseDistribution adverDistribution1 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.myOfficePage, 1);
		AdvertiseDistribution adverDistribution2 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.myOfficePage, 2);
		
		int position1 = 0;
		int position2 = 0;

		if ( adverDistribution1 != null ) {
			position1 = adverDistribution1.getId();
		}
		
		if ( adverDistribution2 != null ) {
			position2 = adverDistribution2.getId();
		}

    	List<Advertisement> advertisements = advertisementService.getAll();
    	
    	ArrayList<Advertisement> advertisements1 = new ArrayList<Advertisement>();
    	ArrayList<Advertisement> advertisements2 = new ArrayList<Advertisement>();

    	for ( int i = 0; i < advertisements.size(); i++ ) {
    		if ( position1 != 0 && advertisements.get(i).getAdverDistribution().getId() == position1 ) {
    			advertisements1.add(advertisements.get(i));
    		} else if ( position2 != 0 && advertisements.get(i).getAdverDistribution().getId() == position2 ) {
    			advertisements2.add(advertisements.get(i));
    		}
    	}

    	mode.put("advertisements1", advertisements1);
    	mode.put("advertisements2", advertisements2);
    	
		return mode;
	}
	
	public ModelMap getLoginPageAdvertisements(IAdvertisementDistributionService adverDistributionService,IAdvertisementService advertisementService) {
		ModelMap mode = new ModelMap();
		
		AdvertiseDistribution adverDistribution1 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.homePage, 5);
		
		int position1 = 0;
		if ( adverDistribution1 != null ) {
			position1 = adverDistribution1.getId();
		}

    	List<Advertisement> advertisements = advertisementService.getAll();
    	
    	ArrayList<Advertisement> advertisements1 = new ArrayList<Advertisement>();
    	for ( int i = 0; i < advertisements.size(); i++ ) {
    		if ( position1 != 0 && advertisements.get(i).getAdverDistribution().getId() == position1 ) {
    			advertisements1.add(advertisements.get(i));
    		}
    	}
    	mode.put("advertisements5", advertisements1);

		return mode;
	}
	
	public ModelMap getBrandPageAdvertisements(IAdvertisementDistributionService adverDistributionService,IAdvertisementService advertisementService) {
		ModelMap mode = new ModelMap();	
		AdvertiseDistribution adverDistribution1 = adverDistributionService.findByWhichPageAndPosition(AdvertisementPage.brandPage, 1);
		
		int position1 = 0;
		if ( adverDistribution1 != null ) {
			position1 = adverDistribution1.getId();
		}

    	List<Advertisement> advertisements = advertisementService.getAll();
    	
    	ArrayList<Advertisement> advertisements1 = new ArrayList<Advertisement>();

    	for ( int i = 0; i < advertisements.size(); i++ ) {
    		if ( position1 != 0 && advertisements.get(i).getAdverDistribution().getId() == position1 ) {
    			advertisements1.add(advertisements.get(i));
    		}
    	}
    	mode.put("advertisements1", advertisements1);
    	
		return mode;
	}
}
