<?php

namespace App\Models;

use App\Models\Core\Model;

class ProductPrice extends Model
{
    public function getPricesWithCurrencyByProductId(string $productId): array
    {
        $stmt = $this->conn->prepare("
            SELECT 
                p.amount, 
                p.currency_label, 
                c.symbol 
            FROM prices p
            JOIN currencies c ON p.currency_label = c.label
            WHERE p.product_id = ?
        ");
        $stmt->bind_param("s", $productId);
        $stmt->execute();
        $result = $stmt->get_result();

        $prices = [];
        while ($row = $result->fetch_assoc()) {
            $prices[] = $row;
        }

        return $prices;
    }
}
