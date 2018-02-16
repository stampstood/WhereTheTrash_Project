/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.model;

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
    
    
    
}
