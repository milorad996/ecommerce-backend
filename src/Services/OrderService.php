<?php

namespace App\Services;

use App\Models\Order;
use App\Interfaces\OrderRepositoryInterface;
use App\Models\OrderItem;
use App\Models\OrderItemAttribute;

class OrderService
{
    public function placeOrder(array $items): bool
    {
        try {
            $orderId = $this->save(new Order(), [
                'created_at' => date('Y-m-d H:i:s'),
            ]);

            if (!$orderId) {
                return false;
            }

            foreach ($items as $item) {

                $orderItem = new OrderItem();
                $orderItemId = $orderItem->create([
                    'order_id' => $orderId,
                    'product_id' => $item['product_id'],
                    'quantity' => $item['quantity']
                ]);

                if (!$orderItemId) {
                    return false;
                }

                $attributes = $item['attributes'] ?? [];
                foreach ($attributes as $attr) {
                    $attrModel = new OrderItemAttribute();
                    $attrModel->create([
                        'order_item_id' => $orderItemId,
                        'attribute_id' => $attr['attribute_id'],
                        'attribute_item_id' => $attr['attribute_item_id'],
                    ]);
                }
            }

            return true;
        } catch (\Exception $e) {
            return false;
        }
    }

    public function save(OrderRepositoryInterface $model, array $data)
    {
        return $model->create($data);
    }
}
