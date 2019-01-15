package com.recordkeeping.util;

public class AssemblyUtil {

	public static String plantFilter(String plant) {
		String plantsList[]=plant.split(",");
		System.out.println("Plant length is - "+plantsList.length);
		String plantFilter="";
		for(int i=0;i<plantsList.length;i++) {
			if(!plantsList[i].equals(","))
				plantFilter="'"+plantsList[i]+"'";
		}
		return plantFilter;
	}
}	
