package models.bo;
// Generated Mar 13, 2020 10:12:35 AM by Hibernate Tools 4.3.1



/**
 * Purchase generated by hbm2java
 */
public class Purchase  implements java.io.Serializable {


     private Integer purchaseId;
     private Bill bill;
     private Product product;

    public Purchase() {
    }

    public Purchase(Bill bill, Product product) {
       this.bill = bill;
       this.product = product;
    }
   
    public Integer getPurchaseId() {
        return this.purchaseId;
    }
    
    public void setPurchaseId(Integer purchaseId) {
        this.purchaseId = purchaseId;
    }
    public Bill getBill() {
        return this.bill;
    }
    
    public void setBill(Bill bill) {
        this.bill = bill;
    }
    public Product getProduct() {
        return this.product;
    }
    
    public void setProduct(Product product) {
        this.product = product;
    }




}


