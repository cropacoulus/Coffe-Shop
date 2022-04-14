/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author RIFKI
 */
public class koneksi {
    static Connection koneksi;
    
    public static Connection getKoneksi(){
        if (koneksi==null){
            MysqlDataSource data = new MysqlDataSource();
            data.setDatabaseName("coffeshop");
            data.setUser("root");
            data.setPassword("");
            try{
                koneksi = data.getConnection();
                System.out.println("Koneksi Sukses");
            }catch(SQLException se){
                System.out.println("Koneksi gagal" + se);
            }
        }
        return koneksi;
    }
    
    public static void main(String[] args){
        getKoneksi();
    }
}
