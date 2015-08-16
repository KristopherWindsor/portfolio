<?php

namespace Portfolio\Db;

/* This class loads DB configuration from file and creates a DB connection
 */
class Connection {
  public static function createMysqli(){
    $db_file = dirname( dirname( __DIR__ ) ) . '/inc/database.php';
    if (!file_exists($db_file))
      throw new \Exception('No database configuration found');
    require_once $db_file;

    @$mysqli = new \mysqli("$host:$port", $user, $pass, $db);
    if ($mysqli->connect_errno)
      throw new \Exception('Database connection failed, error ' . $mysqli->connect_errno);
    return $mysqli;
  }
}
