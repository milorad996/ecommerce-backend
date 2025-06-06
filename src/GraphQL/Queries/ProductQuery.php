<?php


namespace App\GraphQL\Queries;

use App\GraphQL\Types\ProductType;
use App\Models\Product;
use GraphQL\Type\Definition\Type;

class ProductQuery
{
    public static function get()
    {
        return [
            'type' => Type::listOf(new ProductType()),
            'resolve' => function () {
                $productModel = new Product();
                return $productModel->getAll();
            }
        ];
    }
}
