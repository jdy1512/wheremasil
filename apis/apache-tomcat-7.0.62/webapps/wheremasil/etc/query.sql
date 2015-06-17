
ALTER TABLE schedule rename column seq_id to area_cost_id;
ALTER TABLE area_cost rename column area_cost_etc to ac_etc;
ALTER TABLE schedule MODIFY area_cost_id NOT NULL;


ALTER TABLE reply add(r_content VARCHAR2(4000));

ALTER TABLE posting MODIFY(p_title VARCHAR2(512));
ALTER TABLE area_cost rename column seq_id to p_content_path;
ALTER TABLE area MODIFY(a_name VARCHAR2(256));
ALTER TABLE posting add(p_content clob);
ALTER TABLE posting drop column p_content;
ALTER TABLE member MODIFY m_position NULL;

delete from plan
select * from area where a_name like '성산%'
select * from area_cost
select * from schedule
select * from plan
select * from member
update member set m_name='admin' where member_id='admin@wheremasil.com'

update area set channel_id='C3' where area_id='A120'

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

update schedule set s_date='20150701' where s_date='20150601' and plan_id='L318';
update area_cost set s_date= where s_date='20150631' and plan_id='L318'

delete from area_cost where plan_id='L318';
delete from schedule where plan_id='L318';
delete from plan where plan_id='L318';
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



select p_start_date, p_end_date
from plan


where plan_id='L159'

select s_date, ac_seq, a_img_path, a_name, a_address, ac_food, ac_vehicle, ac_stay, ac_etc, s_note, a_latitude, a_longitude
from
	(select area_id, a_img_path, a_name, a_address, a_latitude, a_longitude
	from area) area_tbl
inner join
	(select area_id, ac.s_date, s.s_note, ac_seq, ac_food, ac_vehicle, ac_stay, ac_etc
	from area_cost ac, schedule s
	where ac.plan_id='L159' and s.plan_id='L159' and ac.s_date=s.s_date
	order by s_date, ac_seq) ac_tbl
on area_tbl.area_id=ac_tbl.area_id


select p.plan_id, t.t_name, p.p_start_date, p.p_end_date, a.a_name, a.a_address
from area_cost ac, area a, plan p, theme t
where ac.area_id=a.area_id and ac.plan_id=p.plan_id and p.theme_id=t.theme_id

select p_ac_tbl.plan_id, p_start_date, p_end_date, s_date, ac_seq, member_id, area_id
from
	(select plan_tbl.plan_id, p_start_date, p_end_date, ac_seq, member_id, area_id
	from
		(select plan_id, p_start_date, p_end_date, member_id
		from plan
		where plan_id='L202') plan_tbl
	inner join
		(select plan_id, ac_seq, area_id
		from area_cost
		where plan_id='L202') ac_tbl
	on plan_tbl.plan_id=ac_tbl.plan_id) p_ac_tbl
inner join
	(select plan_id, s_date
	from schedule
	where plan_id='L202') s_tbl
on p_ac_tbl.plan_id=s_tbl.plan_id
order by s_date, ac_seq


select p_tbl.plan_id, p_title, p_start_date, p_end_date, s_date, ac_seq, m_name, a_latitude, a_longitude
from
	(select plan_id, s_date, ac_seq, a_latitude, a_longitude
	from
		(select area_id, a_latitude, a_longitude
		from area) area_tbl
	right outer join
		(select s.plan_id, area_id, ac.s_date, ac_seq
		from area_cost ac, schedule s
		where (ac.plan_id='L241' and s.plan_id='L241' and ac.s_date=s.s_date) or (ac.plan_id='L224' and s.plan_id='L224' and ac.s_date=s.s_date) or (ac.plan_id='L223' and s.plan_id='L223' and ac.s_date=s.s_date) 
		order by ac.plan_id desc, s_date, ac_seq) s_ac_tbl
	on area_tbl.area_id=s_ac_tbl.area_id) s_ac_a_tbl
left outer join	
	(select plan_id, p_title, p_start_date, p_end_date, (select m_name from member where member_id=p.member_id) m_name
	from plan p) p_tbl
on p_tbl.plan_id=s_ac_a_tbl.plan_id


select plan_id
from
	(select plan_id
	from plan
	order by p_create_datetime desc)
where rownum <= 3

select plan_id
		from
			(select plan_id
			from plan
			order by p_create_datetime desc)
		where 3>=rownum
		
		
select plan_id   from    (select plan_id    from plan    order by p_create_datetime desc)   where 3>=rownum
