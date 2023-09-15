<?php



require_once __DIR__.'/../vendor/autoload.php';

// ini_set('max_execution_time', '0');

use Ripcord\Ripcord;

$username = 'me@gmail.com';

$password = 'password'; 



$db = "odoo-4862125";
$url = 'http://mystore.odoo.com';


$common = ripcord::client($url.'/xmlrpc/2/common');
$uid = $common->authenticate($db, $username, $password, array());

//echo "UID = $uid";
//echo('<br/>');

$models = ripcord::client("$url/xmlrpc/2/object");

?>
