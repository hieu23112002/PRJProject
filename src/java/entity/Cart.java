/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;
import java.util.Vector;

/**
 *
 * @author dmx
 */
public class Cart {

    public Vector<Product> products;

    public Cart() {
        products = new Vector<>();
    }

    public Cart(Vector<Product> products) {
        this.products = products;
    }

    public Vector<Product> getProducts() {
        return products;
    }

    public void setProducts(Vector<Product> products) {
        this.products = products;
    }

    public Product getProductById(int id) {
        for (Product product : products) {
            if (product.getProduct_id() == id) {
                return product;
            }
        }
        return null;
    }

    public int getQuantityById(int id) {
        for (Product product : products) {
            if (product.getProduct_id() == id) {
                return product.getQuantity();
            }
        }
        return 0;
    }
    
    public void addProductToCart(Product p) {
        if (getProductById(p.getProduct_id()) != null) {
            getProductById(p.getProduct_id()).setQuantity(getProductById(p.getProduct_id()).getQuantity() + 1);
        } else {
            p.setQuantity(1);
            products.add(p);
        }
    }
    
   
}
