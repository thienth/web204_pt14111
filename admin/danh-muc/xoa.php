<?php
require_once '../../helpers/common.php';
require_once '../../helpers/db.php';
session_start();

if($_SESSION['auth'] == null || $_SESSION['auth']['role'] == 1){
    header('location: ../../login/cp-login.php');
}

$cateId = $_GET['id'];

// kiem tra xem id san pham co ton tai that hay khong
$sqlQuery = "select * from categories where id = $cateId";
$cate = executeQuery($sqlQuery, false);

if($cate != false){
    // xóa sản phẩm có cate_id = $cateId
    $sqlRemoveProducts = "delete from products where cate_id = $cateId";
    executeQuery($sqlRemoveProducts, false);

    // Xóa danh mục có id tương ứng
    $sqlRemoveCate = "delete from categories where id = $cateId";
    executeQuery($sqlRemoveCate, false);
}

header("location: ../danh-muc");



?>