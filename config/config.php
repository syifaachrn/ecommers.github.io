<?php
session_start();
require('database.php');

$uri        = explode('/', $_SERVER['REQUEST_URI']);

$base_url = "http://localhost/ecommers/";

$default_controller = 'dashboard';
$controller         = ($uri[2]) ? $uri[2] : $default_controller;
$aksi               = (isset($uri[3])) ? $uri[3] : 'index';
?>