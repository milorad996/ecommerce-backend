<?php

namespace App\GraphQL\Types;

use GraphQL\Type\Definition\InputObjectType;
use GraphQL\Type\Definition\Type;

class AttributeInputType extends InputObjectType
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'AttributeInput',
            'fields' => [
                'attribute_id' => Type::nonNull(Type::string()),
                'attribute_item_id' => Type::nonNull(Type::string()),
            ],
        ]);
    }
}
