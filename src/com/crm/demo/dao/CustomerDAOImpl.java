package com.crm.demo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.demo.entity.Customer;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	//need to inject the session factory
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Customer> getCustomers() {
		
		//get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//create a query ... sort by last name
		Query<Customer> theQuery = currentSession.createQuery("from Customer ORDER BY lastName"
				 											,Customer.class);
		
		//execute query and get result list
		List<Customer> customers = theQuery.getResultList();
		
		//return the results
		return customers;
	}

	@Override
	public void saveCustomer(Customer theCustomer) {
		//get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//create a query and save customer
		currentSession.saveOrUpdate(theCustomer);
	}

	@Override
	public Customer getCustomer(int theId) {
		//get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//retrieve customer using primary key
		Customer theCustomer = currentSession.get(Customer.class, theId);
		
		return theCustomer;
	}

	@Override
	public void deleteCustomer(int theId) {
		//get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//delete customer using primary key
		Query theQuery = 
			currentSession.createQuery("Delete from Customer where id=:CustomerId");
		theQuery.setParameter("CustomerId", theId);
		
		theQuery.executeUpdate();
	}

	@Override
	public List<Customer> searchCustomers(String theSearchName) {
		//get current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		//retrieve customers with theSearchName
		Query theQuery = null;
		
		//only search unless theSearchName is empty
		//no white space 
		if(theSearchName != null && theSearchName.trim().length() > 0){
			//search for first name or last name
			//CASE SENSITIVE!!!!!
			theQuery = 
				currentSession.createQuery("from Customer where lower(firstName) like :theName or lower(lastName) like :theName",Customer.class);
			
			theQuery.setParameter("theName", "%" + theSearchName.toLowerCase() + "%");
		}
		else{
			//search is empty
			//return full list
			
			theQuery = currentSession.createQuery("from Customer", Customer.class);
		}
				
		List<Customer> customers = theQuery.getResultList();
		return customers;
	}

}
