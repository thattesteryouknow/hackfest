<?php
// Database configuration
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "eco_parali";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Collect form data with error handling
    $user_type = isset($_POST['user_type']) ? $_POST['user_type'] : '';
    $name = isset($_POST['name']) ? $_POST['name'] : '';
    $mobile = isset($_POST['mobile']) ? $_POST['mobile'] : '';
    $password = isset($_POST['password']) ? password_hash($_POST['password'], PASSWORD_BCRYPT) : '';
    $location = isset($_POST['location']) ? $_POST['location'] : '';

    // Validate required fields
    if ($user_type && $name && $mobile && $password && $location) {
        if ($user_type === 'farmer') {
            $agricultural_land = isset($_POST['agricultural_land']) ? $_POST['agricultural_land'] : '';
            $amount = isset($_POST['amount']) ? $_POST['amount'] : '';
            $duration = isset($_POST['duration']) ? $_POST['duration'] : '';

            // Validate farmer-specific fields
            if ($agricultural_land && $amount && $duration) {
                // Prepare and bind
                $stmt = $conn->prepare("INSERT INTO farmers (name, agricultural_land, amount, location, mobile, password, duration) VALUES (?, ?, ?, ?, ?, ?, ?)");
                $stmt->bind_param("ssdssss", $name, $agricultural_land, $amount, $location, $mobile, $password, $duration);

                // Execute the prepared statement
                if ($stmt->execute()) {
                    echo "Farmer registration successful!";
                } else {
                    echo "Error: " . $stmt->error;
                }
                $stmt->close();
            } else {
                echo "Error: Missing farmer-specific fields.";
                exit;
            }
        } elseif ($user_type === 'company') {
            $company_name = isset($_POST['company_name']) ? $_POST['company_name'] : '';
            $about = isset($_POST['about']) ? $_POST['about'] : '';
            $region = isset($_POST['region']) ? $_POST['region'] : '';
            $buy_sell = isset($_POST['buy_sell']) ? $_POST['buy_sell'] : '';
            $product_type_buy = isset($_POST['product_type_buy']) ? $_POST['product_type_buy'] : null;
            $product_name = isset($_POST['product_name']) ? $_POST['product_name'] : null;
            $product_description = isset($_POST['product_description']) ? $_POST['product_description'] : null;
            $quantity = isset($_POST['quantity']) ? $_POST['quantity'] : null;
            $price = isset($_POST['price']) ? $_POST['price'] : null;
            $company_location = isset($_POST['company_location']) ? $_POST['company_location'] : null;

            // Validate company-specific fields
            if ($company_name && $about && $region && $buy_sell) {
                // Prepare and bind
                $stmt = $conn->prepare("INSERT INTO companies (company_name, mobile, password, about, region, buy_sell, product_type_buy, product_name, product_description, quantity, price, company_location) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
                $stmt->bind_param("sssssssssdss", $company_name, $mobile, $password, $about, $region, $buy_sell, $product_type_buy, $product_name, $product_description, $quantity, $price, $company_location);

                // Execute the prepared statement
                if ($stmt->execute()) {
                    echo "Company registration successful!";
                } else {
                    echo "Error: " . $stmt->error;
                }
                $stmt->close();
            } else {
                echo "Error: Missing company-specific fields.";
                exit;
            }
        } else {
            echo "Error: Invalid user type.";
            exit;
        }
    } else {
        echo "Error: Missing required fields.";
    }
} else {
    echo "Error: Invalid request method.";
}

$conn->close();
?>
