<?php

namespace Portfolio;

// debug for now
ini_set('display_errors',1);
ini_set('display_startup_errors',1);
error_reporting(-1);

require_once( dirname(__DIR__) . '/bootstrap.php' );

$uri = $_SERVER['REQUEST_URI'];
if (strpos($uri, '?') !== false)
  $uri = substr( $uri, 0, strpos($uri, '?') );
$request = array_values(array_filter(explode('/', $uri)));

$db = Db\Connection::createMysqli();

if (!$request)
  new Reports\Home($db);
else if (count($request) >= 3 && $request[0] == 'data' && $request[1] == 'annual')
  new Data\Annual($db, $request[2], array_slice($request, 3));
else if (count($request) == 1 && $request[0] == 'phpinfo')
  phpinfo();
else
  echo 'hello';
