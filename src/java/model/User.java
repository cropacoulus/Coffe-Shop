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
public class User {
    private String username;
    private String password;
    private int idcust;
    private String custname;
    private String custaddress;
    private String custphone;
    private String role;
    
    public User(){
        
    }
    
    public User(String username, String password, int idcust, String custname, String custaddress, String custphone, String role){
        
        this.username = username;
        this.password = password;
        this.idcust = idcust;
        this.custname = custname;
        this.custaddress = custaddress;
        this.custphone = custphone;
        this.role = role;
    }
    
    public User(String username, String password, String custname){
        this.username = username;
        this.password = password;
        this.custname = custname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIdcust() {
        return idcust;
    }

    public void setIdcust(int idcust) {
        this.idcust = idcust;
    }

    public String getCustname() {
        return custname;
    }

    public void setCustname(String custname) {
        this.custname = custname;
    }

    public String getCustaddress() {
        return custaddress;
    }

    public void setCustaddress(String custaddress) {
        this.custaddress = custaddress;
    }

    public String getCustphone() {
        return custphone;
    }

    public void setCustphone(String custphone) {
        this.custphone = custphone;
    }
    
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
