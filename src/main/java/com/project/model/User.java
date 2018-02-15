/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.model;

/**
 *
 * @author KUROMMNK
 */
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
    
}
