package com.infosys.carRentalSystem.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.infosys.carRentalSystem.bean.Car;

public interface CarRepository extends JpaRepository<Car,String>{

}
