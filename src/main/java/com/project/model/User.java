/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class User {
    private String id;
    private String name;
    private String userLatitude;
    private String userLongtitude;

    public User() {
        
    }
    
    public User(String id){
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserLatitude() {
        return userLatitude;
    }

    public void setUserLatitude(String userLatitude) {
        this.userLatitude = userLatitude;
    }

    public String getUserLongtitude() {
        return userLongtitude;
    }

    public void setUserLongtitude(String userLongtitude) {
        this.userLongtitude = userLongtitude;
    }
    
//    public String pullUserLocation(boolean allow){
//        return "";
//    }
    
    public void updateUserLocation(String userLatitude,String userLongitude){
        Connection con = null;
        User user = null;
        String message = null;
        try {
            con = ConnectionBuilder.getConnection();
            PreparedStatement pstm = con.prepareStatement("UPDATE users set userlatitude = ?, userlongitude = ? WHERE userid = '58130500043';");
            pstm.setString(1, userLatitude);
            pstm.setString(2,userLongitude);
            pstm.executeUpdate();            
            pstm.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            message = "404 Class not found";
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            message = "SQL Exception";
        }
        
    }
    
    public User getData(){
        Connection con = null;
        User user = null;
        String message = null;
        try {
            con = ConnectionBuilder.getConnection();
            PreparedStatement pstm = con.prepareStatement("select * from users where userid = '58130500043'");                        
            ResultSet rs = pstm.executeQuery();
            if(rs.next()){
                user = new User();
                user.setId(rs.getString("userid"));
                user.setUserLatitude(rs.getString("userlatitude"));
                user.setUserLongtitude(rs.getString("userLongitude"));
            }
            rs.close();
            pstm.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            message = "404 Class not found";
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            message = "SQL Exception";
        }
        
        return user;
        
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", name=" + name + ", userLatitude=" + userLatitude + ", userLongtitude=" + userLongtitude + '}';
    }
    
    
    
    
    public static void main(String[] args) {
        User u = new User();
        System.out.println(u.getData());        
        u.updateUserLocation("111.1", "123.1");        
        System.out.println(u.getData());

    }
    
}
