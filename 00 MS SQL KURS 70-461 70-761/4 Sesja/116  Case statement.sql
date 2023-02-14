declare @myOption as varchar(10) = 'Option B'
select case when @myOption = 'Option A' then 'First option'
			when @myOption = 'Option B' then 'Second option' 
			else 'No Option' END as MyOption
go


declare @myOption as varchar(10) = 'Option B'
select case when @myOption = 'Option A' then 'First option'
			when @myOption = 'Option B' then 2 --'Second option' 
			else 'No Option' END as MyOption
go


declare @myOption as varchar(10) = 'Option B'
select case when @myOption = 'Option A' then 2 --'First option'
			when @myOption = 'Option B' then 'Second option' 
			else 'No Option' END as MyOption
go


declare @myOption as varchar(10) = 'Option B'
select case when @myOption = 'Option A' then convert(varchar(10), 2) --'First option'
			when @myOption = 'Option B' then 'Second option' 
			else 'No Option' END as MyOption
go


declare @myOption as varchar(10) = 'Option B'
select case when @myOption = 'Option A' then convert(varchar(10), 2) --'First option'
			when @myOption = 'Option B' then 'Second option' 
			--else 'No Option' 
			END as MyOption
go


declare @myOption as varchar(10) = 'Option C'
select case when @myOption = 'Option A' then convert(varchar(10), 2) --'First option'
			when @myOption = 'Option B' then 'Second option' 
			--else 'No Option' 
			END as MyOption
go



declare @myOption as varchar(10) = 'Option B'
select case @myOption  when 'Option A' then 'First option'
					   when 'Option B' then 'Second option' 
					   else 'No Option' END as MyOption
