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
public class Coffe {
    private int idcoffe;
    private String coffname;
    private double coffprice;
    private int stok;
    private String image;
    
    public Coffe(){
        
    }

    public Coffe(int idcoffe, String coffname, double coffprice, int stok, String image) {
        this.idcoffe = idcoffe;
        this.coffname = coffname;
        this.coffprice = coffprice;
        this.stok = stok;
        this.image = image;
    }

    public int getIdcoffe() {
        return idcoffe;
    }

    public void setIdcoffe(int idcoffe) {
        this.idcoffe = idcoffe;
    }

    public String getCoffname() {
        return coffname;
    }

    public void setCoffname(String coffname) {
        this.coffname = coffname;
    }

    public double getCoffprice() {
        return coffprice;
    }

    public void setCoffprice(double coffprice) {
        this.coffprice = coffprice;
    }

    public int getStok() {
        return stok;
    }

    public void setStok(int stok) {
        this.stok = stok;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Coffe{" + "idcoffe=" + idcoffe + ", coffname=" + coffname + ", coffprice=" + coffprice + ", stok=" + stok + ", image=" + image + '}';
    }
    
    
}
