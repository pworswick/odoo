USE [odoo]
GO
/****** Object:  Table [dbo].[product_template_bkp]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_template_bkp](
	[id] [int] NULL,
	[seller_ids] [int] NULL,
	[standard_price] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_template]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_template](
	[id] [int] NULL,
	[seller_ids] [int] NULL,
	[standard_price] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_supplierinfo]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_supplierinfo](
	[id] [int] NOT NULL,
	[name] [int] NULL,
	[product_id] [int] NULL,
	[product_tmpl_id] [int] NULL,
	[product_code] [nchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_product]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product_product](
	[id] [int] NULL,
	[active] [smallint] NULL,
	[barcode] [varchar](50) NULL,
	[create_date] [date] NULL,
	[name] [varchar](50) NULL,
	[standard_price] [decimal](10, 2) NULL,
	[list_price] [decimal](10, 2) NULL,
	[categ_id] [int] NULL,
	[secondary_categ_id] [int] NULL,
	[family_id] [int] NULL,
	[taxes_id] [int] NULL,
	[description_sale] [ntext] NULL,
	[sale_ok] [tinyint] NULL,
	[purchase_ok] [tinyint] NULL,
	[seller_ids] [varchar](50) NULL,
	[product_tmpl_id] [int] NULL,
	[brand_id] [int] NULL,
	[buying_group_id] [int] NULL,
	[qty_available] [decimal](7, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_family]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product_family](
	[id] [int] NULL,
	[name] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_category]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product_category](
	[id] [int] NULL,
	[name] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_buying_group]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product_buying_group](
	[id] [int] NULL,
	[name] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_brand]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product_brand](
	[id] [int] NULL,
	[name] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pos_session]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pos_session](
	[id] [int] NULL,
	[config_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pos_order_line]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pos_order_line](
	[id] [int] NULL,
	[company_id] [int] NULL,
	[name] [varchar](50) NULL,
	[create_date] [datetime] NULL,
	[product_id] [int] NULL,
	[order_id] [int] NULL,
	[qty] [decimal](10, 2) NULL,
	[price_unit] [decimal](10, 2) NULL,
	[price_subtotal] [decimal](10, 2) NULL,
	[price_subtotal_incl] [decimal](10, 2) NULL,
	[total_cost] [decimal](10, 2) NULL,
	[margin] [decimal](10, 2) NULL,
	[margin_percent] [decimal](7, 2) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pos_order]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pos_order](
	[id] [int] NULL,
	[session_id] [int] NULL,
	[date_order] [date] NULL,
	[amount_total] [numeric](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pos_config]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pos_config](
	[id] [int] NULL,
	[name] [varchar](30) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[Store]    Script Date: 09/15/2023 08:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Store] as 
select
100 as id,
'' as Name,
'' as StoreCode,
'' as Region,
'' as Address1,
'' as Address2,
'' as City,
'' as Country,
'' as FaxNumber,
'' as PhoneNumber,
'' as State,
'' as Zip,
0 as ParentStoreID,
0 as ScheduleHourMask1,
0 as ScheduleHourMask2,
0 as ScheduleHourMask3,
0 as ScheduleHourMask4,
0 as ScheduleHourMask5,
0 as ScheduleHourMask6,
0 as ScheduleHourMask7,
0 as ScheduleMinute,
0 as RetryCount,
0 as RetryDelay,
'' as LastUpdated,
'' as AccountName,
'' as Password,
0 as DBTimeStamp,
0 as Inactive,
0 as SyncedStoreStatus
GO
/****** Object:  Table [dbo].[stock_warehouse]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stock_warehouse](
	[id] [int] NULL,
	[name] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stock_quant]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock_quant](
	[id] [int] NULL,
	[product_id] [int] NULL,
	[loc_id] [tinyint] NULL,
	[qty_available] [decimal](10, 2) NULL,
	[available_quantity] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stock_move]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock_move](
	[id] [int] NULL,
	[location_id] [int] NULL,
	[warehouse_id] [int] NULL,
	[product_id] [int] NULL,
	[product_qty] [decimal](7, 2) NULL,
	[price_unit] [money] NULL,
	[product_qty_available] [decimal](7, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stock_location]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stock_location](
	[id] [int] NULL,
	[name] [varchar](50) NULL,
	[complete_name] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[secondary_product_category]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[secondary_product_category](
	[id] [int] NULL,
	[name] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[res_partner]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[res_partner](
	[id] [int] NULL,
	[name] [varchar](50) NULL,
	[company_id] [int] NULL,
	[company_name] [varchar](5) NULL,
	[is_company] [char](1) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[registers]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[registers](
	[name] [varchar](30) NULL,
	[area] [char](2) NULL,
	[location_id] [tinyint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ir_model_data]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ir_model_data](
	[id] [int] NULL,
	[model] [varchar](50) NULL,
	[module] [varchar](50) NULL,
	[res_id] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[matchup]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[matchup](
	[hqid] [int] NULL,
	[external_id] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[margins]    Script Date: 09/15/2023 08:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[margins](
	[CategoryId] [int] NULL,
	[odoo_cat_id] [int] NOT NULL,
	[Margin_NoVAT] [float] NULL,
	[Margin_VAT] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Supplier]    Script Date: 09/15/2023 08:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[Supplier] as
select '' as Country,


	0  as HQID,	
	NULL as LastUpdated	,
	'' as State	,
	id,
	Name as SupplierName	,
	'' as ContactName	,
	'' as Address1	,
	'' as Address2	,
	'' as City	,
	'' as Zip	,
	'' as EmailAddress	,
	'' as WebPageAddress,	
	'' as Code	,
	0 as DBTimeStamp	,
	'' as AccountNumber	,
	'' as TaxNumber	,
	0 as CurrencyID	,
	'' as PhoneNumber,	
	'' as FaxNumber	,
	'' as CustomText1,	
	'' as CustomText2,	
	'' as CustomText3,	
	'' as CustomText4,	
	'' as CustomText5,	
	'' as CustomNumber1,	
	'' as CustomNumber2	,
	'' as CustomNumber3	,
	'' as CustomNumber4	,
	'' as CustomNumber5	,
	'' as CustomDate1	,
	'' as CustomDate2	,
	'' as CustomDate3	,
	'' as CustomDate4	,
	'' as CustomDate5	,
	'' as Notes	,
	''  as Terms
	from res_partner
GO
/****** Object:  View [dbo].[Item]    Script Date: 09/15/2023 08:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select top 2 * from product_product

CREATE view [dbo].[Item] as 	
select
'' as 	BinLocation,
0 as 	BuydownPrice,
0 as 	BuydownQuantity,
0 as 	CommissionAmount,
0 as 	CommissionMaximum,
0 as 	CommissionMode,
0 as 	CommissionPercentProfit,
0 as 	CommissionPercentSale,
[name] as 	Description,
0 as 	FoodStampable,
0 as 	HQID,
0 as 	ItemNotDiscountable,
NULL as	LastReceived,
NULL as	LastUpdated,
'' as	Notes,
0 as 	QuantityCommitted,
0 as 	SerialNumberCount,
0 as 	TareWeightPercent,
id as 	ID,
barcode as 	ItemLookupCode,
0 as 	DepartmentID,
0 as 	CategoryID,
0 as 	MessageID,
0 as 	Price,
0 as 	PriceA,
0 as 	PriceB,
0 as 	PriceC,
0 as 	SalePrice,
NULL as	SaleStartDate,
NULL as	SaleEndDate,
0 as 	QuantityDiscountID,
taxes_id as	TaxID,
0 as 	ItemType,
0 as 	Cost,
0 as 	Quantity,
0 as 	ReorderPoint,
0 as 	RestockLevel,
0 as 	TareWeight,
0 as 	SupplierID,
0 as 	TagAlongItem,
0 as 	TagAlongQuantity,
0 as 	ParentItem,
0 as 	ParentQuantity,
0 as 	BarcodeFormat,
0 as 	PriceLowerBound,
0 as 	PriceUpperBound,
'' as 	PictureName,
NULL as	LastSold,
name as 	ExtendedDescription,
'' as 	SubDescription1,
'' as 	SubDescription2,
'' as 	SubDescription3,
'' as 	UnitOfMeasure,
0 as 	SubCategoryID,
0 as 	QuantityEntryNotAllowed,
0 as 	PriceMustBeEntered,
'' as 	BlockSalesReason,
NULL as	BlockSalesAfterDate,
0 as 	Weight,
0 as 	Taxable,
0 as 	DBTimeStamp,
NULL as	BlockSalesBeforeDate,
0 as 	LastCost,
0 as 	ReplacementCost,
0 as 	WebItem,
0 as 	BlockSalesType,
0 as 	BlockSalesScheduleID,
0 as 	SaleType,
0 as 	SaleScheduleID,
0 as 	Consignment,
0 as 	Inactive,
NULL as	LastCounted,
0 as 	DoNotOrder,
0 as 	MSRP,
create_date	DateCreated,
'' as 	Content,
'' as 	UsuallyShip,
NULL as	NumberFormat,
NULL as	ItemCannotBeRet,
NULL as	ItemCannotBeSold,
NULL as	IsAutogenerated,
0 as 	IsGlobalvoucher,
'' as 	DeleteZeroBalanceEntry,
0 as 	TenderID
from product_product
GO
/****** Object:  View [dbo].[product_view]    Script Date: 09/15/2023 08:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[product_view] as
select a.*,b.Name as 'Dept',c.name as 'Category',d.Name as 'Family'
    from product_product a 
	left outer join product_category b on (b.id=a.categ_id)
	left outer join secondary_product_category c on (c.id=a.secondary_categ_id)
	left outer join product_family d on (d.id=a.family_id)
GO
/****** Object:  View [dbo].[my_view]    Script Date: 09/15/2023 08:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from pos_config

--select * from pos_session order by id

--select distinct config_id from pos_session

CREATE view [dbo].[my_view] as
select pc.id,pc.name as Store,cast(dateadd(hh,-4,create_date) as date) as create_date,product_id,order_id,qty,price_unit,price_subtotal,price_subtotal_incl,total_cost from pos_order_line pol 
	left outer join pos_order po on (pol.order_id=po.id)
	left outer join pos_session ps on (ps.id=po.session_id)
	left outer join pos_config pc on (pc.id=ps.config_id)
	

	--select * from my_view where Store is null

	--select * from registers

	--insert into registers values ('Woodbrook Register 3','WB','20')
GO
/****** Object:  View [dbo].[vw_pos_order_line]    Script Date: 09/15/2023 08:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_pos_order_line] as     
select 'OD' as [Database],    
a.id,company_id,d.name+'/' as [name],cast(dateadd(hh,-4,create_date) as date )as create_date, product_id,    
order_id,qty,price_unit,price_subtotal,price_subtotal_incl,total_cost,margin,margin_percent    
    
    
 from pos_order_line  a 
	left outer join pos_order b on (a.order_id=b.id)
	left outer join pos_session c on (b.session_id=c.id)
	left outer join pos_config d on (d.id=c.config_id)
					  
union all    
select 'GL',id,1,'GL/'+cast(RegisterID as varchar) as [name],    
cast(TransactionTime as date) as create_date,ItemId,a.TransactionNumber,Quantity,    
Price,Quantity*Price-a.SalesTax,Quantity*Price,Quantity*Cost,0,0    
from [glencoe-rms].dbo.[TransactionEntry] a    
left outer join [glencoe-rms].dbo.[Transaction] b on (a.TransactionNumber=b.TransactionNumber)    
left outer join [glencoe-rms].dbo.Batch c on (b.BatchNumber=c.BatchNumber)     
where TransactionTime>'2021-01-01'    
union all  
  
select 'WB',id,1,'WB/'+cast(RegisterID as varchar) as [name],    
cast(TransactionTime as date) as create_date,ItemId,a.TransactionNumber,Quantity,    
Price,Quantity*Price-a.SalesTax,Quantity*Price,Quantity*Cost,0,0    
from [woodbrook-rms].[woodbrook-rms].dbo.[TransactionEntry] a    
left outer join [woodbrook-rms].[woodbrook-rms].dbo.[Transaction] b on (a.TransactionNumber=b.TransactionNumber)    
left outer join [woodbrook-rms].[woodbrook-rms].dbo.Batch c on (b.BatchNumber=c.BatchNumber)     
where TransactionTime>'2021-01-01'
GO
/****** Object:  View [dbo].[vw_odoo_supplier]    Script Date: 09/15/2023 08:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_odoo_supplier] as 
select a.product_tmpl_id as SupplierId,
b.name
from product_supplierinfo a
	left outer join res_partner b on (a.name=b.id)
GO
/****** Object:  View [dbo].[vw_margins]    Script Date: 09/15/2023 08:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_margins] as 
select  distinct s.Name as Store,
		i.id,i.barcode,d.Name 'Dept Name',
		c.Name 'Category',i.Name as Description,i.standard_price,
		i.list_price,--case i.taxes_id when 5 then '1' else '0' end as Tax,
		 a.price_unit 'Wh Cost Price',
		i.taxes_id as Tax,
 case i.list_price
  when 0 then 0  
  else convert(decimal(10,2),(i.list_price-i.standard_price)/i.list_price*100 )
  end as Margin,
 -- Margin_NoVAT*100 as Margin_NoVAT,Margin_VAT*100 as Margin_VAT  
 Margin_noVAT*100 as Margin_NoVAT
from stock_move a   
 left outer join stock_warehouse s on (a.warehouse_id=s.id)  
 left outer join product_product i on (i.id=a.product_id)  
 left outer join product_category d on (d.id=i.categ_id)  
 left outer join secondary_product_category c on (i.secondary_categ_id=c.id)  
 
  left outer join Margins m on (m.odoo_cat_id=i.secondary_categ_id)  
 where i.active=1  --and s.Name is not null
GO
/****** Object:  View [dbo].[Time]    Script Date: 09/15/2023 08:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[Time] as select * from [glencoe-rms].dbo.Time
GO
/****** Object:  View [dbo].[vw_stock_move]    Script Date: 09/15/2023 08:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
create view product_view as
select a.*,b.Name as 'Dept',c.name as 'Category',d.Name as 'Family'
    from product_product a 
	left outer join product_category b on (b.id=a.categ_id)
	left outer join secondary_product_category c on (c.id=a.secondary_categ_id)
	left outer join product_family d on (d.id=a.family_id)*/

	--select * from stock_move

	create view [dbo].[vw_stock_move] as
	select a.* ,b.Name as 'Store'
	from stock_move a left outer join stock_warehouse b on (a.warehouse_id=b.id)
