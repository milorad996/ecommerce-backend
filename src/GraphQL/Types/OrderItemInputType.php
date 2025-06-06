<?php

namespace App\GraphQL\Types;

use GraphQL\Type\Definition\InputObjectType;
use GraphQL\Type\Definition\Type;
use App\GraphQL\Types\AttributeInputType;

class OrderItemInputType extends InputObjectType
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'OrderItemInput',
            'fields' => function () {
                return [
                    'product_id' => Type::nonNull(Type::string()),
                    'quantity' => Type::nonNull(Type::int()),
                    'attributes' => Type::listOf(new AttributeInputType()),
                ];
            },
        ]);
    }
}
