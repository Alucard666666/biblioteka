<?php

use Phalcon\DI\FactoryDefault;
use Phalcon\Mvc\View;
use Phalcon\Mvc\Url as UrlResolver;
use Phalcon\Db\Adapter\Pdo\Mysql as DbAdapter;
use Phalcon\Mvc\View\Engine\Volt as VoltEngine;
use Phalcon\Mvc\Model\Metadata\Memory as MetaDataAdapter;
use Phalcon\Session\Adapter\Files as SessionAdapter;
use Phalcon\Mvc\Router as Router;
use Phalcon\Mvc\Dispatcher as Dispatcher;
use Phalcon\Logger,
    Phalcon\Db\Adapter\Pdo\Mysql as Connection,
    Phalcon\Logger\Adapter\File as FileLogger;

use Phalcon\Events\Manager as EventsManager;

/**
 * The FactoryDefault Dependency Injector automatically register the right services providing a full stack framework
 */
$di = new FactoryDefault();

/**
 * The URL component is used to generate all kind of urls in the application
 */
$di->set('url', function () use ($config) {
    $url = new UrlResolver();
    $url->setBaseUri($config->application->baseUri);

    return $url;
}, true);

/**
 * Setting up the view component
 */
$di->set('view', function () use ($config) {

    $view = new View();

    $view->setViewsDir($config->application->viewsDir);

    $view->setLayout('main');

    $view->registerEngines(array(
        '.volt' => function ($view, $di) use ($config) {

            $volt = new VoltEngine($view, $di);

            $volt->setOptions(array(
                'compiledPath' => $config->application->cacheDir,
                'compiledSeparator' => '_'
            ));

            return $volt;
        },
        '.phtml' => 'Phalcon\Mvc\View\Engine\Php'
    ));

    return $view;
}, true);



/**
 * Database connection is created based in the parameters defined in the configuration file
 */
/*$di->set('db', function () use ($config) {
    return new DbAdapter(array(
        'host' => $config->database->host,
        'username' => $config->database->username,
        'password' => $config->database->password,
        'dbname' => $config->database->dbname
    ));
});*/

$di->set('db', function() use ($config) {

    $eventsManager = new EventsManager();

    $logger = new FileLogger($config->application->logDir."/sql.txt");

    //Listen all the database events
    $eventsManager->attach('db', function($event, $connection) use ($logger) {
        if ($event->getType() == 'beforeQuery') {
            $logger->log($connection->getSQLStatement(), Logger::INFO);
        }
    });

    $connection = new Connection(array(
        'host' => $config->database->host,
        'username' => $config->database->username,
        'password' => $config->database->password,
        'dbname' => $config->database->dbname
    ));

    //Assign the eventsManager to the db adapter instance
    $connection->setEventsManager($eventsManager);

    return $connection;
});



/**
 * If the configuration specify the use of metadata adapter use it or use memory otherwise
 */
$di->set('modelsMetadata', function () {
    return new MetaDataAdapter();
});

/**
 * Start the session the first time some component request the session service
 */
$di->set('session', function () {
    $session = new SessionAdapter();
    $session->start();

    return $session;
});

$di->set('email', function() use ($config){
    return	array(
        "emailFrom"=>$config->email->emailFrom,
        "emailName"=>$config->email->emailName
    );

});

$di->set('mail', function(){
    return new PHPMailer();
});



$di->set('dispatcher', function() use ($di) {

        $evManager = new EventsManager;

        $evManager->attach(
            "dispatch:beforeException",
            function($event, $dispatcher, $exception)
            {
                switch ($exception->getCode()) {
                    case Dispatcher::EXCEPTION_HANDLER_NOT_FOUND:
                    case Dispatcher::EXCEPTION_ACTION_NOT_FOUND:
                        $dispatcher->forward(
                            array(
                                'controller' => 'error',
                                'action'     => 'show404',
                            )
                        );
                        return false;
                }
            }
        );

        $evManager->attach('dispatch:beforeDispatch', new AclPlugin);

        $dispatcher = new Dispatcher();
        $dispatcher->setEventsManager($evManager);
        return $dispatcher;
    },
    true
);

$di->set('flash', function(){
    $flash = new \Phalcon\Flash\Direct(
        array(
            'error' => 'alert alert-danger',
            'success' => 'alert alert-success',
            'notice' => 'alert alert-info',
            'warning' => 'alert alert-warning',
        )
    );
    return $flash;
});

new Whoops\Provider\Phalcon\WhoopsServiceProvider($di);