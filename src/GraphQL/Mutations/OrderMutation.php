<?php

namespace App\GraphQL\Mutations;

use App\Services\OrderService;
use App\GraphQL\Types\OrderItemInputType;
use GraphQL\Type\Definition\Type;

class OrderMutation
{
    public static function get(): array
    {
        return [
            'placeOrder' => [
                'type' => Type::boolean(),
                'args' => [
                    'items' => [
                        'type' => Type::listOf(new OrderItemInputType())
                    ]
                ],
                'resolve' => function ($root, $args) {
                    $service = new OrderService();
                    return $service->placeOrder($args['items']);
                }
            ]
        ];
    }
}
