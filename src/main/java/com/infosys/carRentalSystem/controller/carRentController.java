package com.infosys.carRentalSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.infosys.carRentalSystem.bean.Car;
import com.infosys.carRentalSystem.bean.CarVariant;
import com.infosys.carRentalSystem.dao.CarDao;
import com.infosys.carRentalSystem.dao.CarVariantDao;

@Controller

public class carRentController {
	@Autowired
	private CarVariantDao carVariantDao;
	
	@Autowired
	private CarDao carDao;
	
	
  @GetMapping("/variantAdd")
  public ModelAndView showVariantEntryPage() {
	  String newId=carVariantDao.generateVariantId();
	  CarVariant variant=new CarVariant(newId);
	  ModelAndView mv=new ModelAndView("variantEntryPage");
	 mv.addObject("variantRecord",variant);
	 return mv;
  }
  @PostMapping("/variantAdd")
  public ModelAndView saveVariant(@ModelAttribute("variantRecord")CarVariant variant) {
	  carVariantDao.save(variant);
	  return new ModelAndView("redirect:/index");
  }
  @GetMapping("/variantReport")
  public ModelAndView showVariantReportPage() {
	  List<CarVariant> variantList=carVariantDao.findAll();
	  ModelAndView mv=new ModelAndView("variantReportPage");
	  mv.addObject("variantList",variantList);
		 return mv;
  }
  @GetMapping("/carAdd")
  public ModelAndView showCarEntryPage() {
	  Car car=new Car();
	  List<String> variantIdList=carVariantDao.getAllVariantIds();
	  ModelAndView mv=new ModelAndView("carEntryPage");
	  mv.addObject("carRecord",car);
	  mv.addObject("variantIdList",variantIdList);
	  return mv;
  }
  @PostMapping("/carAdd")
  public ModelAndView saveCar(@ModelAttribute("carRecord")Car car) {
	  carDao.save(car);
	  return new ModelAndView("redirect:/index");
  }
  @GetMapping("/carReport")
  public ModelAndView showCarReportPage() {
    List<Car> carList=carDao.findAll();
    ModelAndView mv = new ModelAndView("carReportPage");
    mv.addObject("carList", carList);
    return mv;
  }
  @GetMapping("/variantDeletion/{id}")
  public ModelAndView deleteVariant(@PathVariable String id) {
	  carVariantDao.deleteVariantById(id);
	  return new ModelAndView("redirect:/variantReport");
  }
  
}
