<?php

namespace App\Models;

use App\Interfaces\OrderRepositoryInterface;
use App\Models\Core\Model;

class OrderItem extends Model implements OrderRepositoryInterface
{
    public function create(array $data)
    {
        $stmt = $this->conn->prepare("INSERT INTO order_items (order_id, product_id, quantity) VALUES (?, ?, ?)");
        $stmt->bind_param("isi", $data['order_id'], $data['product_id'], $data['quantity']);
        $stmt->execute();

        return $this->conn->insert_id;
    }
}
