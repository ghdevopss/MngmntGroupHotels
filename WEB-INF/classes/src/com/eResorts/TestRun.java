package com.eResorts;

public class TestRun {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		java.sql.Connection con=ConnectionPool.getConnection();
		System.out.println("Connection Object:"+con);
	
	}

}
