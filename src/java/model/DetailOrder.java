/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author RIFKI
 */
public class DetailOrder extends Order{
    private int idcoffee;
    private int quantity;
    
    public DetailOrder() {
        
    }

    public DetailOrder(int idcoffee, int quantity) {
        this.idcoffee = idcoffee;
        this.quantity = quantity;
    }

    public int getIdcoffee() {
        return idcoffee;
    }

    public void setIdcoffee(int idcoffee) {
        this.idcoffee = idcoffee;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
