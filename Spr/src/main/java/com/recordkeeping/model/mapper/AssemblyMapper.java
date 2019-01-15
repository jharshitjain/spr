package com.recordkeeping.model.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.recordkeeping.model.Assembly;

public class AssemblyMapper implements RowMapper<Assembly> {

	public Assembly mapRow(ResultSet rs, int arg1) throws SQLException {
		// TODO Auto-generated method stub
		Assembly assembly=new Assembly();
		assembly.setAssembly_id(rs.getInt("ASSEMBLY_ID"));
		assembly.setSno(rs.getInt("SNO"));
		assembly.setAssembly_date(rs.getDate("ASSEMBLY_DATE"));
		assembly.setPlantno(rs.getInt("PLANTNO"));
		assembly.setCustomer(rs.getString("CUSTOMER"));
		assembly.setCellno(rs.getInt("CELLNO"));
		assembly.setInsert_mould(rs.getString("INSERT_MOULD"));
		assembly.setShift(rs.getString("SHIFT"));
		assembly.setCar_model(rs.getString("CAR_MODEL"));
		assembly.setPart_name(rs.getString("PART_NAME"));
		assembly.setFr_rr(rs.getString("FR_RR"));
		assembly.setRh_lh(rs.getString("RH_LH"));
		assembly.setProd_target(rs.getInt("PROD_TARGET"));
		assembly.setProd_actual(rs.getInt("PROD_ACTUAL"));
		assembly.setUsed_man_power(rs.getInt("USED_MAN_POWER"));
		assembly.setDown_time(rs.getInt("DOWN_TIME"));
		assembly.setBd_time(rs.getInt("BD_TIME"));
		assembly.setProdrun_time(rs.getInt("PRODRUN_TIME"));
		assembly.setCo_time_target(rs.getFloat("CO_TIME_TARGET"));
		assembly.setCo_time_actual(rs.getFloat("CO_TIME_ACTUAL"));
		assembly.setNo_of_co(rs.getInt("NO_OF_CO"));
		assembly.setStartuptime_target(rs.getFloat("STARTUPTIME_TARGET"));
		assembly.setStartuptime_actual(rs.getFloat("STARTUPTIME_ACTUAL"));
		assembly.setNo_of_setup(rs.getInt("NO_OF_SETUP"));
		assembly.setInternal_rej(rs.getInt("INTERNAL_REJ"));
		assembly.setProcess_scrap(rs.getFloat("PROCESS_SCRAP"));
		
		return assembly;		
	}

}
