class ProductModel {
  final String barcodeNumber;
  final String name;
  final String image;

  ProductModel({
    required this.barcodeNumber,
    required this.name,
    required this.image,
  });

  ProductModel copyWith({
    String? barcodeNumber,
    String? name,
    String? image,
  }) {
    return ProductModel(
      barcodeNumber: barcodeNumber ?? this.barcodeNumber,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'barcodeNumber': barcodeNumber,
      'name': name,
      'image': image,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      barcodeNumber: map['barcodeNumber'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
    );
  }

  @override
  String toString() => 'ProductModel(barcodeNumber: $barcodeNumber, name: $name, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.barcodeNumber == barcodeNumber &&
        other.name == name &&
        other.image == image;
  }

  @override
  int get hashCode => barcodeNumber.hashCode ^ name.hashCode ^ image.hashCode;
}
