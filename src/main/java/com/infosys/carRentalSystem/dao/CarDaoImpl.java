package com.infosys.carRentalSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.infosys.carRentalSystem.bean.Car;

@Repository
@Service
public class CarDaoImpl implements CarDao {
	@Autowired

	private CarRepository repository;

	@Override
    public void save(Car car) { 
		repository.save(car);
	}
	@Override
	public Car findById(String id) {
		 return repository.findById(id).get();

	}
	@Override
	public List<Car> findAll() {
         return repository.findAll();
	}
    @Override
     public void deleteCarById(String id) 
	{ 
		repository.deleteById(id);
	}
    public List<Car> getAvailableCars(){
    	return repository.getAvailableCars();
    }
}
