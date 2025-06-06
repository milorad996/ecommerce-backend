<?php


namespace App\Models\Core;

use App\Database;
use mysqli;

abstract class Model
{
    protected mysqli $conn;

    public function __construct()
    {
        $db = new Database();
        $this->conn = $db->connect();
    }
}
