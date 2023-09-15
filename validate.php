<pre>
<?php

/*
Program to do Auto Validate on the warehouses

Point of sale Orders
*/

ini_set('max_execution_time', 0);

include 'odoo_import.inc.php';

$branch = 'OD';

//$fields = array("display_name","scheduled_date","location_id",
//    "move_type","location_dest_id","picking_type_id","state","show_validate");


            
            /*
            stock.picking.type=7, 30 ,20  

    */
            
             
             
             
$me = array(
   array('state','=','assigned'),
   //array('location_id','=',46),
   array('picking_type_id','=',30),  //  W/H POS Orders -Operation Type
   //array('scheduled_date','>','2023-06-30')
   // array('name','=','GV-WH/POS/02117')
    array('show_validate','=',1)
   //array('name','=','GV-WH/POS/07337')
   
);
    
print_r($me);

    
    
$ids = $models->execute_kw($db,$uid,$password,"stock.picking",'search',
    array(
      //  array(
             //'is_company'=>'True'
             $me
      //  )
    ) 
     // ,array('limit'=>5000)
    );
    
print_r($ids);
// die();

//  NOOOO  $models->execute_kw($db, $uid, $password, 'stock.picking', 'write', array(array($ids[0]), array('state'=>"assigned")));

if (!$ids)
    die("No records");


foreach ($ids as $id)
    $models->execute_kw($db, $uid, $password, 'stock.picking',  "button_validate", array(array($id)));



?>
</pre>
