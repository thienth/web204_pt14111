<?php
require_once "./helpers/db.php";
function getCategories($id = null, $name = null){
    $getAll = true;
    if($id != null){
        $sqlQuery = "select * from " . CATEGORY_TABLE . 
                    " where id = $id";
        $getAll = false; 
    }else if($name != null){
        $sqlQuery = "select * from " . CATEGORY_TABLE . 
                    " where name like $name";
    }else{
        $sqlQuery = "select * from " . CATEGORY_TABLE;
    }
    
    $result = executeQuery($sqlQuery, true);
    return $result;
}

?>