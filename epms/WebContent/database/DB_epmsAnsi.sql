

-- �� sql���� �����ϱ� ���� �о��

-- 1. DB char type�� ���缭 �Է��ؾ� ������ �ȳ�

-- 2. OracleDB�� ��� sql�� ������ ansi�� �Է��ؾ� ����ó���� (UTF-8 : �ѱ۱���)

-- 3. �� ������ ��� UTF-8�� �����Ǿ������Ƿ� (��Ŭ�������� �ѱ������ �����ְ�)

--    ������Ʈ�� �ּ��� �� DB_epms.sql ���Ͽ��� ó�����Ŀ�

--    text �޸�������� �� ������ ���� �������ڵ��� ansi�� �����ؼ�

--    DB_empsAnsi.sql�� ������

--    [ @ ���ϰ��/DB_empsAnsi.sql ] �� sql �ֿܼ��� �����Ұ��� ��õ��  


-- �������� ���� -----------------------------------------

-- ����� ��������
	-- ��������(�ܷ�Ű) ���� ����
drop table account cascade CONSTRAINTS;
create table account(
	ac_id varchar2(50) not null,  --ũ�����
	ac_pw varchar2(50) not null,  --ũ�����
	ac_name varchar2(50) not null, --ũ�����
	ac_phone varchar2(20) not null,
	ac_addr1 varchar2(200) not null, --ũ�����
	ac_addr2 varchar2(200) not null, --ũ�����
	ac_email varchar2(40) not null, --ũ�����
	ac_date date not null,
	ac_type varchar2(10) null,
	ac_point number default 0,
	ac_area varchar2(40) null,	--ũ�����
	primary key(ac_id)
);
commit;

-- ������ ��������
drop table admin;
create table admin(
	ad_id varchar2(20) not null,
	ad_pw varchar2(20) not null,
	primary key(ad_id)
);
commit;

-- �α��� ����
drop table login;
create table login(
	lg_id varchar2(20),
	lg_name varchar2(20),
	primary key(lg_id)
);
commit;





-- �޽��� ���� ---------------------------------------

-- �޽��� ������
drop sequence  mss_seq;
create sequence mss_seq
 start with 1
 increment by 1;
commit;

-- �޽��� ���̺�
drop table messenger;
create table messenger(
	mss_no number(7) not null, 
	mss_receiver varchar2(20) not null,
	mss_sender varchar2(20) not null,
	mss_content varchar2(40) null,
	mss_date date not null,
	primary key(mss_no)
);
commit;

-- ���� ������ 
drop sequence  nofi_seq;
create sequence nofi_seq
 start with 1
 increment by 1;
commit;

-- �������� ���̺�
drop table board_nofi;
create table board_nofi(
	nofi_no number(7) not null,
	nofi_id varchar2(20) not null,
	nofi_title varchar2(20) not null,
	nofi_content varchar2(100) not null,
	nofi_date date not null,
	primary key(nofi_no)
);
commit;


-- �����Խ��� ������
drop sequence  fr_seq;
create sequence fr_seq
 start with 1
 increment by 1;
commit;

-- �����Խ��� ���̺�
drop table board_fr;
create table board_fr(
	fr_no number(7) not null,
	fr_id varchar2(20) not null,
	fr_name varchar2(20) not null,
	fr_title varchar2(20) not null,
	fr_content varchar2(100) not null,
	fr_count number(7) default 0,
	fr_date date not null,
	primary key(fr_no)
);
commit;

-- �����Խ��� ��� ������
drop sequence  fr_reply_seq;
create sequence fr_reply_seq
 start with 1
 increment by 1;
commit;

-- �����Խ��� ��� ���̺�
drop table reply_fr;
create table reply_fr(
	rfr_no number(7) not null,
	rfr_id varchar2(20) not null,
	rfr_content varchar2(100) not null,
	rfr_date date not null,
	primary key(rfr_no)
);
commit;


-- FAQ �Խ��� ������
drop sequence  faq_seq;
create sequence faq_seq
 start with 1
 increment by 1;
commit;

-- FAQ �Խ���
drop table board_faq;
create table board_faq(
	faq_no number(7) not null primary key,
	faq_id varchar2(50) not null,
	faq_name varchar2(50) not null,
	faq_title varchar2(50) not null,
	faq_content varchar2(200) not null,
	faq_count number(7) default 0,
	faq_date date not null,
	faq_level number,
	faq_parent number,
	faq_group number,
	faq_re_seq number	
);	
commit;



-- ����������
drop sequence pa_seq;
create sequence pa_seq
 start with 1
 increment by 1;


-- ���������� ��ġ
drop table parking_area cascade CONSTRAINTS;
create table parking_area (
   pa_no number not null,
   pa_si varchar2(20) ,
   pa_gu varchar2(20) ,
   pa_address varchar2(100) not null,
   pa_lat number not null,
   pa_lon number not null,
   primary key(pa_address)   
);


-- �������� �ϳ��� ����
drop table parking_area_personal;
create table parking_area_personal (
   pap_address varchar2(100) not null,
   pap_area varchar2(100) not null,
   pap_host varchar2(100) not null,
   primary key(pap_area)
);

-- ������������ <-> ����������ġ �������
alter table parking_area_personal add constraint pap_fk
foreign key(pap_address) references parking_area(pa_address) on delete cascade;
commit;

-- �뿩���� ������
drop sequence  r_seq;
create sequence r_seq
start with 1
increment by 1;
commit;

-- �뿩 ���̺�(�����, ������, �������, ���Ϸ�)
drop table reservation;
create table reservation(
   r_no number(7) not null,
   r_guest varchar2(20) not null,
   r_host varchar2(20) not null,
   r_address varchar2(100) not null,
   r_area varchar2(100) not null,
   r_content varchar2(300) null,
   r_from date not null,
   r_to date not null,
   r_request date not null,
   r_agree date,
   r_statusdate date,
   r_readcheck varchar2(10),
   r_status varchar2(20) not null,
   primary key(r_no)
);

commit;

-- account<->login �������
alter table login add constraint login_id_fk
foreign key(lg_id) references  account(ac_id) on delete cascade;
commit ;  



	


