<?php
session_start();

if($_SESSION['auth'] == null || $_SESSION['auth']['role'] == 1){
    header('location: ../login.php');
}


var_dump($_SESSION['auth']);

?>