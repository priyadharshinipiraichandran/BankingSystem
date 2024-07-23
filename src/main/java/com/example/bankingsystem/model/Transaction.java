package com.example.bankingsystem.model;

import java.sql.Date;
import java.sql.Time;

public class Transaction {
    private String senderAccNo;
    private String receiverAccNo;
    private double amountTransferred;
    private Date date;
    private Time time;

    // Getters and Setters
    public String getSenderAccNo() {
        return senderAccNo;
    }

    public void setSenderAccNo(String senderAccNo) {
        this.senderAccNo = senderAccNo;
    }

    public String getReceiverAccNo() {
        return receiverAccNo;
    }

    public void setReceiverAccNo(String receiverAccNo) {
        this.receiverAccNo = receiverAccNo;
    }

    public double getAmountTransferred() {
        return amountTransferred;
    }

    public void setAmountTransferred(double amountTransferred) {
        this.amountTransferred = amountTransferred;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }
}
