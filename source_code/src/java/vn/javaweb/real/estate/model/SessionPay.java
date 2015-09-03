package vn.javaweb.real.estate.model;

import java.util.Date;

/**
 * @description Lần thanh toán
 * @author PhanAnh
 */
public class SessionPay {
    
    private int id;
    private double percentPay;
    private String pricePay;
    private Date timePay;
    
    public SessionPay() {
    }

    public SessionPay(int id, double percentPay, String pricePay, Date timePay) {
        this.id = id;
        this.percentPay = percentPay;
        this.pricePay = pricePay;
        this.timePay = timePay;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getPercentPay() {
        return percentPay;
    }

    public void setPercentPay(double percentPay) {
        this.percentPay = percentPay;
    }

    public String getPricePay() {
        return pricePay;
    }

    public void setPricePay(String pricePay) {
        this.pricePay = pricePay;
    }

    public Date getTimePay() {
        return timePay;
    }

    public void setTimePay(Date timePay) {
        this.timePay = timePay;
    }

    @Override
    public String toString() {
        return super.toString(); 
    }        
}
