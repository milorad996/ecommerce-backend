<?php

namespace App\GraphQL\Types;

use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;

class GalleryType extends ObjectType
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'Gallery',
            'fields' => [
                'id' => Type::int(),
                'product_id' => Type::string(),
                'image_url' => Type::string(),
            ],
        ]);
    }
}
