/* MEMBER */
CREATE TABLE MEMBER (
   member_id VARCHAR2(512) NOT NULL, /* 회원코드 */
   m_password VARCHAR2(64) NOT NULL, /* 비밀번호 */
   m_name VARCHAR2(32) NOT NULL, /* 회원이름 */
   m_email VARCHAR2(512) NOT NULL, /* 회원이메일 */
   m_prof_img_path VARCHAR2(256) NOT NULL, /* 회원프로필이미지경로 */
   m_join_date CHAR(8) NOT NULL, /* 회원 가입일 */
   m_drop_Date CHAR(8) NULL, /* 회원 탈퇴일 */
   m_position CHAR(1) NULL, /* 회원 구분 */
   m_state CHAR(1) NULL /* 회원 상태 */
);

COMMENT ON TABLE MEMBER IS 'MEMBER';

COMMENT ON COLUMN MEMBER.member_id IS '회원코드';

COMMENT ON COLUMN MEMBER.m_password IS '비밀번호';

COMMENT ON COLUMN MEMBER.m_name IS '회원이름';

COMMENT ON COLUMN MEMBER.m_email IS '회원이메일';

COMMENT ON COLUMN MEMBER.m_prof_img_path IS '회원프로필이미지경로';

COMMENT ON COLUMN MEMBER.m_join_date IS '회원 가입일';

COMMENT ON COLUMN MEMBER.m_drop_Date IS '회원 탈퇴일';

COMMENT ON COLUMN MEMBER.m_position IS '회원 구분';

COMMENT ON COLUMN MEMBER.m_state IS '회원 상태';

CREATE UNIQUE INDEX PK_MEMBER
   ON MEMBER (
      member_id ASC
   );

ALTER TABLE MEMBER
   ADD
      CONSTRAINT PK_MEMBER
      PRIMARY KEY (
         member_id
      );
      
/* BOARDTYPE */
CREATE TABLE BOARDTYPE (
   boardtype_id VARCHAR2(16) NOT NULL, /* 게시판 타입 분류 코드 */
   b_name VARCHAR2(64) NOT NULL /* 게시판 분류 이름 */
);

CREATE UNIQUE INDEX PK_BOARDTYPE
   ON BOARDTYPE (
      boardtype_id ASC
   );

ALTER TABLE BOARDTYPE
   ADD
      CONSTRAINT PK_BOARDTYPE
      PRIMARY KEY (
         boardtype_id
      );

/* POSTING */
CREATE TABLE POSTING (
   posting_id VARCHAR2(16) NOT NULL, /* 게시물코드 */
   p_content VARCHAR2(512) NOT NULL, /* 게시물 파일 경로 */
   p_datetime CHAR(14) NOT NULL, /* 게시글 작성 시간 */
   p_number NUMBER(11) NOT NULL, /* 게시글 번호 */
   p_like NUMBER(11) NOT NULL, /* 게시글 좋아요 */
   p_title VARCHAR2(512) NOT NULL, /* 게시글 제목 */
   p_hits NUMBER(11) NOT NULL, /* 게시글 조회수 */
   p_img_path VARCHAR2(256) NOT NULL, /* 글 대표이미지 경로 */
   boardtype_id VARCHAR2(16) NOT NULL, /* 게시판 타입 분류 코드 */
   member_id VARCHAR2(512) NOT NULL /* 회원코드 */
);

CREATE UNIQUE INDEX PK_POSTING
   ON POSTING (
      posting_id ASC
   );

ALTER TABLE POSTING
   ADD
      CONSTRAINT PK_POSTING
      PRIMARY KEY (
         posting_id
      );

ALTER TABLE POSTING
   ADD
      CONSTRAINT FK_BOARDTYPE_TO_POSTING
      FOREIGN KEY (
         boardtype_id
      )
      REFERENCES BOARDTYPE (
         boardtype_id
      );

ALTER TABLE POSTING
   ADD
      CONSTRAINT FK_MEMBER_TO_POSTING
      FOREIGN KEY (
         member_id
      )
      REFERENCES MEMBER (
         member_id
      );
    
