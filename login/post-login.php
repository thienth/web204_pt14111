<?php
require_once "../helpers/db.php";
session_start();

// Thu thập data từ form
$email = $_POST['email'];
$password = $_POST['password'];

// Dựa vào email để lấy ra tài khoản trong csdl
$sqlQuery = "select * from users where email = '$email'";
$user = executeQuery($sqlQuery, false);
// var_dump($sqlQuery);die;
// So sánh 2 mật khẩu (mk từ form và mk trong db)
if(!$user || !password_verify($password, $user['password'])){
    header('location: ./cp-login.php?msg=Sai thông tin tài khoản');
    die;
}

// tạo session và điều hướng về trang quản trị
$_SESSION['auth'] = $user;

if($user['role'] == 1){
    header('location: ./index.php');
    die;
}

header('location: ../admin/index.php');



// echo password_hash('secret', PASSWORD_DEFAULT);



?>