--4.1
SELECT user_id,
  user_password
FROM user_credential
WHERE user_id=:uid
AND password =:pwd;

UPDATE user_master SET user_street='galaxy road' WHERE user_id=:uid; ---20171103USER1
--4.2
SELECT apt_id,apt_status FROM appointment WHERE apt_date =:dat; --03-NOV-17
UPDATE APPOINTMENT SET apt_status='cancelled' WHERE APT_ID=:aid;--20171103APT1
--4.3
SELECT DISTINCT(dept_id),
  visiting_time,
  availability
FROM doctor_master NATURAL
JOIN doctor_class
WHERE doct_first_name='Hardik'
AND doct_last_name   ='NareshBhai'
AND doct_mid_name    ='Upadhyay';

SELECT DISTINCT(dm.dept_id),
  dc.visiting_time,
  dc.availability
FROM doctor_class dc ,
  doctor_master dm
WHERE dm.doct_id IN
  (SELECT doct_id
  FROM doctor_master
  WHERE dm.doct_first_name='Hardik'
  AND dm.doct_mid_name    ='Upadhyay'
  AND dm.doct_last_name   ='NareshBhai'
  );

SELECT dept_name,
  staff_address,
  staff_contact_no
FROM staff NATURAL
JOIN staff_contact NATURAL
JOIN department_master
WHERE staff_first_name='fnm'
AND staff_last_name   ='lnm'
AND staff_mid_name    ='mnm';

SELECT dept_name,
  staff_address,
  staff_contact_no
FROM staff st,
  department_master dm,
  staff_contact sc
WHERE st.dept_id IN
  (SELECT dept_id
  FROM staff
  WHERE st.staff_first_name='fnm'
  AND st.staff_last_name   ='lnm'
  AND st.staff_mid_name    ='mnm'
  );
--4.4

SELECT med_id FROM medicine_store WHERE med_name='abc';

SELECT COUNT(med_name)
FROM medicine_store
GROUP BY(med_name)
HAVING med_name=:mnm;

SELECT company_name,
  med_price,
  med_mfd,
  med_expd
FROM medicine_store
WHERE med_name=:mnm;

SELECT dept_name,
  staff_address,
  staff_contact_no
FROM staff st,
  department_master dm,
  staff_contact sc
WHERE st.dept_id IN
  (SELECT dept_id
  FROM staff
  WHERE st.staff_first_name='fnm'
  AND st.staff_last_name   ='lnm'
  AND st.staff_mid_name    ='mnm'
  );

SELECT available_bed,
  room_no,
  room_type_ac,
  room_type_delux,
  tot_bed
FROM dept_facility NATURAL
JOIN room_status;

SELECT SUM(med_price)
FROM order_master NATURAL
JOIN medicine_store
WHERE user_id=:uid1
GROUP BY(order_id);--20171103USER59