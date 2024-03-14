// To parse this JSON data, do
//
//     final shoe = shoeFromJson(jsonString);

import 'dart:convert';

List<Shoe> shoeFromJson(String str) => List<Shoe>.from(json.decode(str).map((x) => Shoe.fromJson(x)));

String shoeToJson(List<Shoe> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Shoe {
    final String id;
    final String name;
    final Category category;
    final List<String> imageUrl;
    final String oldPrice;
    final List<Size> sizes;
    final String price;
    final String description;
    final String title;

    Shoe({
        required this.id,
        required this.name,
        required this.category,
        required this.imageUrl,
        required this.oldPrice,
        required this.sizes,
        required this.price,
        required this.description,
        required this.title,
    });

    factory Shoe.fromJson(Map<String, dynamic> json) => Shoe(
        id: json["id"],
        name: json["name"],
        category: categoryValues.map[json["category"]]!,
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
        oldPrice: json["oldPrice"],
        sizes: List<Size>.from(json["sizes"].map((x) => Size.fromJson(x))),
        price: json["price"],
        description: json["description"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": categoryValues.reverse[category],
        "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
        "oldPrice": oldPrice,
        "sizes": List<dynamic>.from(sizes.map((x) => x.toJson())),
        "price": price,
        "description": description,
        "title": title,
    };
}

enum Category {
    KIDS_RUNNING,
    MEN_S_RUNNING
}

final categoryValues = EnumValues({
    "Kids' Running": Category.KIDS_RUNNING,
    "Men's Running": Category.MEN_S_RUNNING
});

class Size {
    final String size;
    final bool isSelected;

    Size({
        required this.size,
        required this.isSelected,
    });

    factory Size.fromJson(Map<String, dynamic> json) => Size(
        size: json["size"],
        isSelected: json["isSelected"],
    );

    Map<String, dynamic> toJson() => {
        "size": size,
        "isSelected": isSelected,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
