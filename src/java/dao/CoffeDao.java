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
import java.util.ArrayList;
import java.util.List;
import model.*;

/**
 *
 * @author RIFKI
 */
public class CoffeDao {
    private Connection conn;
    private String query;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public CoffeDao(){
        conn = koneksi.getKoneksi();
    }
    
    public List<Coffe> getAllCoffe(){
        List<Coffe> coffes = new ArrayList<Coffe>();
        
        try{
            query = "SELECT * FROM coffee";
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                Coffe row = new Coffe();
                row.setIdcoffe(rs.getInt("idcoffee"));
                row.setCoffname(rs.getString("coffname"));
                row.setCoffprice(rs.getDouble("coffprice"));
                row.setStok(rs.getInt("stock"));
                row.setImage(rs.getString("image"));
                
                coffes.add(row);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return coffes;
    }

    public List<Cart> getCartProducts(ArrayList<Cart> cartList){
        List<Cart> products = new ArrayList<Cart>();
        
        try{
            if(cartList.size() > 0){
                for(Cart item:cartList){
                    query = "SELECT * FROM coffee where idcoffee=?";
                    ps = conn.prepareStatement(query);
                    ps.setInt(1, item.getIdcoffe());
                    rs = ps.executeQuery();
                    while(rs.next()){
                        Cart row = new Cart();
                        row.setIdcoffe(rs.getInt("idcoffee"));
                        row.setCoffname(rs.getString("coffname"));
                        row.setImage(rs.getString("image"));
                        row.setCoffprice(rs.getDouble("coffprice") * item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        products.add(row);
                    }
                }
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
//            e.printStackTrace();
        }
        return products;
    }
    
    public double getTotalCartPrice(ArrayList<Cart> cartList){
        double sum =0;
        try{
            if(cartList.size() > 0){
                for(Cart item:cartList){
                    query = "SELECT coffprice FROM coffee WHERE idcoffee=?";
                    ps = conn.prepareStatement(query);
                    ps.setInt(1, item.getIdcoffe());
                    rs = ps.executeQuery();
                    
                    while(rs.next()){
                        sum += rs.getDouble("coffprice") * item.getQuantity();
                    }
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return sum;
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        CoffeDao cd = new CoffeDao();
        List<Coffe> coffes = cd.getAllCoffe();
    }
    
}
