/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author LAPTOP VINH HA
 */
public class Stocks {
    private int store_id, product_id, quantity;

    public Stocks() {
    }

    public Stocks(int store_id, int product_id, int quantity) {
        this.store_id = store_id;
        this.product_id = product_id;
        this.quantity = quantity;
    }

    public int getStore_id() {
        return store_id;
    }

    public void setStore_id(int store_id) {
        this.store_id = store_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Stocks{" + "store_id=" + store_id + ", product_id=" + product_id + ", quantity=" + quantity + '}';
    }
    
    
    
}
