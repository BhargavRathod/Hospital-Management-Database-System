--1.Hospital Table
  create SEQUENCE hospital_id_seq start with 0001   INCREMENT BY 1 MAXVALUE 5000 NOCYCLE nocache ORDER;
--2.Admin Table 
  create SEQUENCE admin_id_seq start with 0001   INCREMENT BY 1 MAXVALUE 5000 NOCYCLE nocache ORDER;
--3.Department Table  
  create SEQUENCE dept_id_seq start with 0001 INCREMENT BY 1 MAXVALUE 5000 NOCYCLE nocache ORDER;
--4.Doctor Table 
  create SEQUENCE doct_id_seq start with 0001   INCREMENT BY 1 MAXVALUE 5000 NOCYCLE nocache ORDER;
--5.User Table  
  create SEQUENCE user_id_seq start with 0001   INCREMENT BY 1 MAXVALUE 5000 NOCYCLE nocache ORDER;
--6.Patient Table  
  create SEQUENCE pt_id_seq start with 0001   INCREMENT BY 1 MAXVALUE 5000 NOCYCLE nocache ORDER;
--7.Appointment Table    
  create SEQUENCE apt_id_seq start with 0001   INCREMENT BY 1 MAXVALUE 5000 NOCYCLE nocache ORDER;
--8.Staff Table   
  create sequence staff_id_seq start with 0001  increment by 1 maxvalue 5000 nocycle nocache order;
--9.Medicine Information data  
  create sequence med_id_seq start with 0001  maxvalue 5000 increment by 1 nocycle nocache order;
--10.Order Information  
  create sequence order_id_seq start with 0001  maxvalue 5000 increment by 1 nocycle nocache order;
--11.Operation Table   
  create sequence op_id_seq start with 0001  maxvalue 5000 increment by 1 nocycle nocache order;   