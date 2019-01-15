package com.recordkeeping.util;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

public class CustomJsonDateDeserializer extends JsonDeserializer<Date> {
    

	@Override
	public Date deserialize(JsonParser jsonParser, DeserializationContext arg1) throws IOException, JsonProcessingException {
		 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		 	
	        String date = jsonParser.getText();
	        System.out.println("JSON Parser - "+date);
	        try {
	            return  convertUtilDateToSqlDate(format.parse(date));
	        } catch (ParseException e) {
	            throw new RuntimeException(e);
	        }
	}
	
	public static java.sql.Date convertUtilDateToSqlDate(java.util.Date date){
		java.sql.Date sqlDate=new Date(date.getTime());
		return sqlDate;
	}
}
