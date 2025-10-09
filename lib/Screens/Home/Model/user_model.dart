class UserModel {
  bool? status;
  String? message;
  Data? data;

  UserModel({this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? profilePhoto;
  String? mobile;
  String? email;
  String? emailVerifiedAt;
  String? fcmToken;
  String? role;
  String? stateId;
  String? cityId;
  String? vehicleName;
  String? vehicleNumber;
  String? vehicleModel;
  String? vehicleYear;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? subscriptionPlanId;
  String? membershipExpiresAt;
  String? state;
  String? city;
  String? membershipDaysLeft;

  Data(
      {this.id,
        this.name,
        this.profilePhoto,
        this.mobile,
        this.email,
        this.emailVerifiedAt,
        this.fcmToken,
        this.role,
        this.stateId,
        this.cityId,
        this.vehicleName,
        this.vehicleNumber,
        this.vehicleModel,
        this.vehicleYear,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.subscriptionPlanId,
        this.membershipExpiresAt,
        this.state,
        this.city,
        this.membershipDaysLeft});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profilePhoto = json['profile_photo'];
    mobile = json['mobile'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    fcmToken = json['fcm_token'];
    role = json['role'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    vehicleName = json['vehicle_name'];
    vehicleNumber = json['vehicle_number'];
    vehicleModel = json['vehicle_model'];
    vehicleYear = json['vehicle_year'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    subscriptionPlanId = json['subscription_plan_id'];
    membershipExpiresAt = json['membership_expires_at'];
    state = json['state'];
    city = json['city'];
    membershipDaysLeft = json['membership_days_left'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['profile_photo'] = this.profilePhoto;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['fcm_token'] = this.fcmToken;
    data['role'] = this.role;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['vehicle_name'] = this.vehicleName;
    data['vehicle_number'] = this.vehicleNumber;
    data['vehicle_model'] = this.vehicleModel;
    data['vehicle_year'] = this.vehicleYear;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['subscription_plan_id'] = this.subscriptionPlanId;
    data['membership_expires_at'] = this.membershipExpiresAt;
    data['state'] = this.state;
    data['city'] = this.city;
    data['membership_days_left'] = this.membershipDaysLeft;
    return data;
  }
}
