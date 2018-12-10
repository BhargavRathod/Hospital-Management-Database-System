DROP TABLE admin_master;
DROP TABLE appoinment;
DROP TABLE appointment_avail;
DROP TABLE department_master;
DROP TABLE dept_facility;
DROP TABLE doctor_master;
DROP TABLE doctor_class;
DROP TABLE doctor_contact;
DROP TABLE hospital;
DROP TABLE medicine_store;
DROP TABLE operates;
DROP TABLE order_master;
DROP TABLE patient_master;
DROP TABLE qualification;
DROP TABLE room_status;
DROP TABLE staff;
DROP TABLE staff_contact;
DROP TABLE user_contact;
DROP TABLE user_master;
CREATE TABLE hospital
  (
    hospital_id     VARCHAR(10),
    hospital_name   VARCHAR(20),
    hospital_branch VARCHAR(20),
    PRIMARY KEY(hospital_id)
  );
ALTER TABLE hospital MODIFY (hospital_id VARCHAR(30));
CREATE TABLE admin_master
  (
    admin_id         VARCHAR(10),
    admin_first_name VARCHAR(20),
    admin_mid_name   VARCHAR(20),
    admin_last_name  VARCHAR(20),
    admin_password   VARCHAR(10),
    hospital_id REFERENCES hospital(hospital_id),
    PRIMARY KEY(admin_id)
  );
ALTER TABLE admin_master MODIFY (admin_id    VARCHAR(30));
ALTER TABLE admin_master MODIFY (hospital_id VARCHAR(30));
CREATE TABLE doctor_master
  (
    doct_id         VARCHAR(10),
    doct_first_name VARCHAR(30),
    doct_mid_name   VARCHAR(30),
    doct_last_name  VARCHAR(30),
    dept_id REFERENCES department_master(dept_id),
    PRIMARY KEY(doct_id)
  );
alter table doctor_master modify (doct_id varchar(30));
alter table doctor_master modify (doct_id varchar(30)); 

  
CREATE TABLE department_master
  (
    dept_id                 VARCHAR(10),
    dept_name               VARCHAR(15),
    no_of_doctors           INT,
    no_of_operation_theater INT,
    hospital_id REFERENCES hospital(hospital_id),
    PRIMARY KEY(dept_id)
  );
ALTER TABLE department_master MODIFY (dept_name   VARCHAR(30));
ALTER TABLE department_master MODIFY (doct_id     VARCHAR(30));
ALTER TABLE department_master MODIFY (hospital_id VARCHAR(30));

CREATE TABLE doctor_contact
  (
    doct_id         VARCHAR(10) REFERENCES doctor_master(doct_id),
    doct_contact_no INT CONSTRAINT cont_cons CHECK(REGEXP_LIKE(doct_contact_no,'^([1-9]{1}[0-9]{9})$'))
  );
alter table doctor_contact modify (doct_id varchar(30));     
  
CREATE TABLE qualification
  (
    doct_id       VARCHAR(10) REFERENCES doctor_master(doct_id),
    qualification VARCHAR(25)
  );
alter table qualification modify (doct_id varchar(30)); 

CREATE TABLE doctor_class
  (
    doct_id REFERENCES doctor_master(doct_id),
    visiting_time VARCHAR2(25),
    availability  VARCHAR2(25) CHECK IN('temporary','full service','special service'),
    avail_count INT,
    PRIMARY KEY(doct_id)
);
alter table doctor_class modify (doct_id varchar(30));  
alter table doctor_class modify (visiting_time varchar(100));

CREATE TABLE user_master
  (
    user_id          VARCHAR(10) PRIMARY KEY,
    user_first_name  VARCHAR(20),
    user_mid_name    VARCHAR(20),
    user_last_name   VARCHAR(20),
    user_password    VARCHAR(30) CHECK (REGEXP_LIKE(user_password,'^([a-zA-Z0-9@*#]{7,14})$')),
    user_age         INT,
    user_gender      VARCHAR(2) CHECK (user_gender IN ('M','F','O')),
    user_blood_grp   VARCHAR(10),
    user_description VARCHAR(30),
    user_city        VARCHAR(30),
    user_street      VARCHAR(30),
    user_pincode     INT CHECK(REGEXP_LIKE(user_pincode,'^([0-6){6}')),
    user_email       VARCHAR(50) CHECK (REGEXP_LIKE(user_email,'^([a-zA-Z0-9_\-\.]+)@((gmail.com)|(yahoo.com))$'))
  );
