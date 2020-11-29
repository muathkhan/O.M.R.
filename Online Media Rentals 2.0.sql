CREATE TABLE sa_customers(
    customer_id NUMBER(10),
    last_name VARCHAR2(25) CONSTRAINT sa_cust_l_nam_nn NOT NULL,
    first_name VARCHAR2(25) CONSTRAINT sa_cust_f_nam_nn NOT NULL,
    home_phone VARCHAR2(12) CONSTRAINT sa_cust_hom_phn_nn NOT NULL,
    address VARCHAR2(100) CONSTRAINT sa_cust_addr_nn NOT NULL,
    city VARCHAR2(30) CONSTRAINT sa_cust_cty_nn NOT NULL,
    state VARCHAR2(2) CONSTRAINT sa_cust_stat_nn NOT NULL,
    email VARCHAR2(25),
    cell_phone VARCHAR2(12),

    CONSTRAINT sa_cust_cust_id_pk PRIMARY KEY(customer_id)
)

CREATE SEQUENCE sa_cust_id_seq
    NOMINVALUE
    NOMAXVALUE
    START WITH 100
    INCREMENT BY 1
    NOCYCLE
    CACHE 10

CREATE OR REPLACE VIEW sa_cust_dtl_view AS SELECT sa_customers.customer_id CUSTOMER_NO,
                                            sa_customers.last_name||' '||sa_customers.first_name CUSTOMER_NAME,
                                            sa_customers.home_phone, sa_customers.cell_phone
                            FROM sa_customers
                            ORDER BY sa_customers.customer_id
                            WITH READ ONLY;

CREATE OR REPLACE VIEW sa_cust_ful_dtl_view AS SELECT *
                            FROM sa_customers
                            ORDER BY sa_customers.customer_id
                            WITH READ ONLY;

CREATE ROLE mgr_all NOT IDENTIFIED;
GRANT  SELECT, INSERT, UPDATE, DELETE
ON sa_cust_dtl_view
TO mgr_all;
GRANT  SELECT, INSERT, UPDATE, DELETE
ON sa_cust_ful_dtl_view
TO mgr_all;

CREATE USER kmuath IDENTIFIED BY Mo0541480887zx;
GRANT mgr_all TO kmuath;
GRANT CREATE TABLE TO kmuath;

CREATE OR REPLACE VIEW sa_cust_count_view AS SELECT sa_customers.state, COUNT(sa_customers.customer_id) NO_OF_CUSTOMERS
                            FROM sa_customers
                            GROUP BY sa_customers.state
                            ORDER BY sa_customers.state
                            WITH READ ONLY;  

CREATE OR REPLACE VIEW sa_cust_ny_view AS SELECT *
                                            FROM sa_customers
                                            WHERE UPPER(sa_customers.state) = 'NY'
                                            WITH CHECK OPTION;

CREATE ROLE mgr_ny NOT IDENTIFIED;
GRANT  SELECT, INSERT, UPDATE, DELETE
ON sa_cust_ny_view
TO mgr_ny;

CREATE USER mjohn IDENTIFIED BY 123;
GRANT mgr_ny TO mjohn

CREATE OR REPLACE VIEW sa_cust_dc_view AS SELECT *
                                            FROM sa_customers
                                            WHERE UPPER(sa_customers.state) = 'DC'
                                            WITH CHECK OPTION;

CREATE ROLE mgr_dc NOT IDENTIFIED;
GRANT  SELECT, INSERT, UPDATE, DELETE
ON sa_cust_dc_view
TO mgr_dc;

CREATE USER jwill IDENTIFIED BY 123;
GRANT mgr_dc TO jwill

CREATE OR REPLACE VIEW sa_cust_ca_view AS SELECT *
                                            FROM sa_customers
                                            WHERE UPPER(sa_customers.state) = 'CA'
                                            WITH CHECK OPTION;

CREATE ROLE mgr_ca NOT IDENTIFIED;
GRANT  SELECT, INSERT, UPDATE, DELETE
ON sa_cust_ca_view
TO mgr_ca;

CREATE USER asusen IDENTIFIED BY 123;
GRANT mgr_ca TO asusen

CREATE OR REPLACE VIEW sa_cust_tx_view AS SELECT *
                                            FROM sa_customers
                                            WHERE UPPER(sa_customers.state) = 'TX'
                                            WITH CHECK OPTION;

