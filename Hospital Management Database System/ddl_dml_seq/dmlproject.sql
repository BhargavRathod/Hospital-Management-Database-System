--1.Hospital
INSERT
INTO hospital
  (
    HOSPITAL_ID,
    HOSPITAL_NAME,
    hospital_branch
  )
  VALUES
  (
    TO_CHAR(sysdate,'YYYYMMDD')
    ||'HOSPITAL'
    ||hospital_id_seq.nextval,
    'sterling',
    'Bhavna gar'
  );
INSERT
INTO hospital
  (
    HOSPITAL_ID,
    HOSPITAL_NAME,
    hospital_branch
  )
  VALUES
  (
    TO_CHAR(sysdate,'YYYYMMDD')
    ||'HOSPITAL'
    ||hospital_id_seq.nextval,
    'sterling',
    'Surat'
  );
--2.Admin
INSERT
INTO admin_master
  (
    admin_id,
    ADMIN_FIRST_NAME,
    admin_mid_name,
    admin_last_name,
    admin_password,
    hospital_id
  )
  VALUES
  (
    TO_CHAR(sysdate,'YYYYMMDD')
    ||'ADMIN'
    ||admin_id_seq.nextval,
    'Keval',
    'Rajyag uru',
    'Atulkumar',
    'mypassword',
    '20171101HOSPITAL2'
  );
3.Department
INSERT
INTO department_master
  (
    dept_id,
    dept_name,
    no_of_doctors,
    no_of_operation_theater,
    hosp ital_id
  )
  VALUES
  (
    TO_CHAR(sysdate,'YYYYMMDD')
    ||'DEPT'
    ||dept_id_seq.nextval,
    'Dental Department',
    2,1,
    '20171101HOSPITAL2'
  );
INSERT
INTO department_master
  (
    dept_id,
    dept_name,
    no_of_doctors,
    no_of_operation_theater,
    hosp ital_id
  )
  VALUES
  (
    TO_CHAR(sysdate,'YYYYMMDD')
    ||'DEPT'
    ||dept_id_seq.nextval,
    'Neuro Department',
    2,1,
    '20171101HOSPITAL2'
  );
--4.Doctor
INSERT
INTO doctor_master 12
  (
    doct_id,
    doct_first_name,
    doct_mid_name,
    doct_last_name,
    dept_id
  )
  VALUES
  (
    TO_CHAR(sysdate,'YYYYMMDD')
    ||'DOCT'
    ||doct_id_seq.nextval,
    'Hardik',
    'Upadhyay',
    'Nar eshBhai',
    '20171102DEPT3'
  );
--5.Doctor_contact
INSERT
INTO doctor_contact
  (
    doct_id,
    doct_contact_no
  )
  VALUES
  (
    '20171102DOCT5',
    9598789565
  );
--6.Doctor_Qualification
INSERT
INTO qualification
  (
    doct_id,
    QUALIFICATION
  )
  VALUES
  (
    '20171102DOCT5',
    'MBBS'
  );
INSERT
INTO qualification
  (
    doct_id,
    QUALIFICATION
  )
  VALUES
  (
    '20171102DOCT5',
    'MD'
  );
--7.Doctor_class
INSERT
INTO doctor_class
  (
    doct_id,
    visiting_time,
    availability
  )
  VALUES
  (
    '20171102DOCT5',
    '8a.m. to 1p.m. and 4 to 7p.m.',
    'every day'
  );
--8.User
INSERT
INTO user_master
  (
    USER_ID,
    USER_FIRST_NAME,
    USER_MID_NAME,
    USER_LAST_NAME,
    USER_ PASSWORD,
    USER_AGE,
    USER_GENDER,
    USER_BLOOD_GRP,
    USER_DESCRIPTION,
    USER_CI TY,
    USER_STREET,
    USER_PINCODE,
    USER_EMAIL
  )
  VALUES
  (
    TO_CHAR(sysdate,'YYYYMMDD')
    ||'USER'
    ||user_id_seq.nextval,
    'Sandhya',
    'Suraj',
    'R athi',
    'ascvdgfjdks',
    27,
    'F',
    'B+',
    NULL,
    'Pushkar',
    'Hanuman Gali',
    436036,
    'diyaaurbati@gmail.com'
  );
