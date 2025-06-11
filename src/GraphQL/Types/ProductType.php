<?php


namespace App\GraphQL\Types;

use App\GraphQL\Types\GalleryType;
use App\GraphQL\Types\PriceType;
use App\GraphQL\Types\AttributeType;
use App\Models\Attribute;
use App\Models\ProductImage;
use App\Models\ProductPrice;
use GraphQL\Type\Definition\ObjectType;
use GraphQL\Type\Definition\Type;

class ProductType extends ObjectType
{
    public function __construct()
    {
        parent::__construct([
            'name' => 'Product',
            'fields' => [
                'id' => Type::string(),
                'name' => Type::string(),
                'description' => Type::string(),
                'in_stock' => Type::boolean(),
                'category_id' => Type::int(),
                'brand' => Type::string(),
                'gallery' => [
                    'type' => Type::listOf(new GalleryType()),
                    'resolve' => function ($product) {
                        $imageModel = new ProductImage();
                        return $imageModel->getByProductId($product['id']);
                    }
                ],
                'prices' => [
                    'type' => Type::listOf(new PriceType()),
                    'resolve' => function ($product) {
                        $priceModel = new ProductPrice();
                        return $priceModel->getPricesWithCurrencyByProductId($product['id']);
                    }
                ],
                'attributes' => [
                    'type' => Type::listOf(new AttributeType()),
                    'resolve' => function ($product) {
                        $attributeModel = new Attribute();
                        return $attributeModel->getAttributesByProductId($product['id']);
                    }
                ],
            ],
        ]);
    }
}
