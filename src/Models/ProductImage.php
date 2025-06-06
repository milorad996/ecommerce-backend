<?php


namespace App\Models;

use App\Models\Core\Model;

class ProductImage extends Model
{
    public function getByProductId(string $productId): array
    {
        $stmt = $this->conn->prepare("SELECT * FROM product_images WHERE product_id = ?");
        $stmt->bind_param("s", $productId);
        $stmt->execute();
        $result = $stmt->get_result();

        $images = [];
        while ($row = $result->fetch_assoc()) {
            $images[] = $row;
        }

        return $images;
    }
}
