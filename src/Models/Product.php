<?php


namespace App\Models;

use App\Interfaces\BaseRepositoryInterface;
use App\Models\Core\Model;

class Product extends Model implements BaseRepositoryInterface
{
    public function getAll(): array
    {

        if (!$this->conn) {
            throw new \RuntimeException("Database connection not established");
        }

        $result = $this->conn->query("SELECT * FROM products");

        if (!$result) {
            throw new \RuntimeException("Database query failed: " . $this->conn->error);
        }

        $data = [];
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }


        return $data;
    }
}