GO
/****** Object:  View [dbo].[vw_registers]    Script Date: 09/15/2023 08:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*select * from registers 
where name<>'GL' and name<>'WB'
order by area 
*/

create view [dbo].[vw_registers] as 
select * from registers
union
select 'GL','GL',8
union
select 'WB','WB',20
GO
/****** Object:  View [dbo].[vw_quant]    Script Date: 09/15/2023 08:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_quant] as       
select 'OD' as [Database],product_id,qty_available, available_quantity   ,  
case loc_id      
 when 8 then 'GL'      
 when 20 then 'WB' 
 when 46 then 'GV'     
       
end as area      
      
 from stock_quant  where loc_id in (8,20,46)
GO
/****** Object:  View [dbo].[vw_product_product1]    Script Date: 09/15/2023 08:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext vw_product_product1            
            
              
CREATE view [dbo].[vw_product_product1] as              
              
select 'OD' as [Database],pp.id,              
active,              
barcode,              
create_date,              
pp.name as Description,              
standard_price,              
list_price,              
pc.name as [Department],  --categ_id,               
spc.name as [Category], --secondary_categ_id,              
pf.name as [Family],              
taxes_id,              
description_sale,              
sale_ok,              
purchase_ok,              
seller_ids,              
pp.product_tmpl_id,              
pb.name as Brand, --brand_id,              
pbg.name [Buying Group], --buying_group_id,              
qty_available,  
product_code  
from product_product pp               
left outer join product_category pc on (pp.categ_id=pc.id)              
left outer join secondary_product_category spc on (pp.secondary_categ_id=spc.id)              
left outer join product_family pf on (pp.family_id=pf.id)              
left outer join product_brand pb on (pb.id=pp.brand_id)              
left outer join product_buying_group pbg on (pbg.id=pp.buying_group_id)      
left outer join product_supplierinfo psi on (pp.product_tmpl_id=psi.product_tmpl_id)    
--where psi.product_code!=''  
        
              
union all              
select 'GL',i.id,        
case inactive         
 when 0 then 1         
 when 1 then 0         
 else 0        
 end,        
 ItemLookupCode,              
DateCreated,Description,i.Cost,Price,              
isnull(d.Name,''),--DepartmentID,              
isnull(c.Name,''), --CategoryId,              
Subdescription1 as Family,              
TaxID,'',      
case ItemCannotBeSold              
  when 0 then 1         
 when 1 then 0         
 else 0        
end,      
      
      
case DoNotOrder         
 when 0 then 1         
 when 1 then 0         
 else 0        
end,              
i.SupplierID,i.SupplierID,  -- seller_ids, product_tmpl_id              
Subdescription2 as Brand,               
SubDescription3,              
Quantity,ReorderNumber             
              
from [glencoe-rms].dbo.Item i              
left outer join [glencoe-rms].dbo.Department d on (d.id=i.DepartmentID)              
left outer join [glencoe-rms].dbo.Category c on (c.id=i.CategoryID)     
left outer join [glencoe-rms].dbo.SupplierList s on (s.ItemId=i.id and i.SupplierId=s.SupplierID)         
          
union all              
select 'WB',i.id,        
 case inactive         
  when 0 then 1         
  when 1 then 0         
  else 0        
  end,        
ItemLookupCode,              
DateCreated,Description,i.Cost,Price,              
isnull(d.Name,''),--DepartmentID,              
isnull(c.Name,''), --CategoryId,              
Subdescription1 as Family,              
TaxID,'',      
case ItemCannotBeSold      
  when 0 then 1         
 when 1 then 0         
 else 0        
end,      
      
case DoNotOrder         
 when 0 then 1         
 when 1 then 0         
 else 0        
 end,              
i.SupplierID,i.SupplierID,  -- seller_ids, product_tmpl_id              
Subdescription2 as Brand,               
SubDescription3,              
Quantity,ReorderNumber              
              
from [woodbrook-rms].[woodbrook-rms].dbo.Item i              
left outer join [woodbrook-rms].[woodbrook-rms].dbo.Department d on (d.id=i.DepartmentID)              
left outer join [woodbrook-rms].[woodbrook-rms].dbo.Category c on (c.id=i.CategoryID) 
left outer join [woodbrook-rms].[woodbrook-rms].dbo.SupplierList s on (s.ItemId=i.id and i.SupplierId=s.SupplierID)
GO
/****** Object:  View [dbo].[TransactionEntry]    Script Date: 09/15/2023 08:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Commission	Cost	FullPrice	StoreID	ID	TransactionNumber	ItemID	Price	PriceSource	Quantity	SalesRepID	Taxable	DetailID	Comment	DBTimeStamp	DiscountReasonCodeID	ReturnReasonCodeID	TaxChangeReasonCodeID	SalesTax	QuantityDiscountID	ItemType	ComputedQuantity	TransactionTime	IsAddMoney	VoucherID
--0.00	12.17	20.49	4	6488837	2618996	8739	20.49	1	1	0	1	0		0x000000000BEF1176	0	0	0	2.6726	0	0	4	2015-10-15 21:17:28.000	0	0

create view [dbo].[TransactionEntry] as 
select 0 as commission,
total_cost as Cost,
price_subtotal as FullPrice,
100 as StoreID,
id as id,
0 as TransactionNumber,
Product_Id as ItemId,
price_subtotal as Price,
0 as PriceSource,
qty as Quantity,
0 as Salesrep,
0 as taxable,
0 as DetailID,
0 as Comment,
0 as DBTimeStamp,
0 as DiscountReasonCodeID,
0 as ReturnReasonCodeID,
0 as TaxChangeReasonCodeID,
price_subtotal_incl-price_subtotal as SalesTax,
0 as QuantityDiscountID,
0 as ItemType,
0 as ComputedQuantity,
create_date as TransactionTime,
0 as IsAddMoney,
0 as VoucherID
from pos_order_line
	--ItemType	ComputedQuantity	TransactionTime	IsAddMoney	VoucherID
GO
/****** Object:  View [dbo].[vw_Supplier]    Script Date: 09/15/2023 08:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_Supplier] as     
select 'OD' as [Database],* from vw_odoo_supplier    
union all    
select 'GL',id,SupplierName from [glencoe-rms].dbo.Supplier    
union all  
select 'WB',id,SupplierName from [woodbrook-rms].[woodbrook-rms].dbo.Supplier
union
select 'WB',0,''
union 
select 'GL',0,''
GO
/****** Object:  View [dbo].[vw_product]    Script Date: 09/15/2023 08:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_product] as  
select p.*,t.standard_price as Cost from vw_product_product1 p 
left outer join product_template t on (p.product_tmpl_id=t.id)
where [Database]='OD'
GO
