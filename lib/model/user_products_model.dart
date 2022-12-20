class UserProductsModel {
  int? page;
  int? pages;
  List<Products>? products;

  UserProductsModel({this.page, this.pages, this.products});

  UserProductsModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pages = json['pages'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['pages'] = this.pages;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? description;
  String? category;
  String? categoryId;
  int? retailPrice;
  int? wholesalePrice;
  String? containerType;
  int? quantity;
  String? weightUnit;
  int? inStock;
  String? image;
  String? createdAt;
  String? updatedAt;

  Products(
      {this.id,
        this.name,
        this.description,
        this.category,
        this.categoryId,
        this.retailPrice,
        this.wholesalePrice,
        this.containerType,
        this.quantity,
        this.weightUnit,
        this.inStock,
        this.image,
        this.createdAt,
        this.updatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    category = json['category'];
    categoryId = json['categoryId'];
    retailPrice = json['retail_price'];
    wholesalePrice = json['wholesale_price'];
    containerType = json['container_type'];
    quantity = json['quantity'];
    weightUnit = json['weight_unit'];
    inStock = json['in_stock'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['category'] = this.category;
    data['categoryId'] = this.categoryId;
    data['retail_price'] = this.retailPrice;
    data['wholesale_price'] = this.wholesalePrice;
    data['container_type'] = this.containerType;
    data['quantity'] = this.quantity;
    data['weight_unit'] = this.weightUnit;
    data['in_stock'] = this.inStock;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
