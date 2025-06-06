<?php

namespace App\Models;

use App\Interfaces\OrderRepositoryInterface;
use App\Models\Core\Model;

class OrderItemAttribute extends Model implements OrderRepositoryInterface
{
    public function create(array $data)
    {
        $stmt = $this->conn->prepare("INSERT INTO order_item_attributes (order_item_id, attribute_id, attribute_item_id) VALUES (?, ?, ?)");
        $stmt->bind_param("iss", $data['order_item_id'], $data['attribute_id'], $data['attribute_item_id']);
        $stmt->execute();

        return $this->conn->insert_id;
    }
}
