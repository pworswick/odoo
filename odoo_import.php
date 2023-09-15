<?php

/*
  Program to copy files from Odoo to MS SQL Database
*/

ini_set('max_execution_time', 0);

include 'odoo_import.inc.php';

$branch = 'OD';

include 'include/mssql.php'; 



// $common = ripcord::client($url.'/xmlrpc/2/common');
// $uid = $common->authenticate($db, $username, $password, array());

//echo "UID = $uid";
//echo('<br/>');


// $models = ripcord::client("$url/xmlrpc/2/object");

function comma($a)
{

return str_replace(array("'"),array("''"),$a);

}



 
  
 // exit();
 
 //var_dump($ids);
 
 //36 record = models.execute_kw(db,uid,password, 'product.product','read',[ids],{'fields': ['barcode', 'name', 'categ_id','location_id','lst_price','price','list_price','qty_available','standard_pri    ce']})

/*
   create table product_product		
(		
id	int,	
active	smallint,	
barcode 	varchar,	
create_date	date,	
name	varchar,	
standard_price 		decimal(5,2),
list_price	decimal(5,2),	
categ_id	int,	
taxes_id	int,	
description_sale	ntext,	
sale_ok	tinyint,	
purchase_ok 	tinyint	
)		

id	active	barcode	create_date	name	standard_price	list_price	categ_id	taxes_id	description_sale	sale_ok	purchase_ok



create table pos_order_line
(
id	int,
company_id	int,
name	varchar,
create_date	date,
	
product_id	int,
	
qty	decimal(5,2),
price_unit	decimal(5,2),
price_subtotal	decimal(5,2),
price_subtotal_incl	decimal(5,2),
total_cost	decimal(5,2)
)

*/
if (isset($_GET['x']))
    $x = $_GET['x'];
  //  else
  //  $x=8;


$screen=0;

if (isset($_GET['update']))
    $update = $_GET['update'];
    else 
    $update=1;
    
if (!$x)
    die();

 echo "\nX= $x   ";


switch ($x)
{
    
case 1:                     // pos.order.line
    $fields = array('id','company_id',
      'name','create_date','product_id', 'order_id',
      'qty','price_unit','price_subtotal','price_subtotal_incl',
      'total_cost','margin','margin_percent'
    );
    
    
    $table = "pos_order_line";
    break;
    
case 2:
    $fields = array('id','name');
    
    $table = 'secondary_product_category';       // Categories
    break;
    


case 3:
    $fields = array('id','name');
    
    $table = 'product_family';         // ?????
    break;
  /*
case 4:
    $fields = array('id','parent_id','child_id','name','display_name');      // Department
    
    $table = 'pos_category';
    break;
    */
case 5:
    $fields = array('id','name');
    $table = 'product_category';         // ?????
    break;

case 6:
    $fields = array('id','location_id','warehouse_id','product_id','product_qty','price_unit','product_qty_available');
     $table = "stock_move";
    break;

case 7:
    $fields = array('id','name');
     $table = 'stock_warehouse';
       break;
       
case 8:           // product
    $fields = array('id','active','barcode', 
            'create_date','name',
            //'location_id',
            'standard_price',
            'list_price',
            'categ_id',
            'secondary_categ_id',
            'family_id',
            'taxes_id',
            'description_sale',
            // 'price','list_price','qty_available',
            'sale_ok',
            'purchase_ok' ,
            'seller_ids',
            'product_tmpl_id',
            'brand_id' ,
            'buying_group_id',
            'qty_available'
            );
            
    $table = "product_product";
    break;
    
case 9:
    $fields = array('id','name','company_id','company_name','is_company' );
    $table = "res_partner";
    break;    
    
    
case 10:
    $fields = array('id','seller_ids','standard_price' );
    $table = "product_template";
    break;
      
    
case 11:
    $fields = array('id','name','product_id','product_tmpl_id','product_code' );
    $table = "product_supplierinfo";
    break;
    
case 12:
    $fields = array('id','name');
    $table = "product_brand";
    break;
    
case 13:
    $fields = array('id','name');
    $table = "product_buying_group";
    break;
    
case 14:
    $fields = array('id','name','complete_name');
    $table = "stock_location";
    break;
    
case 15:
    $fields = array('id','product_id','location_id','quantity','available_quantity');
    $table = "stock_quant";
    break;
    
case 16:
    $fields = array('id','config_id');
    $table = "pos_session";
    break;
    
case 17:
    $fields = array('id','session_id','date_order','amount_total');
    $table = "pos_order";
    break;
    
case 18:
    $fields = array('id','name');
    $table = "pos_config";
    break;

/* 
create table pos_config 
(
id int,
Name varchar(30)
)
*/
    
    /*
case 12: // Do not have access to this
    $fields = array('id','model','module','res_id');
    $table = "ir_model_data";
    break;
    */
    
    
}

