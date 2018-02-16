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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Trash {
    private int id;
    private String trashLatitude;
    private String trashLongtitude;
    private String statusTrash;
    private String zoneName;

    public Trash() {
    }

    public Trash(int id, String trashLatitude, String trashLongtitude, String statusTrash, String zoneName) {
        this.id = id;
        this.trashLatitude = trashLatitude;
        this.trashLongtitude = trashLongtitude;
        this.statusTrash = statusTrash;
        this.zoneName = zoneName;
    }
    
    public Trash(ResultSet rs) throws SQLException {
        id = rs.getInt("idTrash");
        trashLatitude = rs.getString("trashLa");
        trashLongtitude = rs.getString("trashLong");
        statusTrash = rs.getString("statusTrash");
        zoneName = rs.getString("zoneName");
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTrashLatitude() {
        return trashLatitude;
    }

    public void setTrashLatitude(String trashLatitude) {
        this.trashLatitude = trashLatitude;
    }

    public String getTrashLongtitude() {
        return trashLongtitude;
    }

    public void setTrashLongtitude(String trashLongtitude) {
        this.trashLongtitude = trashLongtitude;
    }

    public String getStatusTrash() {
        return statusTrash;
    }

    public void setStatusTrash(String statusTrash) {
        this.statusTrash = statusTrash;
    }

    public String getZoneName() {
        return zoneName;
    }

    public void setZoneName(String zoneName) {
        this.zoneName = zoneName;
    }

    @Override
    public String toString() {
        return "Trash{" + "id=" + id + ", trashLatitude=" + trashLatitude + ", trashLongtitude=" + trashLongtitude + ", statusTrash=" + statusTrash + ", zoneName=" + zoneName + '}';
    }
    
    public List<Trash> pullTrashLocation(){
        List<Trash> trashList = null;
        Trash trash = null;
        Connection con = null;
        try{
            con = ConnectionBuilder.getConnection();
            PreparedStatement pstm = con.prepareStatement("SELECT * FROM Trashes");
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                trash = new Trash(rs);
                if (trashList == null) {
                    trashList = new ArrayList();
                }
                trashList.add(trash);
            }
            rs.close();
            pstm.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Trash.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Trash.class.getName()).log(Level.SEVERE, null, ex);
        }
        return trashList;
    }
    
    public static void main(String[] args) {
        Trash t = new Trash();
        List<Trash> trashList = t.pullTrashLocation();
        System.out.println("Size : "+t.pullTrashLocation().size());
        for(int i=0;i<trashList.size();i++){
            System.out.println(trashList.get(i));
        }
        
    }
    
    
    
}
