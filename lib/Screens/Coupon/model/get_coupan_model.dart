class GetCouponModel {
  bool? status;
  String? message;
  List<Coupons>? coupons;

  GetCouponModel({this.status, this.message, this.coupons});

  GetCouponModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['coupons'] != null) {
      coupons = <Coupons>[];
      json['coupons'].forEach((v) {
        coupons!.add(new Coupons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.coupons != null) {
      data['coupons'] = this.coupons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Coupons {
  int? id;
  String? couponName;
  String? description;
  String? discountAmount;
  String? couponType;
  String? expiryDate;
  List<String>? applicableServices;
  String? minimumAmount;
  String? status;
  String? couponCode;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Coupons(
      {this.id,
        this.couponName,
        this.description,
        this.discountAmount,
        this.couponType,
        this.expiryDate,
        this.applicableServices,
        this.minimumAmount,
        this.status,
        this.couponCode,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  Coupons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    couponName = json['coupon_name'];
    description = json['description'];
    discountAmount = json['discount_amount'];
    couponType = json['coupon_type'];
    expiryDate = json['expiry_date'];
    applicableServices = json['applicable_services'].cast<String>();
    minimumAmount = json['minimum_amount'];
    status = json['status'];
    couponCode = json['coupon_code'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['coupon_name'] = this.couponName;
    data['description'] = this.description;
    data['discount_amount'] = this.discountAmount;
    data['coupon_type'] = this.couponType;
    data['expiry_date'] = this.expiryDate;
    data['applicable_services'] = this.applicableServices;
    data['minimum_amount'] = this.minimumAmount;
    data['status'] = this.status;
    data['coupon_code'] = this.couponCode;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
