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
  int? cityId;
  String? latitude;
  String? longitude;
  String? bookingId;
  int? technicianId;
  String? notes;
  int? couponCodeId;
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
  List<String>? productIds;
  List<String>? quantities;
  List<String>? amounts;
  String? grandAmount;
  String? descriptionFromTechnician;
  List<String>? images;
  String? technicianStatus;
  String? paymentMode;
  UserSnapshot? userSnapshot;
  ServiceSnapshot? serviceSnapshot;
  AddressSnapshot? addressSnapshot;
  UserSnapshot? technicianSnapshot;
  CouponSnapshot? couponSnapshot;
  List<ProductSnapshot>? productSnapshot;

  Data(
      {this.id,
        this.userId,
        this.serviceId,
        this.servicePin,
        this.addressId,
        this.cityId,
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
        this.productIds,
        this.quantities,
        this.amounts,
        this.grandAmount,
        this.descriptionFromTechnician,
        this.images,
        this.technicianStatus,
        this.paymentMode,
        this.userSnapshot,
        this.serviceSnapshot,
        this.addressSnapshot,
        this.technicianSnapshot,
        this.couponSnapshot,
        this.productSnapshot});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    serviceId = json['service_id'];
    servicePin = json['service_pin'];
    addressId = json['address_id'];
    cityId = json['city_id'];
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
    productIds = json['product_ids'] != null
        ? List<String>.from(json['product_ids'])
        : [];
    quantities = json['quantities'] != null
        ? List<String>.from(json['quantities'])
        : [];
    amounts = json['amounts'] != null
        ? List<String>.from(json['amounts'])
        : [];
    grandAmount = json['grand_amount'];
    descriptionFromTechnician = json['description_from_technician'];
    images = json['images'] != null
        ? List<String>.from(json['images'])
        : [];
    technicianStatus = json['technician_status'];
    paymentMode = json['payment_mode'];
    userSnapshot = json['user_snapshot'] != null
        ? new UserSnapshot.fromJson(json['user_snapshot'])
        : null;
    serviceSnapshot = json['service_snapshot'] != null
        ? new ServiceSnapshot.fromJson(json['service_snapshot'])
        : null;
    addressSnapshot = json['address_snapshot'] != null
        ? new AddressSnapshot.fromJson(json['address_snapshot'])
        : null;
    technicianSnapshot = json['technician_snapshot'] != null
        ? new UserSnapshot.fromJson(json['technician_snapshot'])
        : null;
    couponSnapshot = json['coupon_snapshot'] != null
        ? new CouponSnapshot.fromJson(json['coupon_snapshot'])
        : null;
    if (json['product_snapshot'] != null) {
      productSnapshot = <ProductSnapshot>[];
      json['product_snapshot'].forEach((v) {
        productSnapshot!.add(new ProductSnapshot.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['service_id'] = this.serviceId;
    data['service_pin'] = this.servicePin;
    data['address_id'] = this.addressId;
    data['city_id'] = this.cityId;
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
    data['product_ids'] = this.productIds;
    data['quantities'] = this.quantities;
    data['amounts'] = this.amounts;
    data['grand_amount'] = this.grandAmount;
    data['description_from_technician'] = this.descriptionFromTechnician;
    data['images'] = this.images;
    data['technician_status'] = this.technicianStatus;
    data['payment_mode'] = this.paymentMode;
    if (this.userSnapshot != null) {
      data['user_snapshot'] = this.userSnapshot!.toJson();
    }
    if (this.serviceSnapshot != null) {
      data['service_snapshot'] = this.serviceSnapshot!.toJson();
    }
    if (this.addressSnapshot != null) {
      data['address_snapshot'] = this.addressSnapshot!.toJson();
    }
    if (this.technicianSnapshot != null) {
      data['technician_snapshot'] = this.technicianSnapshot!.toJson();
    }
    if (this.couponSnapshot != null) {
      data['coupon_snapshot'] = this.couponSnapshot!.toJson();
    }
    if (this.productSnapshot != null) {
      data['product_snapshot'] =
          this.productSnapshot!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserSnapshot {
  int? id;
  String? name;
  String? mobile;
  String? email;
  int? subscriptionPlanId;

  UserSnapshot(
      {this.id, this.name, this.mobile, this.email, this.subscriptionPlanId});

  UserSnapshot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    subscriptionPlanId = json['subscription_plan_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['subscription_plan_id'] = this.subscriptionPlanId;
    return data;
  }
}

class ServiceSnapshot {
  int? id;
  String? name;
  String? image;
  int? price;
  String? commission;
  List<String>? subscriptionPlansIds;

  ServiceSnapshot(
      {this.id,
        this.name,
        this.image,
        this.price,
        this.commission,
        this.subscriptionPlansIds});

  ServiceSnapshot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    commission = json['commission'];
    subscriptionPlansIds = json['subscription_plans_ids'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['commission'] = this.commission;
    data['subscription_plans_ids'] = this.subscriptionPlansIds;
    return data;
  }
}

class AddressSnapshot {
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

  AddressSnapshot(
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

  AddressSnapshot.fromJson(Map<String, dynamic> json) {
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

class CouponSnapshot {
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

  CouponSnapshot(
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

  CouponSnapshot.fromJson(Map<String, dynamic> json) {
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

class ProductSnapshot {
  int? id;
  String? name;
  String? amount;

  ProductSnapshot({this.id, this.name, this.amount});

  ProductSnapshot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['amount'] = this.amount;
    return data;
  }
}