CREATE ROLE mgr_tx NOT IDENTIFIED;
GRANT  SELECT, INSERT, UPDATE, DELETE
ON sa_cust_tx_view
TO mgr_tx;

CREATE USER jadam IDENTIFIED BY 123;
GRANT mgr_tx TO jadam

CREATE OR REPLACE VIEW sa_cust_sc_view AS SELECT *
                                            FROM sa_customers
                                            WHERE UPPER(sa_customers.state) = 'SC'
                                            WITH CHECK OPTION;

CREATE ROLE mgr_sc NOT IDENTIFIED;
GRANT  SELECT, INSERT, UPDATE, DELETE
ON sa_cust_sc_view
TO mgr_sc;

CREATE USER jpeter IDENTIFIED BY 123;
GRANT mgr_sc TO jpeter

CREATE OR REPLACE VIEW sa_cust_mi_view AS SELECT *
                                            FROM sa_customers
                                            WHERE UPPER(sa_customers.state) = 'MI'
                                            WITH CHECK OPTION;

CREATE ROLE mgr_mi NOT IDENTIFIED;
GRANT  SELECT, INSERT, UPDATE, DELETE
ON sa_cust_mi_view
TO mgr_mi;

CREATE USER srussil IDENTIFIED BY 123;
GRANT mgr_mi TO srussil

CREATE OR REPLACE VIEW sa_cust_ne_view AS SELECT *
                                            FROM sa_customers
                                            WHERE UPPER(sa_customers.state) = 'NE'
                                            WITH CHECK OPTION;      

CREATE ROLE mgr_ne NOT IDENTIFIED;
GRANT  SELECT, INSERT, UPDATE, DELETE
ON sa_cust_ne_view
TO mgr_ne;

CREATE USER aahmad IDENTIFIED BY 123;
GRANT mgr_ne TO aahmad

INSERT INTO sa_customers VALUES(sa_cust_id_seq.NEXTVAL, 'Palombo', 'Lisa', '9162702669', '123 Main St', 'Buffalo', 'NY', 'palombo@ecc.edu', '7165551212')
INSERT INTO sa_customers VALUES(sa_cust_id_seq.NEXTVAL, 'Peters', 'John', '9160702069', '614 Main St', 'Buffalo', 'NY', 'Jopert@ecc.edu', '7155551012')
INSERT INTO sa_customers VALUES(sa_cust_id_seq.NEXTVAL, 'Peters', 'Josh', '9140702077', '777 Main St', 'Washington', 'DC', 'Jospet@ecc.edu', '7745551222')
INSERT INTO sa_customers VALUES(sa_cust_id_seq.NEXTVAL, 'Johnson', 'Mark', '9140702077', 'Shaver Lake', 'Chawanakee', 'CA', 'Majoh@ecc.edu', '7814551002')
INSERT INTO sa_customers VALUES(sa_cust_id_seq.NEXTVAL, 'Sue', 'Lisa', '9323702007', '3553 Cullen Boulevard', 'Houston', 'TX', 'Lissu@ecc.edu', '5814508402')
INSERT INTO sa_customers VALUES(sa_cust_id_seq.NEXTVAL, 'Fox', 'Liam', '9320501237', '123 First Street', 'Santa Fa', 'TX', 'Liafo@ecc.edu', '5041108742')
INSERT INTO sa_customers VALUES(sa_cust_id_seq.NEXTVAL, 'Thakkar', 'Kushar', '9369501200', '150th Avenue', 'Springfield Gardens', 'NY', 'Kuthak@ecc.edu', '5048748799')
INSERT INTO sa_customers VALUES(sa_cust_id_seq.NEXTVAL, 'Thompson', 'Nick', '9304701228', '10th Avenue', 'Camden', 'SC', 'Nithom@ecc.edu', '5004148879')
INSERT INTO sa_customers VALUES(sa_cust_id_seq.NEXTVAL, 'Nelson', 'Mary', '9300154228', '66th Avenue', 'Bellevue', 'MI', 'Manels@ecc.edu', '5015748871')
INSERT INTO sa_customers VALUES(sa_cust_id_seq.NEXTVAL, 'Baker', 'Jeff', '9310157118', '21 Jump Street', 'Benkelman', 'NE', 'Jebak@ecc.edu', '5015748871')


CREATE INDEX sa_cust_l_nam_indx ON sa_customers(last_name)

