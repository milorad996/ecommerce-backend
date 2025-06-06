<?php


namespace App\Models;

use App\Interfaces\BaseRepositoryInterface;
use App\Models\Core\Model;

class Product extends Model implements BaseRepositoryInterface
{
    public function getAll(): array
    {
        $result = $this->conn->query("SELECT * FROM products");

        $data = [];
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }

        return $data;
    }
}
