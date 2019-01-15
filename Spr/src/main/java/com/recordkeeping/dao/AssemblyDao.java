package com.recordkeeping.dao;

import java.sql.Date;
import java.util.List;
import java.util.Set;

import com.recordkeeping.model.AssemblyEntity;
import com.recordkeeping.model.ExtrusionEntity;
import com.recordkeeping.model.FlockingEntity;

public interface AssemblyDao {
//public int persistRecord(String operationType,Object entity);
public int persistRecord(String operationType,Object entity) throws Exception;
public Set<String> loadAllCustomerGroup();
public Set<String> loadPartListByModelAndCustomerGrp(String model,String customerGroup);
public Set<String> loadModelDetailsByCustomerGroup(String customerGroup);
public int fetchLastSerialNo(String type);
public List<AssemblyEntity> loadAssemblyRecords(String emp_code,String plantFilter,String fetchingType);
public List<ExtrusionEntity> loadExtrusionRecords(String emp_code,String plantFilter,String fetchingType);
public List<FlockingEntity> loadFlockingRecords(String emp_code,String plantFilter,String fetchingType);
public List<AssemblyEntity> loadAssemblyRecords(String plant);
public List<ExtrusionEntity> loadExtrusionRecords(String plantFilter);
public List<FlockingEntity> loadFlockingRecords(String plantFilter);
public int updateAssemblyRecord(AssemblyEntity assemblyEntity);
public int updateExtrusionRecord(ExtrusionEntity extrusionEntity);
public int updateFlockingRecord(FlockingEntity flockingEntity);
public int updateApproveStatus(int isApproved,int approvedBy,Date approved_date,Date modify_date,int id,String type );
}