CREATE TABLE sa_movies(
    title_id NUMBER(10),
    title VARCHAR2(60) CONSTRAINT sa_movi_titl_nn NOT NULL,
    description VARCHAR2(400) CONSTRAINT sa_movi_desc_nn NOT NULL,
    rating VARCHAR2(4),
    category VARCHAR2(20),
    release_date DATE,

    CONSTRAINT sa_movi_titl_id_pk PRIMARY KEY(title_id),
    CONSTRAINT sa_movi_rat_ck CHECK(rating IN('PG','G','PG13','R')),
    CONSTRAINT sa_movi_category_ck CHECK(category IN('DRAMA','COMEDY','ACTION','CHILD','SCIFI','DOCUMENTARY'))
)

CREATE SEQUENCE sa_titl_id_seq
    NOMINVALUE
    NOMAXVALUE
    START WITH 1
    INCREMENT BY 1
    NOCYCLE
    CACHE 10
CREATE OR REPLACE VIEW sa_movi_ful_dtl_view AS SELECT *
                                        FROM sa_movies
                                        ORDER BY sa_movies.rating
                                        WITH CHECK OPTION

GRANT  SELECT, INSERT, UPDATE, DELETE
ON sa_movi_ful_dtl_view
TO mgr_all;

GRANT  SELECT, INSERT, UPDATE, DELETE
ON sa_movi_ful_dtl_view
TO mgr_all;

CREATE OR REPLACE VIEW sa_movi_rat_view AS SELECT sa_movies.rating, COUNT(sa_movies.rating) NO_OF_MOVIES
                                        FROM sa_movies
                                        GROUP BY sa_movies.rating
                                        ORDER BY sa_movies.rating
                                        WITH READ ONLY

CREATE OR REPLACE VIEW sa_movi_cat_view AS SELECT sa_movies.category, COUNT(sa_movies.category) NO_OF_MOVIES
                                        FROM sa_movies
                                        GROUP BY sa_movies.category
                                        ORDER BY sa_movies.category
                                        WITH READ ONLY

CREATE OR REPLACE VIEW sa_movi_rel_dat_view AS SELECT TO_CHAR(sa_movies.release_date,'YYYY') RELEASE_YEAR, sa_movies.category,
                                                sa_movies.title, sa_movies.description
                                                FROM sa_movies
                                                ORDER BY sa_movies.release_date, sa_movies.category
                                                WITH READ ONLY

INSERT INTO sa_movies VALUES(sa_titl_id_seq.NEXTVAL, 
'Remember the Titans', 'The true story of a newly appointed African-American coach and his high school team on their first season as a racially integrated unit.', 'PG','DRAMA',
TO_DATE('29-SEP-2000','dd-MON-yyyy'))
INSERT INTO sa_movies VALUES(sa_titl_id_seq.NEXTVAL, 
'The Avengers', Q'[Earth's mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.]', 'PG13','ACTION',
TO_DATE('04-MAY-2012','dd-MON-yyyy'))
INSERT INTO sa_movies VALUES(sa_titl_id_seq.NEXTVAL, 
'Avengers: Age of Ultron', Q'[When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and it's up to Earth's mightiest heroes to stop the villainous Ultron from enacting his terrible plan.]', 'PG13','ACTION',
TO_DATE('01-MAY-2015','dd-MON-yyyy'))
INSERT INTO sa_movies VALUES(sa_titl_id_seq.NEXTVAL, 
'Captain America: Civil War', Q'[Political involvement in the Avengers' affairs causes a rift between Captain America and Iron Man.]', 'PG13','ACTION',
TO_DATE('6-MAY-2016','dd-MON-yyyy'))
INSERT INTO sa_movies VALUES(sa_titl_id_seq.NEXTVAL, 
'Captain America: The Winter Soldier', Q'[As Steve Rogers struggles to embrace his role in the modern world, he teams up with a fellow Avenger and S.H.I.E.L.D agent, Black Widow, to battle a new threat from history: an assassin known as the Winter Soldier.]', 'PG13','ACTION',
TO_DATE('04-APR-2014','dd-MON-yyyy'))
INSERT INTO sa_movies VALUES(sa_titl_id_seq.NEXTVAL, 
'Captain America: The First Avenger', Q'[Steve Rogers, a rejected military soldier, transforms into Captain America after taking a dose of a "Super-Soldier serum". But being Captain America comes at a price as he attempts to take down a war monger and a terrorist organization.]', 'PG13','ACTION',
TO_DATE('22-JUL-2011','dd-MON-yyyy'))
INSERT INTO sa_movies VALUES(sa_titl_id_seq.NEXTVAL, 
'Thor', Q'[The powerful but arrogant god Thor is cast out of Asgard to live amongst humans in Midgard (Earth), where he soon becomes one of their finest defenders.]', 'PG13','ACTION',
TO_DATE('6-MAY-2011','dd-MON-yyyy'))
INSERT INTO sa_movies VALUES(sa_titl_id_seq.NEXTVAL, 
'Thor: The Dark World', Q'[When the Dark Elves attempt to plunge the universe into darkness, Thor must embark on a perilous and personal journey that will reunite him with doctor Jane Foster.]', 'PG13','ACTION',
TO_DATE('8-NOV-2013','dd-MON-yyyy'))