alter table user_master modify (user_id varchar(30));  
alter table user_master modify (user_pincode  int check(REGEXP_LIKE(user_pincode,'^([0-6] {6})$')));
ALTER TABLE user_master MODIFY (user_email VARCHAR(50) CHECK (REGEXP_LIKE(user_email,'^([a-zA-Z0-9_\-\.]+)@((gmail.com)|(yahoo.com))$')));    


CREATE TABLE user_contact
  (
    user_id         VARCHAR(10) REFERENCES user_master(user_id),
    user_contact_no INT,
    CONSTRAINT cont1_cons CHECK(REGEXP_LIKE(user_contact_no,'^([1-9]{1}[0-9]{9})$'))
  );
alter table user_contact modify (user_id varchar(30));

CREATE TABLE patient_master
  (
    pt_id VARCHAR(10) PRIMARY KEY,
    user_id REFERENCES user_master(user_id)
  );
alter table patient_master modify(pt_id varchar(30)); 
alter table patient_master modify(user_id varchar(30)); 


CREATE TABLE appointment
  (
    apt_id NUMBER(10),
    doct_id REFERENCES doctor_master(doct_id),
    pt_id REFERENCES patient_master(pt_id),
    apt_status VARCHAR(20),
    apt_date   DATE,
    apt_time   VARCHAR(10),
    PRIMARY KEY(apt_id)
  );
alter table appointment modify(pt_id varchar(30));
alter table appointment modify(doct_id varchar(30));
alter table appointment modify(apt_id varchar(30)); 
alter table appointment modify(apt_status varchar(20) check(apt_status in('appointed','inprogress','completed','cancelled'))); 

CREATE TABLE staff
  (
    staff_id         VARCHAR(10),
    staff_first_name VARCHAR(30),
    staff_last_name  VARCHAR(30),
    staff_mid_name   VARCHAR(30),
    dept_id REFERENCES department_master(dept_id),
    staff_address VARCHAR(35),
    PRIMARY KEY(staff_id)
  );
alter table staff modify(staff_id varchar(30));  alter table staff modify(dept_id varchar(30));

CREATE TABLE staff_contact
  (
    staff_id         VARCHAR(10) REFERENCES staff(staff_id),
    staff_contact_no INT,
    CONSTRAINT cont_cons2 CHECK(REGEXP_LIKE(staff_contact_no,'^([1-9]{1}[0-9]{9})$'))
  );
alter table staff_contact modify(staff_id varchar(30));    

CREATE TABLE medicine_store
  (
    med_id   VARCHAR(10),
    med_name VARCHAR(25),
    dept_id REFERENCES department_master(dept_id),
    company_name VARCHAR(30),
    med_price    NUMBER(8,3),
    med_mfd      DATE,
    med_expd     DATE,
    PRIMARY KEY(med_id)
  );
alter table medicine_store modify(med_id varchar(30));
alter table medicine_store modify(dept_id varchar(30)); 


CREATE TABLE order_master
  (
    order_id VARCHAR2(15),
    med_id REFERENCES medicine_store(med_id),
    user_id REFERENCES user_master(user_id),
    deli_address VARCHAR2(30),
    status       VARCHAR2(30),
    PRIMARY KEY(order_id)
  );
alter table order_master modify(med_id varchar(30));  
alter table order_master modify(user_id varchar(30));  
alter table order_master modify(order_id varchar(30)); 

  
CREATE TABLE dept_facility
  (
    room_no INT,
    dept_id REFERENCES department_master(dept_id),
    tot_bed INT,
    PRIMARY KEY(room_no)
  );
alter table dept_facility modify(dept_id varchar(30)); 

CREATE TABLE room_status
  (
    room_no REFERENCES dept_facility(room_no),
    room_type_ac    VARCHAR(10) DEFAULT ('AC'),
    room_type_delux VARCHAR(10) DEFAULT ('NON-DELUX'),
    available_bed   INT,
    CONSTRAINT roomtype1cons CHECK(room_type_ac    IN('AC','NON-AC')),
    CONSTRAINT roomtype2cons CHECK(room_type_delux IN('TV-REFRIGERATOR','NON-DELUX'))
  );


CREATE TABLE operates
  (
    doct_id REFERENCES doctor_master(doct_id),
    pt_id REFERENCES patient_master(pt_id),
    op_id         VARCHAR2(20),
    op_date       DATE ,
    op_start_time VARCHAR2(20),
    op_end_time   VARCHAR2(20),
    status        VARCHAR2(15) CHECK (status IN ('Success','Failed','In Progress')),
    PRIMARY KEY(op_id)
  );
alter table operates modify(doct_id varchar(30));  
alter table operates modify(pt_id varchar(30));  
alter table operates modify(op_id varchar(30));  
