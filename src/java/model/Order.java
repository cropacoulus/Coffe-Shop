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
public class Order extends User{
    private int idorder;
    private int idcust;
    private String alamat;
    private String provinsi;
    private String kota;
    private String phonenumber;
    private double totalprice;
    private String payment;
    private int status;
    private String paymentdate;

    public Order () {
        
    }
    
    public Order(int idorder, int idcust, String alamat, String provinsi, String kota, String phonenumber, double totalprice, String payment, int status, String paymentdate) {
        super();
        this.idorder = idorder;
        this.idcust = idcust;
        this.alamat = alamat;
        this.provinsi = provinsi;
        this.kota = kota;
        this.phonenumber = phonenumber;
        this.totalprice = totalprice;
        this.payment = payment;
        this.status = status;
        this.paymentdate = paymentdate;
    }

    public Order(int idcust, String alamat, String provinsi, String kota, String phonenumber, double totalprice, String payment, int status, String paymentdate) {
        super();
        this.idcust = idcust;
        this.alamat = alamat;
        this.provinsi = provinsi;
        this.kota = kota;
        this.phonenumber = phonenumber;
        this.totalprice = totalprice;
        this.payment = payment;
        this.status = status;
        this.paymentdate = paymentdate;
    }

    public int getIdorder() {
        return idorder;
    }

    public void setIdorder(int idorder) {
        this.idorder = idorder;
    }

    public int getIdcust() {
        return idcust;
    }

    public void setIdcust(int idcust) {
        this.idcust = idcust;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public String getProvinsi() {
        return provinsi;
    }

    public void setProvinsi(String provinsi) {
        this.provinsi = provinsi;
    }

    public String getKota() {
        return kota;
    }

    public void setKota(String kota) {
        this.kota = kota;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getPaymentdate() {
        return paymentdate;
    }

    public void setPaymentdate(String paymentdate) {
        this.paymentdate = paymentdate;
    }
    
    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }
    
    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    @Override
    public String toString() {
        return "Order{" + "idorder=" + idorder + ", idcust=" + idcust + ", alamat=" + alamat + ", provinsi=" + provinsi + ", kota=" + kota + ", phonenumber=" + phonenumber + ", totalprice=" + totalprice + ", payment=" + payment + ", status=" + status + ", paymentdate=" + paymentdate + '}';
    }

    
    
    
}
