<?php

$host = getenv('DB_HOST');
$user = getenv('DB_USER');
$pass = getenv('DB_PASS');
$db   = getenv('DB_NAME');
$port = getenv('DB_PORT');

$conn = new mysqli($host, $user, $pass, $db, $port);

if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode(["error" => "Connection failed: " . $conn->connect_error]);
    exit;
}

header("Access-Control-Allow-Origin: http://localhost:5173");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");

require_once __DIR__ . '/../vendor/autoload.php';

$dispatcher = FastRoute\simpleDispatcher(function (FastRoute\RouteCollector $r) {
    $r->get('/', function () {
        header('Content-Type: application/json');
        echo json_encode(["status" => "Backend is running"]);
        return '';
    });

    $r->post('/graphql', [App\Controller\GraphQL::class, 'handle']);
});

$routeInfo = $dispatcher->dispatch(
    $_SERVER['REQUEST_METHOD'],
    $_SERVER['REQUEST_URI']
);

switch ($routeInfo[0]) {
    case FastRoute\Dispatcher::NOT_FOUND:
        http_response_code(404);
        echo json_encode(["error" => "Not Found"]);
        break;

    case FastRoute\Dispatcher::METHOD_NOT_ALLOWED:
        http_response_code(405);
        echo json_encode(["error" => "Method Not Allowed"]);
        break;

    case FastRoute\Dispatcher::FOUND:
        $handler = $routeInfo[1];
        $vars = $routeInfo[2];
        if (is_array($handler)) {
            $controller = new $handler[0];
            $method = $handler[1];
            echo $controller->$method($vars);
        } else {
            echo $handler($vars);
        }
        break;
}
