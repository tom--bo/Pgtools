# NAME

Pgtools - It's new $module

# SYNOPSIS

### pg_kill

$ pg_kill -print -mq '.+' "192.168.32.12,5432,postgres,,dvdrental"   
`-------------------------------`   
pid       : 11493   
start_time: 2016-03-20 16:11:17.57228+00   
state     : idle   
query     : SELECT * FROM actor WHERE last_name like '%a%';   
`-------------------------------`   
pid       : 11492   
start_time: 2016-03-20 16:08:07.762289+00   
state     : idle   
query     : select * from actor where actor_id < 200;   


$ pg_kill -kill -print -mq "like\s'\%.+\%'" "192.168.32.12,5432,postgres,,dvdrental"   
`-------------------------------`   
Killed-pid: 11590    
At        : 2016/03/21 01:32:29   
Query     : SELECT * FROM actor WHERE last_name like '%a%';   
Killed matched queries!   


### pg_config_diff

$ pg_config_diff  "192.168.33.21,5432,postgres,," "192.168.33.22,,,," "192.168.33.23,5432,postgres,,dvdrental"   
<Setting Name>           192.168.33.21           192.168.33.22           192.168.33.23   
`--------------------------------------------------------------------------------------------`   
max_connections          50                      100                     100    
shared_buffers           32768                   16384                   65536     
tcp_keepalives_idle      8000                    7200                    10000    
tcp_keepalives_interval  75                      75                      10   
wal_buffers              1024                    512                     2048   
  

### pg_fingerprint

$ pg_fingerprint -query "SELECT * FROM users WHERE id < 10;"   
SELECT * FROM users WHERE id < ?;   
  
$ pg_fingerprint queries_file   
SELECT * FROM user WHERE id = ?;    
SELECT * FROM user2 WHERE id = ? LIMIT ?;   
SELECT * FROM user2 WHERE point = ?;   
SELECT * FROM user2 WHERE expression IS ?;    


# DESCRIPTION

Pgtools is a collection of PostgreSQL operation commands.   
"Pgtools" composes ...    
- pg_kill        : Show and also kill the specified queries during excution by regular expression and other options.   
- pg_config_diff : Show different settings between plural PostgreSQL database.   
- pg_fingerprint : Converts the values into a placeholders.   

# LICENSE

Copyright (C) Otsuka Tomoaki.   

This library is free software; you can redistribute it and/or modify   
it under the same terms as Perl itself.   

# AUTHOR

Otsuka Tomoaki &lt;otsuka.t.2013@gmail.com>     