CREATE TABLE sa_media(
    media_id NUMBER(10),
    format VARCHAR2(3) CONSTRAINT sa_medi_form_nn NOT NULL,
    title_id NUMBER(10),

    CONSTRAINT sa_medi_medi_id_pk PRIMARY KEY(media_id),
    CONSTRAINT sa_medi_titl_id_fk FOREIGN KEY(title_id) REFERENCES sa_movies(title_id)
)

CREATE SEQUENCE sa_medi_id_seq
    NOMINVALUE
    NOMAXVALUE
    START WITH 92
    INCREMENT BY 1
    NOCYCLE
    CACHE 10

CREATE OR REPLACE VIEW sa_medi_no_form AS SELECT sa_media.title_id, COUNT(sa_media.title_id) NO_OF_FORMS
                                            FROM sa_media
                                            GROUP BY sa_media.title_id
                                            ORDER BY sa_media.title_id
                                            WITH READ ONLY

CREATE OR REPLACE VIEW sa_medi_most_forms_view AS SELECT sa_media.format, COUNT(sa_media.format) NO_OF_FORMS
                                                    FROM sa_media
                                                    GROUP BY sa_media.format
                                                    ORDER BY sa_media.format
                                                    WITH READ ONLY

INSERT INTO sa_media VALUES(sa_medi_id_seq.NEXTVAL, 'DVD', 1)
INSERT INTO sa_media VALUES(sa_medi_id_seq.NEXTVAL, 'VHS', 1)
INSERT INTO sa_media VALUES(sa_medi_id_seq.NEXTVAL, 'DVD', 2)
INSERT INTO sa_media VALUES(sa_medi_id_seq.NEXTVAL, 'DVD', 3)
INSERT INTO sa_media VALUES(sa_medi_id_seq.NEXTVAL, 'DVD', 4)
INSERT INTO sa_media VALUES(sa_medi_id_seq.NEXTVAL, 'DVD', 5)
INSERT INTO sa_media VALUES(sa_medi_id_seq.NEXTVAL, 'DVD', 6)
INSERT INTO sa_media VALUES(sa_medi_id_seq.NEXTVAL, 'DVD', 7)
INSERT INTO sa_media VALUES(sa_medi_id_seq.NEXTVAL, 'DVD', 8)

CREATE TABLE sa_rental_history(
    rental_date DATE DEFAULT SYSDATE,
    return_date DATE,
    customer_id NUMBER(10) CONSTRAINT sa_rent_his_cust_id_nn NOT NULL,
    media_id NUMBER(10) CONSTRAINT sa_rent_his_medi_id_nn NOT NULL,

    CONSTRAINT sa_rent_his_rentdat_medi_id_pk PRIMARY KEY(rental_date,media_id),
    CONSTRAINT sa_rent_his_medi_id_fk FOREIGN KEY(media_id) REFERENCES sa_media(media_id),
    CONSTRAINT sa_rent_his_cust_id_fk FOREIGN KEY(customer_id) REFERENCES sa_customers(customer_id)
)

CREATE OR REPLACE VIEW sa_title_unaval_view AS SELECT mo.title MOVIE_TITLE, r.media_id MEDIA
                                                FROM sa_rental_history r, sa_media me, sa_movies mo
                                                WHERE me.media_id = r.media_id AND me.title_id = mo.title_id AND return_date IS NULL
                                                WITH READ ONLY

