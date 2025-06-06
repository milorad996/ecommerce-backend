<?php

namespace App\Models;

use App\Interfaces\BaseRepositoryInterface;
use App\Models\Core\Model;

class AttributeItem extends Model implements BaseRepositoryInterface
{
    public function getAll(): array
    {
        $result = $this->conn->query("SELECT * FROM attribute_items");

        $data = [];
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }

        return $data;
    }

    public function getItemsByAttributeId(string $attributeId): array
    {
        $stmt = $this->conn->prepare("
            SELECT * FROM attribute_items
            WHERE attribute_id = ?
        ");

        $stmt->bind_param('s', $attributeId);
        $stmt->execute();
        $result = $stmt->get_result();

        $data = [];
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }

        return $data;
    }
}
