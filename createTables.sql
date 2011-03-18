-- createTables.sql
-- create sequences
drop sequence if exists user_id_seq cascade;
create sequence user_id_seq;

drop sequence if exists suggestion_id_seq cascade;
create sequence suggestion_id_seq;

--create tables
drop table if exists users cascade;
create table users(
id integer not null primary key default nextval('user_id_seq'),
first_name text,
last_name text,
username text,
division text,
department text,
password text,
enc_pass text, 
salt text
);

drop table if exists suggestions cascade;
create table suggestions(
id integer not null primary key default nextval('suggestion_id_seq'),
user_id integer references users(id),
memo text,
created_at timestamp,
updated_at timestamp
);

--create view

drop view if exists user_suggestion_view cascade;
create view user_suggestion_view as
select users.id as userid,users.first_name,users.last_name,users.username,users.division,
   users.department, suggestions.id as suggestionid,suggestions.memo,suggestions.created_at,suggestions.updated_at
   from users 
   join suggestions on users.id = suggestions.user_id;




