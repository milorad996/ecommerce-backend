<?php

namespace App\GraphQL\Types;

use App\Models\AttributeItem;
use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;


class AttributeType extends ObjectType
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'Attribute',
            'fields' => [
                'id' => Type::string(),
                'name' => Type::string(),
                'type' => Type::string(),
                'items' => [
                    'type' => Type::listOf(new AttributeItemType()),
                    'resolve' => function ($attribute) {
                        $attributeItemModel = new AttributeItem();
                        return $attributeItemModel->getItemsByAttributeId($attribute['id']);
                    }
                ],
            ],
        ]);
    }
}
