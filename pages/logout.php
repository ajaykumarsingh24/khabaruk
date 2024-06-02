<?php session_start();

unset($_SESSION['user_id']);
unset($_SESSION['login_user']);

echo "<script>window.location.href = 'home';</script>";

?>