/* REPLY */
CREATE TABLE REPLY (
   reply_id VARCHAR2(16) NOT NULL, /* 댓글 고유코드 */
   r_parent_id VARCHAR2(16), /* 상위 댓글 ID */
   r_datetime CHAR(14) NOT NULL, /* 댓글 작성 시간 */
   r_level NUMBER(11) NOT NULL, /* 댓글 깊이 구분 값 */
   posting_id VARCHAR2(16) NOT NULL, /* 게시물코드 */
   member_id VARCHAR2(512) NOT NULL /* 회원코드 */
);

CREATE UNIQUE INDEX PK_REPLY
   ON REPLY (
      reply_id ASC
   );

ALTER TABLE REPLY
   ADD
      CONSTRAINT PK_REPLY
      PRIMARY KEY (
         reply_id
      );

ALTER TABLE REPLY
   ADD
      CONSTRAINT FK_POSTING_TO_REPLY
      FOREIGN KEY (
         posting_id
      )
      REFERENCES POSTING (
         posting_id
      )
      ON DELETE CASCADE;

ALTER TABLE REPLY
   ADD
      CONSTRAINT FK_MEMBER_TO_REPLY
      FOREIGN KEY (
         member_id
      )
      REFERENCES MEMBER (
         member_id
      );
     
/* FAVORITE */
CREATE TABLE FAVORITE (
   member_id VARCHAR2(512) NOT NULL, /* 회원코드 */
   plan_id VARCHAR2(16) NOT NULL /* 플랜고유코드 */
);

ALTER TABLE FAVORITE
   ADD
      CONSTRAINT FK_MEMBER_TO_FAVORITE
      FOREIGN KEY (
         member_id
      )
      REFERENCES MEMBER (
         member_id
      );

ALTER TABLE FAVORITE
   ADD
      CONSTRAINT FK_PLAN_TO_FAVORITE
      FOREIGN KEY (
         plan_id
      )
      REFERENCES PLAN (
         plan_id
      )
      ON DELETE CASCADE;
      
/* SCHEDULE_PICTURE */
CREATE TABLE SCHEDULE_PICTURE (
   s_date CHAR(8) NOT NULL, /* 해당 일정 날짜 */
   plan_id VARCHAR2(16) NOT NULL, /* 플랜고유코드 */
   sp_img_path varchar2(256) /* 여행 날짜 별 사진 경로 */
);

CREATE UNIQUE INDEX PK_SCHEDULE_PICTURE
   ON SCHEDULE_PICTURE (
      s_date ASC,
      plan_id ASC
   );

ALTER TABLE SCHEDULE_PICTURE
   ADD
      CONSTRAINT PK_SCHEDULE_PICTURE
      PRIMARY KEY (
         s_date,
         plan_id
      );

ALTER TABLE SCHEDULE_PICTURE
   ADD
      CONSTRAINT FK_PLAN_TO_SCHEDULE_PICTURE
      FOREIGN KEY (
         plan_id
      )
      REFERENCES PLAN (
         plan_id
      )
      ON DELETE CASCADE;
      
/* AREA */
CREATE TABLE AREA (
   area_id VARCHAR2(16) NOT NULL, /* 지역고유코드 */
   a_name VARCHAR2(32) NOT NULL, /* 지역 이름 */
   a_address VARCHAR2(128), /* 지역 주소 */
   a_latitude VARCHAR2(32) NOT NULL, /* 지역 위도 */
   a_longitude VARCHAR2(32) NOT NULL, /* 지역 경도 */
   a_img_path VARCHAR2(256), /* 지역이미지경로 */
   channel_id VARCHAR2(16)
);

CREATE UNIQUE INDEX PK_AREA
   ON AREA (
      area_id ASC
   );

ALTER TABLE AREA
   ADD
      CONSTRAINT PK_AREA
      PRIMARY KEY (
         area_id
      );
ALTER TABLE AREA
   ADD
      CONSTRAINT FK_CHANNEL_TO_AREA
      FOREIGN KEY (
         channel_id
      )
      REFERENCES CHANNEL (
         channel_id
      );
      
