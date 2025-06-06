<?php

require __DIR__ . '/vendor/autoload.php';

require 'src/Database.php';

use App\Database;

$db = new Database();
$conn = $db->connect();

$sql = file_get_contents('ecommerce.sql');

if ($conn->multi_query($sql)) {
    do {
        if ($result = $conn->store_result()) {
            $result->free();
        }
    } while ($conn->more_results() && $conn->next_result());
    echo "SQL script executed successfully.";
} else {
    echo "Error executing SQL script: " . $conn->error;
}
