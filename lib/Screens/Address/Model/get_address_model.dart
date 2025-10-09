class GetAddressModel {
  bool? status;
  String? message;
  List<AddressData>? data;

  GetAddressModel({this.status, this.message, this.data});

  GetAddressModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AddressData>[];
      json['data'].forEach((v) {
        data!.add(new AddressData.fromJson(v));
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

class AddressData {
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
  City? city;
  State? state;
  Country? country;

  AddressData(
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
        this.deletedAt,
        this.city,
        this.state,
        this.country});

  AddressData.fromJson(Map<String, dynamic> json) {
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
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    state = json['state'] != null ? new State.fromJson(json['state']) : null;
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
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
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    return data;
  }
}

class City {
  int? id;
  String? name;
  int? stateId;

  City({this.id, this.name, this.stateId});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stateId = json['state_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['state_id'] = this.stateId;
    return data;
  }
}

class State {
  int? id;
  String? name;
  int? countryId;

  State({this.id, this.name, this.countryId});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    return data;
  }
}

class Country {
  int? id;
  String? sortname;
  String? name;
  int? phonecode;

  Country({this.id, this.sortname, this.name, this.phonecode});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sortname = json['sortname'];
    name = json['name'];
    phonecode = json['phonecode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sortname'] = this.sortname;
    data['name'] = this.name;
    data['phonecode'] = this.phonecode;
    return data;
  }
}
