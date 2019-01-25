<?php
require_once '../../helpers/common.php';
require_once '../../helpers/db.php';
session_start();

if($_SESSION['auth'] == null || $_SESSION['auth']['role'] == 1){
    header('location: ../../login/cp-login.php');
}

$keyword = isset($_GET['keyword']) ? $_GET['keyword'] : null;

// lay ra danh sách danh mục
$sqlQuery = "select 
                c.*,
                (select count(*) from products where cate_id = c.id) as total_product
            from categories c";

if ($keyword != null){
    $sqlQuery .= " where name like '%$keyword%'";
}
$cates = executeQuery($sqlQuery, true);

?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <base href="<?= ADM_ASSET_URL ?>">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Blank Page</title>
  <?php include_once "../layouts/style.php" ?>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">
    <!-- Header -->
    <?php include_once "../layouts/header.php" ?>

  <!-- =============================================== -->

  <!-- Left side column. contains the sidebar -->
  <!-- Sidebar -->
  <?php include_once "../layouts/sidebar.php" ?>

  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->

    <!-- Main content -->
    <section class="content">
        
        <div class="box">
            <div class="box-header">
                <h4>Danh sách danh mục</h4>
                <div class="row">
                    <div class="col-md-4">
                        <form method="get">
                            <div class="form-group">
                                <div class="input-group input-group-sm">
                                    <input type="text" 
                                        value="<?= $keyword ?>"    
                                        name="keyword" class="form-control">
                                    <span class="input-group-btn">
                                        <button type="submit" class="btn btn-info btn-flat">Search!</button>
                                    </span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <table class="table table-striped">
                <tbody>
                    <tr>
                        <th style="width: 10px">#</th>
                        <th>Tên danh mục</th>
                        <th>Ảnh </th>
                        <th>Số lượng sp </th>
                        <th>
                            <a href="javascript:;" class="btn btn-xs btn-primary">Thêm</a>
                        </th>
                    </tr>
                    <?php foreach($cates as $key => $c):?>
                    <tr>
                        <td><?= $key+1 ?></td>
                        <td><?= $c['name']?></td>
                        <td>
                            <img src="<?= ASSET_URL . $c['image'] ?>" width="50">
                        </td>
                        <td><?= $c['total_product']?></td>
                        <td>
                            <a href="javascript:;" class="btn btn-xs btn-info">Sửa</a>
                            <a href="javascript:;" class="btn btn-xs btn-danger">Xóa</a>
                        </td>
                    </tr>
                    <?php endforeach?>
                </tbody>
            </table>
        </div>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Footer -->
  <?php include_once "../layouts/footer.php" ?>
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<?php include_once "../layouts/script.php" ?>
</body>
</html>
