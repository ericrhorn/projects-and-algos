package com.eric.events.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.eric.events.models.Event;

@Repository
public interface EventsRepo extends CrudRepository<Event, Long> {
	List<Event> findAll();
}
