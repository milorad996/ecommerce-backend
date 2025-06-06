<?php

namespace App\Models;

use App\Models\Core\Model;
use App\Interfaces\Creatable;
use App\Interfaces\OrderRepositoryInterface;

class Order extends Model implements OrderRepositoryInterface
{
    public function create(array $data)
    {
        $stmt = $this->conn->prepare("INSERT INTO orders (created_at) VALUES (?)");
        $createdAt = date('Y-m-d H:i:s');
        $stmt->bind_param("s", $createdAt);
        $stmt->execute();
        return $this->conn->insert_id;
    }
}
