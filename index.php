<?php

session_start();

require 'config.php';

spl_autoload_register(function ($class) {

    if (file_exists('controllers'.DS.$class.'.php')) {
    	require_once 'controllers'.DS.$class.'.php';
    } elseif (file_exists('models'.DS.$class.'.php')) {
    	require_once 'models'.DS.$class.'.php';
    } elseif (file_exists('core'.DS.$class.'.php')) {
    	require_once 'core'.DS.$class.'.php';
    }
    
});

$core = new Core();
$core->run();
?>