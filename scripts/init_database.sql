/*
==============================================
Create Databaase and Schemas
==============================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists.
    If the database exists, it is dropped and receated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', 'gold'.

WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists.
    All data in the Database will be Permanently deleted. 
    Proceed with caution and ensure you have proper backup before running this script.
*/

use master;
go 

-- Drop and recreate the 'DataWarehouse' database
if exists (select 1 from sys.databases where name = 'DataWarehouse')
begin
    Alter database DataWarehouse set Single_user with rollback Immediate;
    drop database DataWarehouse;
end;
go

-- create the 'DataWarehouse' database
create database DataWarehouse;
go

use DataWarehouse;
go

--Create Schemas
create schema bronze;
go

create schema silver;
go

create schema gold;
go
