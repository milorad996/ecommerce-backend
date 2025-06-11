<?php

namespace App;

use mysqli;

class Database
{
    private $host;
    private $user;
    private $password;
    private $dbName;
    private $connection;

    public function __construct()
    {
        $this->host = $_ENV['DB_HOST'];
        $this->user = $_ENV['DB_USER'];
        $this->password = $_ENV['DB_PASS'];
        $this->dbName = $_ENV['DB_NAME'];
    }

    public function connect()
    {

        $this->connection = new mysqli($this->host, $this->user, $this->password, $this->dbName);

        if ($this->connection->connect_error) {
            die("Connection failed: " . $this->connection->connect_error);
        }

        return $this->connection;
    }
}
