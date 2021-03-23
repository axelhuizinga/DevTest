<?php

set_include_path(get_include_path().PATH_SEPARATOR.__DIR__.'/lib');

spl_autoload_register(
	function($class){
		$file = stream_resolve_include_path(str_replace('\\', '/', $class) .'.php');
		if ($file) {
			include_once $file;
		}
	}
);
if (php_sapi_name() == "cli") {
    // In cli-mode
        echo("server start\r\n");
} else {
    // Not in cli-mode
}

include('S.php');
\S::main();
