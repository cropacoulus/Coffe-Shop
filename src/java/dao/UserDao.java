/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import config.koneksi;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author RIFKI
 */
public class UserDao {
    private Connection conn;
    private String query;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public UserDao(){
        conn = koneksi.getKoneksi();
    }
    
    public User userLogin(String username, String password){
        User user = null;
        try{
            query = "SELECT * FROM customer WHERE username=? AND password=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            
            if(rs.next()){
                user = new User();
                user.setIdcust(rs.getInt("idcust"));
                user.setUsername(rs.getString("username"));
                user.setCustname(rs.getString("custname"));
                user.setRole(rs.getString("role"));
            }
        }catch(Exception e){
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return user;
    }
    
    public boolean userRegister(User user){
        boolean set = false;
        try{
            query = "INSERT INTO customer(username,password,custname) VALUES (?,?,?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getCustname());
            ps.executeUpdate();
            set = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
    
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
         UserDao udao = new UserDao();
         User user = udao.userLogin("ramtzy", "12345");
         System.out.println(user);       
    }
}