INSERT
INTO user_master
  (
    USER_ID,
    USER_FIRST_NAME,
    USER_MID_NAME,
    USER_LAST_NAME,
    USER_ PASSWORD,
    USER_AGE,
    USER_GENDER,
    USER_BLOOD_GRP,
    USER_DESCRIPTION,
    USER_CI TY,
    USER_STREET,
    USER_PINCODE,
    USER_EMAIL
  )
  VALUES
  (
    TO_CHAR(sysdate,'YYYYMMDD')
    ||'USER'
    ||user_id_seq.nextval,
    'Sandhya',
    'Suraj',
    'R athi',
    'ascvdgfjdks',
    27,
    'F',
    'B+',
    NULL,
    'Pushkar',
    'Hanuman Gali',
    436036,
    NULL
  );
--9.User_contact
INSERT
INTO user_contact
  (
    user_id,
    user_contact_no
  )
  VALUES
  (
    '20171103USER59',
    8248648624
  );
--10.Patient
INSERT
INTO patient_master
  (
    pt_id,
    user_id
  )
  VALUES
  (
    TO_CHAR(sysdate,'YYYYMMDD')
    ||'PT'
    ||pt_id_seq.nextval,
    '20171103USER59'
  );
--11.Appointment
INSERT
INTO appointment
  (
    APT_ID,
    DOCT_ID,
    PT_ID,
    APT_STATUS,
    APT_DATE,
    APT_TIME
  )
  VALUES
  (
    TO_CHAR(sysdate,'YYYYMMDD')
    ||'APT'
    ||apt_id_seq.nextval,
    '20171102DOCT5',
    '20171103PT90',
    'appointed',
    '03-Nov-2017',
    '03 p.m.'
  );
--12.Staff
INSERT
INTO staff
  (
    STAFF_ID,
    STAFF_FIRST_NAME,
    STAFF_LAST_NAME,
    STAFF_MID_NAME,
    DEPT_ID,
    ST AFF_ADDRESS
  )
  VALUES
  (
    TO_CHAR(sysdate,'YYYYMMDD')
    ||'STAFF'
    ||staff_id_seq.nextval,
    'Bhargav',
    'Rathod',
    'N',
    '2 0171102DEPT2',
    'add1'
  );
--13.Staff_contact
INSERT
INTO staff_contact
  (
    staff_id,
    staff_contact_no
  )
  VALUES
  (
    '20171103STAFF2',
    1123456789
  );
--14.Medicine
INSERT
INTO medicine_store
  (
    MED_ID,
    MED_NAME,
    DEPT_ID,
    COMPANY_NAME,
    MED_PRICE,
    MED_MF D,
    MED_EXPD
  )
  VALUES
  (
    TO_CHAR(sysdate,'YYMMDD')
    ||'MED'
    ||med_id_seq.nextval,
    'med1',
    '20171102DE PT2',
    'comp1',
    123,
    '01-Jan-2015',
    '01-Jan-2017'
  );
--15.Order
INSERT
INTO order_master
  (
    ORDER_ID,
    MED_ID,
    USER_ID,
    DELI_ADDRESS,
    STATUS
  )
  VALUES
  (
    TO_CHAR(sysdate,'YYMMDD')
    ||'ORDER'
    ||order_id_seq.nextval,
    '171103MED1',
    '2017110 14
3USER59',
    'add1',
    'completed'
  );
--16.Fecility
INSERT
INTO dept_facility
  (
    ROOM_NO,
    DEPT_ID,
    TOT_BED
  )
  VALUES
  (
    1,
    '20171102DEPT2',
    10
  );
--17.Status
INSERT INTO room_status
  (ROOM_NO,AVAILABLE_BED
  )VALUES
  (1,7
  );
--18.Operation
INSERT
INTO operates
  (
    DOCT_ID,
    PT_ID,
    OP_ID,
    OP_DATE,
    OP_START_TIME,
    OP_END_TIME,
    STATUS
  )
  VALUES
  (
    '20171102DOCT5',
    '20171103PT1',
    TO_CHAR(sysdate,'YYMMDD')
    ||'OP'
    ||op_id_seq .nextval,
    '21-Oct-2017',
    NULL,
    NULL,
    NULL
  );