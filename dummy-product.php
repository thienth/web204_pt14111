<?php
$products = [
    [
        'Hig-Rise Skinny Jean', 
        rand(1, 7), 
        'assets/img/products/prod-1-1.jpg', 
        'assets/img/products/prod-1-4.jpg', 
        rand(100, 999), 
        rand(100, 999), 
        rand(0, 1)
    ],
    [
        'Waxed-effect pleated skirt', 
        rand(1, 7), 
        'assets/img/products/prod-2-1.jpg', 
        'assets/img/products/prod-2-4.jpg', 
        rand(100, 999), 
        rand(100, 999), 
        rand(0, 1)
    ],
    [
        'Check blazer', 
        rand(1, 7), 
        'assets/img/products/prod-3-1.jpg', 
        'assets/img/products/prod-3-4.jpg', 
        rand(100, 999), 
        rand(100, 999), 
        rand(0, 1)
    ],
    [
        'Linen-Blend Pinstriped Culottes', 
        rand(1, 7), 
        'assets/img/products/prod-4-1.jpg', 
        'assets/img/products/prod-4-4.jpg', 
        rand(100, 999), 
        rand(100, 999), 
        rand(0, 1)
    ],
    [
        'Super skinny trousers', 
        rand(1, 7), 
        'assets/img/products/prod-5-1.jpg', 
        'assets/img/products/prod-5-4.jpg', 
        rand(100, 999), 
        rand(100, 999), 
        rand(0, 1)
    ],
    [
        'Ruffled polka dot blouse', 
        rand(1, 7), 
        'assets/img/products/prod-6-1.jpg', 
        'assets/img/products/prod-6-4.jpg', 
        rand(100, 999), 
        rand(0, 1)
    ],
    [
        'Limited edition v-neck t-shirt', 
        rand(1, 7), 
        'assets/img/products/prod-7-1.jpg', 
        'assets/img/products/prod-7-4.jpg', 
        rand(100, 999), 
        rand(100, 999), 
        rand(0, 1)
    ],
    [
        'Chain print bermuda shorts', 
        rand(1, 7), 
        'assets/img/products/prod-8-1.jpg', 
        'assets/img/products/prod-8-4.jpg', 
        rand(100, 999), 
        rand(100, 999), 
        rand(0, 1)
    ],
    [
        'Check blazer', 
        rand(1, 7), 
        'assets/img/products/prod-9-1.jpg', 
        'assets/img/products/prod-9-4.jpg', 
        rand(100, 999), 
        rand(100, 999), 
        rand(0, 1)
    ],
    [
        'Hig-Rise Skinny Jean', 
        rand(1, 7), 
        'assets/img/products/prod-10-1.jpg', 
        'assets/img/products/prod-10-4.jpg', 
        rand(100, 999), 
        rand(100, 999), 
        rand(0, 1)
    ]
];

$conn = new PDO("mysql:host=127.0.0.1;dbname=web204;charset=utf8", "root", "123456");
foreach($products as $p){
    $sql = "insert into products 
            (name, cate_id, image, image2, sell_price, ori_price, in_stock)
            values
            ('$p[0]','$p[1]','$p[2]','$p[3]','$p[4]','$p[5]','$p[6]')";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
}

echo "done";

?>