ALTER DATABASE BlogDemos SET ENABLE_BROKER WITH ROLLBACK IMMEDIATE ;
select * from sys.transmission_queue
select name, suser_sname(owner_sid) from sys.databases
ALTER AUTHORIZATION ON DATABASE::[BlogDemo] TO sa;