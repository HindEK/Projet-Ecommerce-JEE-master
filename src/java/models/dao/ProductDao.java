/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao;

import java.util.List;
import models.bo.Category;
import models.bo.Product;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Mehdi
 */
public class ProductDao {
    //@Override
    public void create(Product product) {
        try {
            Session s = HibernateUtil.getSessionFactory().openSession();
            s.save(product);
            Transaction tx = s.beginTransaction();
            tx.commit();
            s.close();
        } catch (HibernateException e) {
            System.err.println(e.getMessage());
        }
    }

    //@Override
    public void update(Product product) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        s.update(product);
        Transaction tx = s.beginTransaction();
        tx.commit();
        s.close();
    }

    //@Override
    public void delete(int product_id) {
        Session S = HibernateUtil.getSessionFactory().openSession();

        Product P = (Product) S.get(Category.class, (long) product_id);
        S.delete(P);
        Transaction tx = S.beginTransaction();
        tx.commit();
        S.close();
    }

    //@Override
    public List<Product> retrieve() {
        Session S = HibernateUtil.getSessionFactory().openSession();
        Query query = S.createQuery("from Product c ORDER BY c.productName");
        List<Product> products = query.list();
        Transaction tx = S.beginTransaction();
        tx.commit();
        S.close();
        return (List<Product>)products;
    }
    
    
    public Product retrieveById(int productId) {
        Session S = HibernateUtil.getSessionFactory().openSession();
        Query query = S.createQuery("from Product where productId="+productId);
        Product product = (Product) query.list().get(0);
        Transaction tx = S.beginTransaction();
        tx.commit();
        S.close();
        return product;
    }
    
    //@Override
    public List<Product> retrieveByCategory(int category_id) {
        Session S = HibernateUtil.getSessionFactory().openSession();
        Query query = S.createQuery("from Product c where category_id= " + category_id + "ORDER BY c.productName");
        List<Product> products = query.list();
        Transaction tx = S.beginTransaction();
        tx.commit();
        S.close();
        return (List<Product>)products;
    }
}
