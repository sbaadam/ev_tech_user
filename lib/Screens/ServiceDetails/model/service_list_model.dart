class ServiceListModel {
  bool? status;
  String? message;
  int? subscriptionPlan;
  List<ServicesData>? services;
  String? servicesRating;

  ServiceListModel(
      {this.status,
        this.message,
        this.subscriptionPlan,
        this.services,
        this.servicesRating});

  ServiceListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    subscriptionPlan = json['subscription_plan'];
    if (json['services'] != null) {
      services = <ServicesData>[];
      json['services'].forEach((v) {
        services!.add(new ServicesData.fromJson(v));
      });
    }
    servicesRating = json['services_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['subscription_plan'] = this.subscriptionPlan;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    data['services_rating'] = this.servicesRating;
    return data;
  }
}

class ServicesData {
  int? id;
  String? name;
  int? price;
  int? categoriesIds;
  String? image;
  String? banner;
  List<String>? subscriptionPlansIds;
  String? shortDescription;
  String? description;
  String? status;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  ServicesData(
      {this.id,
        this.name,
        this.price,
        this.categoriesIds,
        this.image,
        this.banner,
        this.subscriptionPlansIds,
        this.shortDescription,
        this.description,
        this.status,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  ServicesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    categoriesIds = json['categories_ids'];
    image = json['image'];
    banner = json['banner'];
    subscriptionPlansIds = json['subscription_plans_ids'].cast<String>();
    shortDescription = json['short_description'];
    description = json['description'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['categories_ids'] = this.categoriesIds;
    data['image'] = this.image;
    data['banner'] = this.banner;
    data['subscription_plans_ids'] = this.subscriptionPlansIds;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
