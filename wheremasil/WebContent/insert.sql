update posting
		set		p_hits=
		(
		select p_hits
		from posting
		where posting_id=283
		)+1
		
		
		
		
		where	posting_id=283












update posting
		set		p_like=
		(
		select p_like
		from posting
		where posting_id=282
		)+1
		
		
		
		
		where	posting_id=282

select p_like
from POSTING
where posting_id=282



select *
from POSTING
where posting_id=63

insert into BOARDTYPE
values ('w1','리뷰글쓰기')

insert into BOARDTYPE
values ('b1','리뷰계시판')

CREATE SEQUENCE  sequence_totalPostring  
        START WITH 1   
        INCREMENT BY 1 
        NOMAXVALUE 
       NOMINVALUE
       
       create sequence posting_seq
        START WITH 1   
        INCREMENT BY 1 
        NOMAXVALUE 
       NOMINVALUE
       
          create sequence rp_seq
        START WITH 1   
        INCREMENT BY 1 
        NOMAXVALUE 
       NOMINVALUE
       
       select posting_seq from dual;
       
       rp_seq.NEXTVAL
       
       select * from user_sequences
       
posting_id, boardtype_id, member_id, p_content_path, p_datetime, p_number,p_like,p_title,p_hitsp_img_path
       
insert into POSTING
       values(sequence_totalPostring.NEXTVAL,'b1','11',11,11,'11',11,'11','b1','abc@abc.abc')
       
       select * from BOARDTYPE;
       
       
       insert into MEMBER
       values ('abc@abc.abc','abc','abc','abc','abc','abc','abc','0','1')
       
       insert into POSTING (POSTRING_ID, P_CONTENT_PATH, P_DATETIME, P_NUMBER, P_LIKE, P_TITLE, P_HITS, P_IMG_PATH, BOARDTYPE_ID,MEMBER_ID)
		values (sequence_totalPostring.NEXTVAL, '1', '1', posting_seq.NEXTVAL, 0, '1',0,'NULL','b1','abc@abc.abc')