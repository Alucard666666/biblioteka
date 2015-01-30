<?php

return new \Phalcon\Config(array(
    'database' => array(
        'adapter'     => 'Mysql',
        'host'        => 'localhost',
        'username'    => 'root',
        'password'    => '',
        'dbname'      => 'biblioteka',

    ),
	'application' => array(
	    'controllersDir' => __DIR__ . '/../../app/controllers/',
	    'modelsDir'      => __DIR__ . '/../../app/models/',
	    'viewsDir'       => __DIR__ . '/../../app/views/',
	    'pluginsDir'     => __DIR__ . '/../../app/plugins/',
	    'libraryDir'     => __DIR__ . '/../../app/library/',
	    'cacheDir'       => __DIR__ . '/../../app/cache/',
	    'logDir'         => __DIR__ . '/../../app/logs/',
	    'baseUri'        => '/',
	),
    'version' => array(
        'system_version' => '1.0.0-dev'
    ),
    'email' => array(
        'emailFrom' => 'localhost@biblioteka.pl',
        'emailName' => 'no-reply'
    )
));