echo $table."\n";

if ($update == 1)
    $sqltext = "select max(id) as id from $table";
    else    
    $sqltext = "delete from $table";
      
$stmt = sqlsrv_query($conn, $sqltext);  
    
if ( $stmt === false)  
    {
    print $sqltext."<br/>";
    print_r( sqlsrv_errors() );
    print "<br/>";
    }
    
if ($update==1)
    {
    $arr = sqlsrv_fetch_array( $stmt, SQLSRV_FETCH_ASSOC);
    $limit = $arr['id'];   
    
    echo "Limit = $limit\n";  
    }

  // die();



if ($update==0)
    $me = array();
    //$me =array(array('id','=',73932));
    else
    $me = array(
            array('id','>',$limit)
            //array('location_id','=',8)
             //   array('location_id','=',20)
             
             
                );   // END
    
print_r($me);
    
    
$ids = $models->execute_kw($db,$uid,$password,str_replace("_",".",$table),'search',
    array(
      //  array(
             //'is_company'=>'True'
             $me
      //  )
    ) 
     // ,array('limit'=>5000)
    );
 
  print "Count = ".count($ids);
 // die();
  
$new_ids = array_chunk($ids, 4000);

 //  var_dump($new_ids);
 //  die();
 
   
$ctr=0;

      //die();

foreach ($new_ids as $arr_ids)
{

 $records =   $models->execute_kw($db,$uid,$password, 
   str_replace("_",".",$table),
   'read',
    array($arr_ids),
    array('fields'=> $fields)
    
    ); 

    
    /*
print "<pre>";
 var_dump($records);
print "</pre>";
 die();
      */
      
      
foreach ($records as $arr)
    {
    $sqltext = " insert into $table values (";
    
    $tmp = "";
    foreach ($fields as $arr2)
        {
            
        if (is_array($arr[$arr2]))
            $tmp1 = @$arr[$arr2][0];   // Array get first element
            else
            {
            $str_arr = explode (",", $arr[$arr2]);   // Might be comman delimited list
            $tmp1 = $str_arr[0];   
            } 
        // print_r($str_arr[0]);
        
        if ($tmp == "")
            $tmp = "'".comma($tmp1)."'";
            else
            $tmp.= ",'".comma($tmp1)."'";
        }
    $sqltext.=$tmp.")";
    
   // echo $sqltext;
  //  die();
  
if (@$screen==0)
    {
   //  print "$ctr  = ".$sqltext."<br/>";
    $stmt = sqlsrv_query($conn, $sqltext);  
    
    if ( $stmt === false)  
        {
        print $sqltext."<br/>";
	    print_r( sqlsrv_errors() );
        print "<br/>";
        }
     }
     else
     {
     //print_r()
     print $sqltext."<br/>";
     }   
     
    $ctr++;
    } // End foreach  $records as $arr

} // End foreach

sqlsrv_free_stmt( $stmt );



$sqltext = "
declare @x as integer

select @x=count(*) from secondary_product_category where id=0

if (@x=0)
begin
	insert into secondary_product_category values (0,'')
end

select @x=count(*) from product_family where id=0

if (@x=0)
begin
	insert into product_family values (0,'')
end

select @x=count(*) from product_brand where id=0
if (@x=0)
begin
	insert into product_brand values (0,'')
end

select @x=count(*) from product_buying_group where id=0
if (@x=0)
begin
	insert into product_buying_group values (0,'')
end
";
      
$stmt = sqlsrv_query($conn, $sqltext);  
    
    if ( $stmt === false)  
        {
        print $sqltext."<br/>";
	    print_r( sqlsrv_errors() );
        print "<br/>";
        }
   
 
  
sqlsrv_close( $conn );


echo "<br/>Done";

?>
