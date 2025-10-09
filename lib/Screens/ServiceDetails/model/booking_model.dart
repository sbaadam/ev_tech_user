class BookingModel {
  bool? status;
  String? message;
  List<Data>? data;

  BookingModel({this.status, this.message, this.data});

  BookingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  int? serviceId;
  int? servicePin;
  int? addressId;
  String? latitude;
  String? longitude;
  String? bookingId;
  String? technicianId;
  String? notes;
  String? couponCodeId;
  String? couponAppliedAmount;
  String? date;
  String? time;
  String? cgstAmount;
  String? sgstAmount;
  String? grandTotal;
  String? bookingStatus;
  String? transactionId;
  String? referenceId;
  String? paymentResponse;
  String? createdAt;
  String? updatedAt;
  Service? service;
  Address? address;
  String? technician;

  Data(
      {this.id,
        this.userId,
        this.serviceId,
        this.servicePin,
        this.addressId,
        this.latitude,
        this.longitude,
        this.bookingId,
        this.technicianId,
        this.notes,
        this.couponCodeId,
        this.couponAppliedAmount,
        this.date,
        this.time,
        this.cgstAmount,
        this.sgstAmount,
        this.grandTotal,
        this.bookingStatus,
        this.transactionId,
        this.referenceId,
        this.paymentResponse,
        this.createdAt,
        this.updatedAt,
        this.service,
        this.address,
        this.technician});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    serviceId = json['service_id'];
    servicePin = json['service_pin'];
    addressId = json['address_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    bookingId = json['booking_id'];
    technicianId = json['technician_id'];
    notes = json['notes'];
    couponCodeId = json['coupon_code_id'];
    couponAppliedAmount = json['coupon_applied_amount'];
    date = json['date'];
    time = json['time'];
    cgstAmount = json['cgst_amount'];
    sgstAmount = json['sgst_amount'];
    grandTotal = json['grand_total'];
    bookingStatus = json['booking_status'];
    transactionId = json['transaction_id'];
    referenceId = json['reference_id'];
    paymentResponse = json['payment_response'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    service =
    json['service'] != null ? new Service.fromJson(json['service']) : null;
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    technician = json['technician'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['service_id'] = this.serviceId;
    data['service_pin'] = this.servicePin;
    data['address_id'] = this.addressId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['booking_id'] = this.bookingId;
    data['technician_id'] = this.technicianId;
    data['notes'] = this.notes;
    data['coupon_code_id'] = this.couponCodeId;
    data['coupon_applied_amount'] = this.couponAppliedAmount;
    data['date'] = this.date;
    data['time'] = this.time;
    data['cgst_amount'] = this.cgstAmount;
    data['sgst_amount'] = this.sgstAmount;
    data['grand_total'] = this.grandTotal;
    data['booking_status'] = this.bookingStatus;
    data['transaction_id'] = this.transactionId;
    data['reference_id'] = this.referenceId;
    data['payment_response'] = this.paymentResponse;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['technician'] = this.technician;
    return data;
  }
}

class Service {
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

  Service(
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

  Service.fromJson(Map<String, dynamic> json) {
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

class Address {
  int? id;
  String? name;
  String? mobile;
  int? userId;
  String? address;
  String? cityId;
  String? stateId;
  String? countryId;
  String? pincode;
  String? latitude;
  String? longitude;
  String? addressType;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Address(
      {this.id,
        this.name,
        this.mobile,
        this.userId,
        this.address,
        this.cityId,
        this.stateId,
        this.countryId,
        this.pincode,
        this.latitude,
        this.longitude,
        this.addressType,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    userId = json['user_id'];
    address = json['address'];
    cityId = json['city_id'];
    stateId = json['state_id'];
    countryId = json['country_id'];
    pincode = json['pincode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    addressType = json['address_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['user_id'] = this.userId;
    data['address'] = this.address;
    data['city_id'] = this.cityId;
    data['state_id'] = this.stateId;
    data['country_id'] = this.countryId;
    data['pincode'] = this.pincode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address_type'] = this.addressType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
