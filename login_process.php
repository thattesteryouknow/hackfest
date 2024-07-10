<?php
// login_process.php
include 'db_connection.php';

$mobile = $_POST['mobile'];
$password = $_POST['password'];
$user_type = $_POST['user_type'];

$conn = OpenCon();

$stmt = $conn->prepare("SELECT password FROM users WHERE mobile = ? AND user_type = ?");
$stmt->bind_param("ss", $mobile, $user_type);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows > 0) {
    $stmt->bind_result($hashed_password);
    $stmt->fetch();
    if (password_verify($password, $hashed_password)) {
        echo "Login successful!";
    } else {
        echo "Invalid password.";
    }
} else {
    echo "No user found with this mobile number.";
}

CloseCon($conn);
?>
