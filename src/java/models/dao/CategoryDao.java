/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao;

import java.util.List;
import models.bo.Category;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Mehdi
 */
public class CategoryDao {
    //@Override
    public void create(Category category) {
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.save(category);
            Transaction tx = s.beginTransaction();
            tx.commit();
            s.close();
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
        }
    }

    //@Override
    public void update(Category category) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        s.update(category);
        Transaction tx = s.beginTransaction();
        tx.commit();
        s.close();
    }

    //@Override
    public void delete(int id_category) {
        Session S = HibernateUtil.getSessionFactory().openSession();

        Category P = (Category) S.get(Category.class, (long) id_category);
        S.delete(P);
        Transaction tx = S.beginTransaction();
        tx.commit();
        S.close();
    }

    //@Override
    public List<Category> retrieve() {
        Session S = HibernateUtil.getSessionFactory().openSession();
        Query query = S.createQuery("from Category c ORDER BY c.categoryName");
        List<Category> categories = query.list();
        Transaction tx = S.beginTransaction();
        tx.commit();
        S.close();
        return (List<Category>)categories;
    }
    
    public Category retrieveById(int categoryId) {
        Session S = HibernateUtil.getSessionFactory().openSession();
        Query query = S.createQuery("from Category c where categoryId=" + categoryId);
        List<Category> categories = query.list();
        Transaction tx = S.beginTransaction();
        tx.commit();
        S.close();
        return categories.get(0);
    }
}
