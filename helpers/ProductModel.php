<?php
require_once "./helpers/db.php";
function getProduct($id = null, $name = null){
    $getAll = true;
    if($id != null){
        $sqlQuery = "select * " . PRODUCT_TABLE . 
                    " where id = $id";
        $getAll = false; 
    }else if($name != null){
        $sqlQuery = "select * " . PRODUCT_TABLE . 
                    " where name like $name";
    }else{
        $sqlQuery = "select * " . PRODUCT_TABLE;
    }

    $result = executeQuery($sqlQuery, true);
    return $result;
}

?>