class ServiceDetailsModel {
  bool? status;
  String? message;
  int? subscriptionPlan;
  Services? services;
  List<ServicesRating>? servicesRating;

  ServiceDetailsModel(
      {this.status,
        this.message,
        this.subscriptionPlan,
        this.services,
        this.servicesRating});

  ServiceDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    subscriptionPlan = json['subscription_plan'];
    services = json['services'] != null
        ? new Services.fromJson(json['services'])
        : null;
    if (json['services_rating'] != null) {
      servicesRating = <ServicesRating>[];
      json['services_rating'].forEach((v) {
        servicesRating!.add(new ServicesRating.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['subscription_plan'] = this.subscriptionPlan;
    if (this.services != null) {
      data['services'] = this.services!.toJson();
    }
    if (this.servicesRating != null) {
      data['services_rating'] =
          this.servicesRating!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
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

  Services(
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

  Services.fromJson(Map<String, dynamic> json) {
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

class ServicesRating {
  int? id;
  int? serviceBookingId;
  int? userId;
  int? serviceId;
  String? rating;
  String? review;
  String? createdAt;
  String? updatedAt;
  String? daysAgo;
  User? user;

  ServicesRating(
      {this.id,
        this.serviceBookingId,
        this.userId,
        this.serviceId,
        this.rating,
        this.review,
        this.createdAt,
        this.updatedAt,
        this.daysAgo,
        this.user});

  ServicesRating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceBookingId = json['service_booking_id'];
    userId = json['user_id'];
    serviceId = json['service_id'];
    rating = json['rating'];
    review = json['review'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    daysAgo = json['days_ago'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['service_booking_id'] = this.serviceBookingId;
    data['user_id'] = this.userId;
    data['service_id'] = this.serviceId;
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['days_ago'] = this.daysAgo;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;

  User({this.id, this.name});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
