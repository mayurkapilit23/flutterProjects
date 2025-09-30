class Products {
    Products({
        required this.status,
        required this.message,
        required this.products,
    });

    final String? status;
    final String? message;
    final List<Product> products;

    factory Products.fromJson(Map<String, dynamic> json){ 
        return Products(
            status: json["status"],
            message: json["message"],
            products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
        );
    }

}

class Product {
    Product({
        required this.id,
        required this.title,
        required this.image,
        required this.price,
        required this.description,
        required this.brand,
        required this.model,
        required this.color,
        required this.category,
        required this.discount,
        required this.popular,
        required this.onSale,
    });

    final int? id;
    final String? title;
    final String? image;
    final int? price;
    final String? description;
    final String? brand;
    final String? model;
    final String? color;
    final String? category;
    final int? discount;
    final bool? popular;
    final bool? onSale;

    factory Product.fromJson(Map<String, dynamic> json){ 
        return Product(
            id: json["id"],
            title: json["title"],
            image: json["image"],
            price: json["price"],
            description: json["description"],
            brand: json["brand"],
            model: json["model"],
            color: json["color"],
            category: json["category"],
            discount: json["discount"],
            popular: json["popular"],
            onSale: json["onSale"],
        );
    }

}
