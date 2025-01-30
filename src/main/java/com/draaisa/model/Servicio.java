package com.draaisa.model;

public class Servicio {
    private int idServicio;
    private String descripcionServicio;
    private double costoServicio;
    private String monedaServicio;

    public Servicio(int idServicio, String descripcionServicio, double costoServicio, String monedaServicio) {
        this.idServicio = idServicio;
        this.descripcionServicio = descripcionServicio;
        this.costoServicio = costoServicio;
        this.monedaServicio = monedaServicio;
    }

    // Getters and Setters
    public int getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }

    public String getDescripcionServicio() {
        return descripcionServicio;
    }

    public void setDescripcionServicio(String descripcionServicio) {
        this.descripcionServicio = descripcionServicio;
    }

    public double getCostoServicio() {
        return costoServicio;
    }

    public void setCostoServicio(double costoServicio) {
        this.costoServicio = costoServicio;
    }

    public String getMonedaServicio() {
        return monedaServicio;
    }

    public void setMonedaServicio(String monedaServicio) {
        this.monedaServicio = monedaServicio;
    }

}
