<?php

namespace Portfolio;

// debug for now
ini_set('display_errors',1);
ini_set('display_startup_errors',1);
error_reporting(-1);

require_once( dirname(__DIR__) . '/bootstrap.php' );

$request = array_values(array_filter(explode('/', $_SERVER['REQUEST_URI'])));

$db = Db\Connection::createMysqli();

if (!$request)
  new Reports\Home($db);
else if (count($request) == 1 && $request[0] == 'phpinfo')
  phpinfo();
else
  echo 'hello';
