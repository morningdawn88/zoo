drop language if exists plpgsql cascade;
create language plpgsql;

create or replace function insert_User(_first_name text, _last_name text,_username text,_division text,_department text,_password text)
  returns integer as
  $func$
  begin
    execute 'insert into users        
    (first_name,last_name,username,division,department,password)
values (' 
        || quote_literal(_first_name) || ',' ||
        quote_literal(_last_name) || ',' || quote_literal(_username)  || ','||    
        quote_literal(_division)|| ',' || quote_literal(_department) || ',' ||  
        quote_literal(_password)||')';
     return currval('user_id_seq');
   end;
   $func$
   language 'plpgsql';

create or replace function insert_Suggestion(_memo text)
   returns integer as
   $func$
   begin
     execute 'insert into Suggestions (memo, created_at, updated_at)
values ('
      || quote_literal(_memo) || ',' || quote_literal(now()) || ',' || quote_literal(now()) ||  
      ')';
   return currval('suggestion_id_seq');
  end;
  $func$ 
  language 'plpgsql';

create or replace rule user_suggestion_ins as on insert to user_suggestion_view
  do instead select (new.first_name, new.last_name,
  new.username,new.division,new.department,new.memo,new.created_at,new.updated_at);


