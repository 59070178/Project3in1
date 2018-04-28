/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author asus
 */
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateExample {

    private static final DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

//    public static void main(String[] args) {
//
//        Date currentDate = new Date();
//        System.out.println(dateFormat.format(currentDate));
//
//        // convert date to calendar
//        Calendar c = Calendar.getInstance();
//        c.setTime(currentDate);
//
//        // manipulate date
//        c.add(Calendar.YEAR, 1);
//        c.add(Calendar.MONTH, 1);
//        c.add(Calendar.DATE, 1); //same with c.add(Calendar.DAY_OF_MONTH, 1);
//        c.add(Calendar.HOUR, 1);
//        c.add(Calendar.MINUTE, 1);
//        c.add(Calendar.SECOND, 1);
//
//        // convert calendar to date
//        Date currentDatePlusOne = c.getTime();
//
//        System.out.println(dateFormat.format(currentDatePlusOne));
//
//    }
    
    
    private String due_date;
    private String next_date;
    
    public DateExample() {
        Date currentDate = new Date(); 
//        System.out.println(dateFormat.format(currentDate));
        due_date = dateFormat.format(currentDate);

        // convert date to calendar
        Calendar c = Calendar.getInstance();
        c.setTime(currentDate);

        // manipulate date
        c.add(Calendar.YEAR, 1);
        c.add(Calendar.MONTH, 1);
        c.add(Calendar.DATE, 1); //same with c.add(Calendar.DAY_OF_MONTH, 1);
        c.add(Calendar.HOUR, 1);
        c.add(Calendar.MINUTE, 1);
        c.add(Calendar.SECOND, 1);

        // convert calendar to date
        Date currentDatePlusOne = c.getTime();

//        System.out.println(dateFormat.format(currentDatePlusOne));
        next_date = dateFormat.format(currentDatePlusOne);
    }


    /**
     * @return the due_date
     */
    public String getDue_date() {
        return due_date;
    }

    /**
     * @return the next_date
     */
    public String getNext_date() {
        return next_date;
    }

}
