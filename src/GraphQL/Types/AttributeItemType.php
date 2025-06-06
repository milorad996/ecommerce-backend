<?php

namespace App\GraphQL\Types;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;

class AttributeItemType extends ObjectType
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'AttributeItem',
            'fields' => [
                'id' => Type::string(),
                'attribute_id' => Type::string(),
                'value' => Type::string(),
                'display_value' => Type::string(),
            ],
        ]);
    }
}
