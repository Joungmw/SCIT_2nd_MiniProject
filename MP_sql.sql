-- ?? ???? ??? ?? ??
create table mp_member (
    member_id       varchar2(20)    primary key
    ,member_pw      varchar2(20)    not null
    ,member_nm      varchar2(20)    not null
    ,member_sex     number(1)       default 0
);

-- ?? ???? ??? ?? ?? ??
create table mp_movie(
    movie_num       number          primary key
    ,movie_nm       varchar2(30)    not null
    ,movie_time     varchar2(20)    not null
    ,movie_img      number(10)      default 0
);

-- ?? ??? ?? ???? ???
create table mp_ticket(
    ticket_num      number          primary key
    ,movie_num      number
    ,member_id      varchar2(20)
    ,ticket_seat    number          default 0
    ,CONSTRAINT fk_num FOREIGN key(movie_num) references mp_movie(movie_num) on DELETE cascade
    ,CONSTRAINT fk_id FOREIGN key(member_id) references mp_member(member_id) on DELETE cascade
);

create sequence movie_num_seq;
create sequence ticket_num_seq;



-------------------------------------------------------------------------------------------

create table mp_member(
    member_id       varchar2(20)    primary key
    ,member_pw      varchar2(20)    not null
    ,member_nm      varchar2(20)    not null
    ,member_indate  date            default sysdate
    ,member_pt      number          default 0
);

create table mp_rating(
    rating_num      number          primary key
    ,rating_shop    varchar2(20)    not null
    ,rating_content varchar2(100)   not null
    ,member_id      varchar2(20)
    ,rating_pt      number          default 0
    ,rating_original varchar2(100)
    ,rating_saved   varchar2(100)
    , CONSTRAINT fk_id FOREIGN key(member_id) references mp_member(member_id) on DELETE cascade
);

create sequence rating_num_seq;