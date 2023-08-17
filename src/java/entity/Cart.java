/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;
import java.util.Vector;


public class Cart {

    public ArrayList<Product> products;

    public Cart() {
        products = new ArrayList<>();
    }

    public Cart(ArrayList<Product> products) {
        this.products = products;
    }

    public ArrayList<Product> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<Product> products) {
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
        System.out.println("quantity from input user: " + p.getQuantity());
        boolean found = false;
        for (Product product : products) {
            if (product.getProduct_id() == p.getProduct_id()) {
                found = true;
                product.setQuantity(product.getQuantity() + p.getQuantity());
                System.out.println("update quantity of product: " + product.getQuantity());
                break;
            }
        }
        if (found == false) {
            products.add(p);
        }
    }

    public int getSubTotal() {
        int sum = 0;
        for (Product product : products) {
            sum += product.getList_price()*product.getQuantity();
        }
        return sum;
    }

}