CREATE OR REPLACE VIEW sa_rent_his_cus_view AS SELECT sa_customers.customer_id CUSTOMER, COUNT(sa_customers.customer_id) rental_date
                                                FROM sa_customers
                                                GROUP BY sa_customers.customer_id
                                                ORDER BY sa_customers.customer_id
                                                WITH READ ONLY            

INSERT INTO sa_rental_history VALUES(TO_DATE('19-SEP-2010','dd-MON-yyyy'), TO_DATE('20-SEP-2010','dd-MON-yyyy'), 100, 92)
INSERT INTO sa_rental_history VALUES(SYSDATE, NULL, 111, 106)
INSERT INTO sa_rental_history VALUES(SYSDATE, NULL, 112, 107)
INSERT INTO sa_rental_history VALUES(SYSDATE, NULL, 113, 108)
INSERT INTO sa_rental_history VALUES(SYSDATE, NULL, 114, 109)
INSERT INTO sa_rental_history VALUES(SYSDATE, NULL, 115, 110)
INSERT INTO sa_rental_history VALUES(SYSDATE, NULL, 116, 111)
INSERT INTO sa_rental_history VALUES(SYSDATE, NULL, 117, 112)
INSERT INTO sa_rental_history VALUES(SYSDATE, NULL, 118, 112)



CREATE TABLE sa_actors(
    actor_id NUMBER(10),
    stage_name VARCHAR2(40) CONSTRAINT sa_actr_stag_nam_nn NOT NULL,
    first_name VARCHAR2(25) CONSTRAINT sa_actr_f_nam_nn NOT NULL,
    last_name VARCHAR2(25) CONSTRAINT sa_actr_l_nam_nn NOT NULL,
    birth_date DATE CONSTRAINT sa_actr_dday_nn NOT NULL,

    CONSTRAINT sa_actr_actr_id_pk PRIMARY KEY(actor_id)
)

CREATE SEQUENCE sa_actr_id_seq
    NOMINVALUE
    NOMAXVALUE
    START WITH 1001
    INCREMENT BY 1
    NOCYCLE
    CACHE 10

CREATE OR REPLACE VIEW sa_actr_nam_view AS SELECT sa_actors.stage_name, sa_actors.first_name||' '||sa_actors.last_name actor_id
                                            FROM sa_actors
                                            ORDER BY sa_actors.stage_name
                                            WITH READ ONLY

INSERT INTO sa_actors VALUES(sa_actr_id_seq.NEXTVAL, 'Brad Pitt', 'William', 'Pitt', TO_DATE('18-DEC-1963','dd-MON-yyyy'))
INSERT INTO sa_actors VALUES(sa_actr_id_seq.NEXTVAL, 'Chris Hemsworth', 'Chris', 'Hemsworth', TO_DATE('11-AUG-1983','dd-MON-yyyy'))
INSERT INTO sa_actors VALUES(sa_actr_id_seq.NEXTVAL, 'Natalie Portman', 'Natalie', 'Portman', TO_DATE('9_JUN-1981','dd-MON-yyyy'))
INSERT INTO sa_actors VALUES(sa_actr_id_seq.NEXTVAL, 'Tom Hiddleston', 'Tom', 'Hiddleston', TO_DATE('9-FEB-1981','dd-MON-yyyy'))
INSERT INTO sa_actors VALUES(sa_actr_id_seq.NEXTVAL, 'Anthony Hopkins', 'Anthony', 'Hopkins', TO_DATE('31-DEC-1937','dd-MON-yyyy'))
INSERT INTO sa_actors VALUES(sa_actr_id_seq.NEXTVAL, 'Chris Evans', 'Chris', 'Evans', TO_DATE('13-JUN-1981','dd-MON-yyyy'))
INSERT INTO sa_actors VALUES(sa_actr_id_seq.NEXTVAL, 'Samuel L. Jackson', 'Samuel', 'Jackson', TO_DATE('21-DEC-1948','dd-MON-yyyy'))
INSERT INTO sa_actors VALUES(sa_actr_id_seq.NEXTVAL, 'Scarlett Johansson', 'Scarlett', 'Johansson', TO_DATE('22-NOV-1984','dd-MON-yyyy'))
INSERT INTO sa_actors VALUES(sa_actr_id_seq.NEXTVAL, 'Robert Redford', 'Robert', 'Redford', TO_DATE('18-AUG-1936','dd-MON-yyyy'))
INSERT INTO sa_actors VALUES(sa_actr_id_seq.NEXTVAL, 'Robert Downey Jr.', 'Robert', 'Downey', TO_DATE('4-APR-1965','dd-MON-yyyy'))
INSERT INTO sa_actors VALUES(sa_actr_id_seq.NEXTVAL, 'Mark Ruffalo', 'Mark', 'Ruffalo', TO_DATE('22-NOV-1967','dd-MON-yyyy'))
INSERT INTO sa_actors VALUES(sa_actr_id_seq.NEXTVAL, 'Hayley Atwell', 'Hayley', 'Atwell', TO_DATE('5-APR-1982','dd-MON-yyyy'))
INSERT INTO sa_actors VALUES(sa_actr_id_seq.NEXTVAL, 'Sebastian Stan', 'Sebastian', 'Stan', TO_DATE('13-AUG-1982','dd-MON-yyyy'))



