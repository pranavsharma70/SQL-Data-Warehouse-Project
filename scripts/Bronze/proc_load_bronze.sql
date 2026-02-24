/*
======================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
======================================================================================
Script Purpose:
  This storedprocedure loads data into the 'Bronze' Schema for external CSV files.
  It performs the following actions:
  - Truncates the bronze tables before loading data.
  - uses the 'BULK INSERT' command to load data from CSV files to Bronze Tables.

Parameters:
  None.
  This stored procedure does not accept any parameters or return any values.

UsageExample:
  EXEC bronze.load_bronze;
======================================================================================
*/



create or alter procedure bronze.load_bronze as 
begin
	set nocount on;
	declare @start_time datetime, @end_time datetime,
			@batch_start_time datetime, @batch_end_time datetime
	begin try
		set @batch_start_time = getdate();
		print '=======================================';
		print 'Loading Bronze Layer';
		print '=======================================';

		print '---------------------------------------';
		print 'Loading CRM Tables';
		print '---------------------------------------';

		set @start_time = getdate();

		print '>> Truncating Table: bronze.crm_cust_info';
		truncate table bronze.crm_cust_info;
		print '>> Inserting Data Into Table: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		from 'C:\Users\asus\Desktop\dataets for DWM\sql-DWP\datasets\source_crm\cust_info.csv'
		with (
			firstrow = 2,  -- it is telling query that 1st row fro data is second line 
			fieldterminator = ',', -- it is telling how the data is divide columnwise in the csv file 
			tablock
		);  -- if you execute this query again without truncate it will add whole table twice 
		
		set @end_time = getdate();
		print '>> Load Duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + 'Seconds'
		print '>>-------------------------'


		set @start_time = getdate();
		print '>> Truncating Table: bronze.crm_prd_info';
		truncate table bronze.crm_prd_info;
		print '>> Inserting Data Into Table: bronze.crm_cust_info';
		BULK INSERT bronze.crm_prd_info
		from 'C:\Users\asus\Desktop\dataets for DWM\sql-DWP\datasets\source_crm\prd_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		); 
		set @end_time = getdate();
		print '>> Load Duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + 'Seconds'
		print '>>-------------------------'


		set @start_time = getdate();
		print '>> Truncating Table: bronze.crm_sales_details';
		truncate table bronze.crm_sales_details;
		print '>> Inserting Data Into Table: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		from 'C:\Users\asus\Desktop\dataets for DWM\sql-DWP\datasets\source_crm\sales_details.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		); 
		set @end_time = getdate();
		print '>> Load Duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + 'Seconds'
		print '>>-------------------------'



		print '---------------------------------------';
		print 'Loading ERP Tables';
		print '---------------------------------------';

		set @start_time = getdate();
		print '>> Truncating Table: bronze.erp_loc_a101';
		truncate table bronze.erp_loc_a101;
		print '>> Inserting Data Into Table: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		from 'C:\Users\asus\Desktop\dataets for DWM\sql-DWP\datasets\source_erp\loc_a101.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		); 
		set @end_time = getdate();
		print '>> Load Duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + 'Seconds'
		print '>>-------------------------'



		set @start_time = getdate();
		print '>> Truncating Table: bronze.erp_cust_az12';
		truncate table bronze.erp_cust_az12;
		print '>> Inserting Data Into Table: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		from 'C:\Users\asus\Desktop\dataets for DWM\sql-DWP\datasets\source_erp\cust_az12.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		); 
		set @end_time = getdate();
		print '>> Load Duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + 'Seconds'
		print '>>-------------------------'


		set @start_time = getdate();
		print '>> Truncating Table: bronze.erp_px_cat_g1v2';
		truncate table bronze.erp_px_cat_g1v2;
		print '>> Inserting Data Into Table: bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		from 'C:\Users\asus\Desktop\dataets for DWM\sql-DWP\datasets\source_erp\px_cat_g1v2.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		); 
		set @end_time = getdate();
		print '>> Load Duration: ' + cast(datediff(second, @start_time, @end_time) as nvarchar) + 'Seconds'
		print '>>-------------------------------'


		set @batch_end_time = getdate();
		print '================================='
		print 'Loading Bronze Layer is Completed';
		print '  - Total Load Duration; ' + cast(datediff(second, @batch_start_time, @batch_end_time) as nvarchar) + 'Seconds';

	end try
	begin catch
		print '================================='
		print 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		print 'Error Messege' + error_message();
		print 'Error Messege' + cast(error_number() as nvarchar);
		print 'Error Messege' + cast(error_state() as nvarchar);
		print '================================='
	end catch
end

