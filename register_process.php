<?php
// register_process.php
include 'db_connection.php';

$user_type = $_POST['user_type'];
$mobile = $_POST['mobile'];
$password = password_hash($_POST['password'], PASSWORD_BCRYPT);

// Common fields
$name = $_POST['name'] ?? null;
$location = $_POST['location'] ?? null;

// Farmer specific fields
$agricultural_land = $_POST['agricultural_land'] ?? null;
$amount = $_POST['amount'] ?? null;
$duration = $_POST['duration'] ?? null;

// Company specific fields
$company_name = $_POST['company_name'] ?? null;
$about = $_POST['about'] ?? null;
$region = $_POST['region'] ?? null;
$buy_sell = $_POST['buy_sell'] ?? null;
$product_type_buy = $_POST['product_type_buy'] ?? null;
$product_name = $_POST['product_name'] ?? null;
$product_description = $_POST['product_description'] ?? null;
$quantity = $_POST['quantity'] ?? null;
$price = $_POST['price'] ?? null;
$company_location = $_POST['company_location'] ?? null;

$conn = OpenCon();

$stmt = $conn->prepare("INSERT INTO users (user_type, name, agricultural_land, amount, location, mobile, password, duration, company_name, about, region, buy_sell, product_type_buy, product_name, product_description, quantity, price, company_location) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
$stmt->bind_param("sssdsssdsssssssdss", $user_type, $name, $agricultural_land, $amount, $location, $mobile, $password, $duration, $company_name, $about, $region, $buy_sell, $product_type_buy, $product_name, $product_description, $quantity, $price, $company_location);

if ($stmt->execute()) {
    echo "New record created successfully";
} else {
    echo "Error: " . $stmt->error;
}

CloseCon($conn);
?>