CREATE TABLE sa_star_billings(
    comment_c VARCHAR2(40),
    title_id NUMBER(10) CONSTRAINT sa_str_bil_titl_id_nn NOT NULL,
    actor_id NUMBER(10) CONSTRAINT sa_str_bil_actr_id_nn NOT NULL,

    CONSTRAINT sa_str_bil_titl_id_actr_id_pk PRIMARY KEY(title_id,actor_id),
    CONSTRAINT sa_str_bil_titl_id_fk FOREIGN KEY(title_id) REFERENCES sa_movies(title_id),
    CONSTRAINT sa_str_bil_actr_id_fk FOREIGN KEY(actor_id) REFERENCES sa_actors(actor_id)
)

INSERT INTO sa_star_billings VALUES('Romantic Lead', 1, 1001)
INSERT INTO sa_star_billings VALUES('Thor', 11, 1002)
INSERT INTO sa_star_billings VALUES('Thor', 12, 1002)
INSERT INTO sa_star_billings VALUES('Thor', 16, 1002)
INSERT INTO sa_star_billings VALUES('Thor', 17, 1002)
INSERT INTO sa_star_billings VALUES('Jane Foster', 16, 1003)
INSERT INTO sa_star_billings VALUES('Jane Foster', 17, 1003)
INSERT INTO sa_star_billings VALUES('Loki', 11, 1004)
INSERT INTO sa_star_billings VALUES('Loki', 16, 1004)
INSERT INTO sa_star_billings VALUES('Loki', 17, 1004)
INSERT INTO sa_star_billings VALUES('Odin', 16, 1005)
INSERT INTO sa_star_billings VALUES('Odin', 17, 1005)
INSERT INTO sa_star_billings VALUES('Steve Rogers / Captain America', 11, 1006)
INSERT INTO sa_star_billings VALUES('Steve Rogers / Captain America', 12, 1006)
INSERT INTO sa_star_billings VALUES('Steve Rogers / Captain America', 13, 1006)
INSERT INTO sa_star_billings VALUES('Steve Rogers / Captain America', 14, 1006)
INSERT INTO sa_star_billings VALUES('Steve Rogers / Captain America', 15, 1006)
INSERT INTO sa_star_billings VALUES('Nick Fury', 11, 1007)
INSERT INTO sa_star_billings VALUES('Nick Fury', 12, 1007)
INSERT INTO sa_star_billings VALUES('Nick Fury', 13, 1007)
INSERT INTO sa_star_billings VALUES('Natasha Romanoff / Black Widow', 11, 1008)
INSERT INTO sa_star_billings VALUES('Natasha Romanoff / Black Widow', 12, 1008)
INSERT INTO sa_star_billings VALUES('Natasha Romanoff / Black Widow', 13, 1008)
INSERT INTO sa_star_billings VALUES('Natasha Romanoff / Black Widow', 14, 1008)
INSERT INTO sa_star_billings VALUES('Tony Stark / Iron Man', 11, 1009)
INSERT INTO sa_star_billings VALUES('Tony Stark / Iron Man', 12, 1009)
INSERT INTO sa_star_billings VALUES('Tony Stark / Iron Man', 13, 1009)




CREATE OR REPLACE FORCE VIEW sa_title_unaval_view AS SELECT mo.title MOVIE_TITLE, r.media_id MEDIA
                                                        FROM sa_rental_history r, sa_media me, sa_movies mo
                                                        WHERE me.media_id = r.media_id AND me.title_id = mo.title_id AND return_date IS NULL
                                                        WITH READ ONLY

CREATE OR REPLACE SYNONYM TU FOR sa_title_unaval_view

