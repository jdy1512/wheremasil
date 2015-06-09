
ALTER TABLE schedule rename column seq_id to area_cost_id;
ALTER TABLE area_cost rename column area_cost_etc to ac_etc;
ALTER TABLE schedule MODIFY area_cost_id NOT NULL;


ALTER TABLE reply add(r_content VARCHAR2(4000));

ALTER TABLE posting MODIFY(p_title VARCHAR2(512));
ALTER TABLE area_cost rename column seq_id to p_content_path;
ALTER TABLE posting MODIFY(p_content VARCHAR2(512));
ALTER TABLE posting add(p_content clob);
ALTER TABLE posting drop column p_content;
ALTER TABLE member MODIFY m_position NULL;

delete from plan
select * from area
select * from area_cost
select * from schedule
select * from plan
select * from member

insert into theme values('T1', '배낭여행');
insert into theme values('T2', '우정여행');
insert into theme values('T3', '가족여행');
insert into theme values('T4', '커플여행');
insert into theme values('T5', '부모님여행')

insert into channel values('C1', 'usecase');
insert into channel values('C2', 'common');
insert into channel values('C3', 'admin');

select * from area
select * from area_cost
select * from schedule
select * from plan
alter table area rename column channel to channel_id;

select * from v$resource_limit where resource_name = 'processes';

delete from area_cost;
delete from schedule;
delete from plan;
delete from area;
drop sequence area_seq;
create sequence area_seq start with 1 increment by 1;
insert into area values(concat('A',area_seq.nextval),'KOSTA','성남시 분당구 삼평동',37.3971644,127.1081042,'/wheremasil/uploads/images/area/'||'A'||area_seq.currval||'/main.png','C3');

insert into area values(concat('A',area_seq.nextval),'해운대','부산광역시 해운대구',35.1631140,129.1635510,'/wheremasil/uploads/images/area/'||'A'||area_seq.currval||'/main.png','C3');
insert into area values(concat('A',area_seq.nextval),'코엑스','서울특별시 강남구 삼성동 영동대로 513 코엑스 아쿠아리움',37.5126820,127.0589010,'/wheremasil/uploads/images/area/'||'A'||area_seq.currval||'/main.png','C3');
insert into area values(concat('A',area_seq.nextval),'동대문','서울특별시 동대문구',37.5743680,127.0400190,'/wheremasil/uploads/images/area/'||'A'||area_seq.currval||'/main.png','C3');
insert into area values(concat('A',area_seq.nextval),'남산','서울특별시 용산동2가 남산',37.5512890,126.9884150,'/wheremasil/uploads/images/area/'||'A'||area_seq.currval||'/main.png','C3');
insert into area values(concat('A',area_seq.nextval),'홍대','서울특별시 마포구 동교동 홍대입구',37.5567070,126.9239330,'/wheremasil/uploads/images/area/'||'A'||area_seq.currval||'/main.png','C3');
insert into area values(concat('A',area_seq.nextval),'명동','서울특별시 중구 명동',37.5599800,126.9858300,'/wheremasil/uploads/images/area/'||'A'||area_seq.currval||'/main.png','C3');


select area_id, a_name, a_address, a_latitude, a_longitude, a_img_path, channel_id
from area
where ('38.16558859912489' > a_latitude and a_latitude > '36.603307890620265') and ('128.87059737158913' > a_longitude and a_longitude > '125.38167827835235')


select plan_id, p_create_datetime
	 from (
	 	select p.*
	 	from plan p
	 	where member_id='admin@wheremasil.com'
	 	order by p.P_CREATE_DATETIME desc
	 )
	 where rownum = 1
	 
	 
update member set member_id='admin@wheremasil.com' where member_id='qwe'