<?php

namespace App\GraphQL\Types;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;

class PriceType extends ObjectType
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'Price',
            'fields' => [
                'amount' => Type::float(),
                'currency' => [
                    'type' => new CurrencyType(),
                    'resolve' => function ($price) {
                        return [
                            'label' => $price['currency_label'],
                            'symbol' => $price['symbol']
                        ];
                    }
                ],
            ],
        ]);
    }
}
