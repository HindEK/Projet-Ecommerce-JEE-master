/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao;

import java.util.List;
import models.bo.Category;
import models.bo.Customer;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Mehdi
 */
public class CustomerDao {

    public void create(Customer customer) {
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.save(customer);
            Transaction tx = s.beginTransaction();
            tx.commit();
            s.close();
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
        }
    }

    public void update(Customer customer) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        s.update(customer);
        Transaction tx = s.beginTransaction();
        tx.commit();
        s.close();
    }

    public void delete(int customerId) {
        Session S = HibernateUtil.getSessionFactory().openSession();

        Category P = (Category) S.get(Category.class, (long) customerId);
        S.delete(P);
        Transaction tx = S.beginTransaction();
        tx.commit();
        S.close();
    }

    public List<Customer> retrieve() {
        Session S = HibernateUtil.getSessionFactory().openSession();
        Query query = S.createQuery("from Customer c ORDER BY c.lastName");
        List<Customer> customers = query.list();
        Transaction tx = S.beginTransaction();
        tx.commit();
        S.close();
        return (List<Customer>)customers;
    }
    
    public Customer retrieveById(String login) {
        Session S = HibernateUtil.getSessionFactory().openSession();
        Query query = S.createQuery("from Customer c where login='" + login + "'");
        List<Customer> customers = query.list();
        Transaction tx = S.beginTransaction();
        tx.commit();
        S.close();
        return customers.get(0);
    }
}
