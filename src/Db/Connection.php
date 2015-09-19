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

    @$mysqli = new \mysqli($host . ($port ? ":$port" : ''), $user, $pass, $db);
    if ($mysqli->connect_errno)
      throw new \Exception('Database connection failed, error ' . $mysqli->connect_errno);
    return $mysqli;
  }

  // Needs to run without mysqlnd
  public static function fetchAll($stmt){
    $stmt->execute();
    $stmt->store_result();

    $variables = array();
    $data = array();
    $meta = $stmt->result_metadata();

    while($field = $meta->fetch_field())
      $variables[] = &$data[$field->name];

    call_user_func_array(array($stmt, 'bind_result'), $variables);

    $res = array();
    $i = 0;
    while( $stmt->fetch() ){
      $res[$i++] = json_decode(json_encode($data));
    }

    return $res;
  }
}
