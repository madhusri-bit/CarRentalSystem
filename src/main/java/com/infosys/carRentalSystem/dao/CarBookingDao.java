package com.infosys.carRentalSystem.dao;

import java.util.List;

import com.infosys.carRentalSystem.bean.Car;
import com.infosys.carRentalSystem.bean.CarBooking;

public interface CarBookingDao {
	public void save(CarBooking carBooking);
    public String generateBookingId();
    public CarBooking findById(String id);
	public List<CarBooking> findAll();
	public List<CarBooking> findAllByUsername(String username);
}
