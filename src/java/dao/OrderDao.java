/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.mysql.jdbc.Statement;
import config.koneksi;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import model.*;

/**
 *
 * @author RIFKI
 */
public class OrderDao {
    private Connection conn;
    private String query;
    private PreparedStatement ps;
    private ResultSet rs;
    private int idorder;
    
    public OrderDao(){
        conn = koneksi.getKoneksi();
    }
    
    public boolean insertOrder(Order model){
        boolean result = false;
        
        try{
            query = "INSERT INTO coffeeorder (idcust, alamat, provinsi, kota,total_price,payment) values (?,?,?,?,?,?)";
            ps = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, model.getIdcust());
            ps.setString(2, model.getAlamat());
            ps.setString(3, model.getProvinsi());
            ps.setString(4, model.getKota());
            ps.setDouble(5, model.getTotalprice());
            ps.setString(6, model.getPayment());
            ps.executeUpdate();
            
            rs = ps.getGeneratedKeys();
            if(rs.next()) {
                idorder = rs.getInt(1);
            }
            
            result = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return result;
    }
    
    public boolean insertDetailOrder(DetailOrder model){
        boolean result = false;
        String qry;
        try{
            query = "INSERT INTO detailorder (idorder,idcoffee, quantity) values (?,?,?)";
            ps = conn.prepareStatement(query);
            ps.setInt(1, idorder);
            ps.setInt(2, model.getIdcoffee());
            ps.setInt(3, model.getQuantity());
            ps.executeUpdate();
            
            
            
            result = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return result;
    }
    
    public List<Order> userOrders(int id){
        List<Order> list = new ArrayList<>();
        try{
            query = "SELECT * FROM coffeeorder,detailorder WHERE idcust=? order by coffeeorder.idorder desc";
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            while(rs.next()){
                Order order = new Order();
                CoffeDao cdao = new CoffeDao();
                int cId = rs.getInt("idcoffee");
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
    
    public  void autoId()
    {
        try {
            String sql="SELECT idinvoice FROM invoice ORDER BY idinvoice DESC LIMIT 1";
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            if(rs.next())
            {
                String rnno=rs.getString("idinvoice");
                int co=rnno.length();
                String txt= rnno.substring(0, 6);
                String num=rnno.substring(6, co);
                int n=Integer.parseInt(num);
                n++;
                String snum=Integer.toString(n);
                String ftxt=txt+snum;
                System.out.println(ftxt);
            }
            else
            {
                System.out.println("INV-001");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

 }
    
    public static void main(String[] args) {
        
        OrderDao odao = new OrderDao();
        odao.autoId();
    }
}
