<?php

namespace App\Models;

use App\Interfaces\BaseRepositoryInterface;
use App\Models\Core\Model;

class Attribute extends Model implements BaseRepositoryInterface
{
    public function getAll(): array
    {
        $result = $this->conn->query("SELECT * FROM attributes");

        $data = [];
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }

        return $data;
    }

    public function getAttributesByProductId(string $productId): array
    {
        $stmt = $this->conn->prepare("
        SELECT *
        FROM attributes
        WHERE product_id = ?
    ");

        $stmt->bind_param('s', $productId);
        $stmt->execute();
        $result = $stmt->get_result();

        $data = [];
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }

        return $data;
    }
}
