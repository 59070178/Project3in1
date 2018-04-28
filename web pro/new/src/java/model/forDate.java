/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Calendar;

/**
 *
 * @author Suttida Sat
 */
public class forDate {
    
    int year;
    int month;
    String Str_month;
    int date;

    public forDate() {
    }
    


    public int getYear() {
        return year;
    }

    public void setYear() {
        Calendar now = Calendar.getInstance();
        now.get(Calendar.YEAR);
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth() {
        Calendar now = Calendar.getInstance();
        
        this.month = now.get(Calendar.MONTH) + 1;
    }

    public int getDate() {
        return date;
    }

    public void setDate() {
        Calendar now = Calendar.getInstance();
        this.date = now.get(Calendar.DATE);
    }
     

    public String getStr_monthForbill() {
        return Str_month;
    }

    public void setStr_monthForbill(int int_m) {
        String[] month_lst ={"January", "February", "March", "April"
             , "May" , "June" ,"July" ,"August" ,"September" , "October" ,"November" , "December"};
        
        this.Str_month =   month_lst[int_m - 2] ;
    }
    
    
}