/* THEME */
CREATE TABLE THEME (
   theme_id VARCHAR2(16) NOT NULL, /* 테마고유코드 */
   t_name VARCHAR2(64) NOT NULL /* 테마 분류명 */
);

CREATE UNIQUE INDEX PK_THEME
   ON THEME (
      theme_id ASC
   );

ALTER TABLE THEME
   ADD
      CONSTRAINT PK_THEME
      PRIMARY KEY (
         theme_id
      );
      
/* PLAN */
CREATE TABLE PLAN (
   plan_id VARCHAR2(16) NOT NULL, /* 플랜고유코드 */
   p_title VARCHAR2(64) NOT NULL, /* 플랜명 */
   p_start_date CHAR(8) NOT NULL, /* 여행 시작 일 */
   p_end_date CHAR(8) NOT NULL, /* 여행 종료 일 */
   p_groupno NUMBER(11) NOT NULL, /* 여행 그릅 인원수 */
   p_create_datetime CHAR(14) NOT NULL, /* 플랜 생성 일시 */
   p_calendar_file_path VARCHAR2(256) NOT NULL, /* 최종 달력 파일 저장 경로 */
   p_map_img_path VARCHAR2(256) NOT NULL, /* 대표 지도 이미지 경로 */
   theme_id VARCHAR2(16) NOT NULL, /* 테마고유코드 */
   member_id VARCHAR2(512) NOT NULL /* 회원코드 */
);

CREATE UNIQUE INDEX PK_PLAN
   ON PLAN (
      plan_id ASC
   );

ALTER TABLE PLAN
   ADD
      CONSTRAINT PK_PLAN
      PRIMARY KEY (
         plan_id
      );

ALTER TABLE PLAN
   ADD
      CONSTRAINT FK_THEME_TO_PLAN
      FOREIGN KEY (
         theme_id
      )
      REFERENCES THEME (
         theme_id
      );

ALTER TABLE PLAN
   ADD
      CONSTRAINT FK_MEMBER_TO_PLAN
      FOREIGN KEY (
         member_id
      )
      REFERENCES MEMBER (
         member_id
      );
      
/* SCHEDULE */
CREATE TABLE SCHEDULE (
   s_date CHAR(8) NOT NULL, /* 해당일정날짜 */
   s_seq NUMBER(11) NOT NULL, /* 날짜 별 일정순서 */
   plan_id VARCHAR2(16) NOT NULL, /* 플랜고유코드 */
   s_cost_stay NUMBER(11), /* 숙박비 */
   s_cost_food NUMBER(11), /* 식비 */
   s_cost_vehicle NUMBER(11), /* 교통비 */
   s_cost_etc NUMBER(11), /* 기타 비용 */
   s_note VARCHAR2(2048), /* 메모 */
   area_id VARCHAR2(16) NOT NULL /* 지역고유코드 */
);

CREATE UNIQUE INDEX PK_SCHEDULE
   ON SCHEDULE (
      s_date ASC,
      s_seq ASC,
      plan_id ASC
   );

ALTER TABLE SCHEDULE
   ADD
      CONSTRAINT PK_SCHEDULE
      PRIMARY KEY (
         s_date,
         s_seq,
         plan_id
      );

ALTER TABLE SCHEDULE
   ADD
      CONSTRAINT FK_PLAN_TO_SCHEDULE
      FOREIGN KEY (
         plan_id
      )
      REFERENCES PLAN (
         plan_id
      )
      ON DELETE CASCADE;

ALTER TABLE SCHEDULE
   ADD
      CONSTRAINT FK_AREA_TO_SCHEDULE
      FOREIGN KEY (
         area_id
      )
      REFERENCES AREA (
         area_id
      );
      
select * from tab

/* CHANNEL 테이블 */
CREATE TABLE CHANNEL (
   channel_id VARCHAR2(16) NOT NULL, /* 접근 경로 id */
   c_name VARCHAR2(256) NOT NULL /* 접근경로명 */
);

CREATE UNIQUE INDEX PK_CHANNEL
   ON CHANNEL (
      channel_id ASC
   );
ALTER TABLE CHANNEL
   ADD
      CONSTRAINT PK_CHANNEL
      PRIMARY KEY (
         channel_id
      );