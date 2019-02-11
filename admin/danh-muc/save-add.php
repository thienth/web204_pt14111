<?php
require_once '../../helpers/common.php';
require_once '../../helpers/db.php';
session_start();

// check login
if($_SESSION['auth'] == null || $_SESSION['auth']['role'] == 1){
    header('location: ../../login/cp-login.php');
}

// thu thap data
$name = $_POST['name'];
$short_desc = $_POST['short_desc'];
$image = $_FILES['image'];
$filename = "uploads/default-img.png";

// validate du lieu
$err = false;
if(strlen($name) == 0){
    $err = true;
    $nameerr = "Vui lòng nhập giá trị cho tên danh mục";
} else if(strlen($name) > 255){
    $err = true;
    $nameerr = "Số lượng ký tự không vượt quá 255";
}

$allowed =  ['gif','png' ,'jpg', 'jpeg'];
$oriName = $image['name'];
$ext = pathinfo($oriName, PATHINFO_EXTENSION);
if($image['size'] > 0 || !in_array($ext,$allowed) ) {
    $err = true;
    $imgerr = "Vui lòng chọn đúng định dạng file (gif, png, jpg, jpeg)";
}

// khong bi loi
if($err == false){

    // Luu anh
    if($image['size'] > 0){
        $filename = "uploads/category/" . uniqid() . "-" . $image['name'];
        move_uploaded_file($image['tmp_name'], '../../public/'. $filename);
    }

    // sinh ra cau sql tu du lieu da xu ly
    $sqlQuery = "insert into categories (name, short_desc, image) 
    values ('$name', '$short_desc', '$filename')";
    executeQuery($sqlQuery, false);

    header("location: ../danh-muc");
    die;
}

header("location: ./add.php?nameerr=$nameerr&imgerr=$imgerr");






?>