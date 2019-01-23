<?php
require_once "../helpers/db.php";

$pro_id = $_GET['pro_id'];
$star = $_GET['star'];
$name = $_GET['name'];
$email = $_GET['email'];
$review = $_GET['review'];

$saveCommentQuery = "insert into " . COMMENT_TABLE
                    . " (pro_id, name, email, star, content)"
                    . " values "
                    . " ('$pro_id', '$name', '$email', '$star', '$review')";
executeQuery($saveCommentQuery, false);

header('location: ../chi-tiet/san-pham.php?id=' . $pro_id);


?>