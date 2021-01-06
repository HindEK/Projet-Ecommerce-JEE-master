/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.bo;

import java.text.DecimalFormat;
import java.util.HashMap;
import models.dao.ProductDao;

/**
 *
 * @author Mehdi
 */
public class Cart {

    HashMap<Integer, Integer> productsQuantity;

    public Cart() {
        productsQuantity = new HashMap<>();
    }

    public HashMap<Integer, Integer> getProductsQuantity() {
        return productsQuantity;
    }

    public void setProductsQuantity(HashMap<Integer, Integer> productsQuantity) {
        this.productsQuantity = productsQuantity;
    }

    public boolean isProductQuantityAvailable(int productId, int quantity) {
        int availableQuantity = new ProductDao().retrieveById(productId).getQuantity();
        if (availableQuantity - quantity >= 0) {
            return true;
        }
        return false;
    }

    public void addProduct(int productId) throws Exception {

        if (productsQuantity.containsKey(productId)) {
            Integer quantity = productsQuantity.get(productId);
            if (isProductQuantityAvailable(productId, quantity + 1)) {
                productsQuantity.put(productId, ++quantity);
            } else {
                throw new Exception("Vous avez atteint la quantité maximum du produit");
            }
        } else {
            productsQuantity.put(productId, 1);
        }

    }

    public void removeProduct(int productId) throws Exception {
        if (productsQuantity.containsKey(productId)) {
            productsQuantity.remove(productId);
        } else {
            throw new Exception("Le produit que vous essayez d'enlever n'existe pas dans votre panier!!");
        }
    }

    public void modifyProductQuantity(int productId, int quantity) throws Exception {
        if (productsQuantity.containsKey(productId)) {
            if (quantity >= 0) {

                if (isProductQuantityAvailable(productId, quantity)) {
                    productsQuantity.put(productId, quantity);
                } else {
                    throw new Exception("La quantité demandée n'existe pas dans le stock!");
                }
            } else {
                removeProduct(productId);
            }
        } else {
            throw new Exception("Le produit que vous essayez d'en modifier la quantité n'existe pas dans votre panier!!");
        }
    }

    public void reduceProductQuantity(int productId) throws Exception {
        if (productsQuantity.containsKey(productId)) {
            Integer quantity = productsQuantity.get(productId);
            if (quantity > 1) {
                productsQuantity.put(productId, --quantity);
            } else {
                removeProduct(productId);
            }

        } else {
            throw new Exception("Le produit que vous essayez d'en réduire la quantité n'existe pas dans votre panier!");
        }
    }

    public int getProductQuantity(int productId) {
        if (productsQuantity.containsKey(productId)) {
            return productsQuantity.get(productId);
        } else {
            return 0;
        }
    }

    public String generateBill() {
        double montantTotal = 0;
        String billText = "<table border=\\\"1\\\"> <thead><tr>\n"
                + "<th>Produit</th>\n"
                + "<th>Quantité</th>\n"
                + "<th>Montant</th>\n"
                + "</tr></thead><tbody>";
        if (this.getProductsQuantity().size() > 0) {

            for (Integer productId : this.getProductsQuantity().keySet()) {
                Product product = new ProductDao().retrieveById(productId);

                billText += "<tr><td>" + product.getProductName()
                        + "<td><p>" + this.getProductQuantity(productId) + "</p>"
                        + "<td><p>" + product.getPrice() * this.getProductQuantity(productId) + "</p></td>"
                        + "</tr>";
                montantTotal += product.getPrice() * this.getProductQuantity(productId);
            }
            billText += "</tbody></table>";
            
            DecimalFormat df = new DecimalFormat("###.##");
            billText += "<h4> Montant total à payer : " + df.format(montantTotal) + " MAD </h4>";
        }
        return billText;
    }
}
