import 'dart:convert';

LoginResModel loginResModelFromJson(String str) => LoginResModel.fromJson(json.decode(str));

String loginResModelToJson(LoginResModel data) => json.encode(data.toJson());

class LoginResModel {
  final bool? status;
  final String? message;
  final Data? data;
  final String? token;

  LoginResModel({
    this.status,
    this.message,
    this.data,
    this.token,
  });

  factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
    "token": token,
  };
}

class Data {
  final int? id;
  final String? uniqueId;
  final int? roleId;
  final String? name;
  final String? email;
  final dynamic emailVerifiedAt;
  final String? mobile;
  final String? countryCode;
  final dynamic profileImage;
  final dynamic location;
  final dynamic latitude;
  final dynamic longitude;
  final String? status;
  final int? isActive;
  final int? createdBy;
  final int? updatedBy;
  final String? createdAt;
  final String? updatedAt;
  final dynamic webToken;
  final Vendor? vendor;

  Data({
    this.id,
    this.uniqueId,
    this.roleId,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.mobile,
    this.countryCode,
    this.profileImage,
    this.location,
    this.latitude,
    this.longitude,
    this.status,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.webToken,
    this.vendor,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    uniqueId: json["unique_id"],
    roleId: json["role_id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    mobile: json["mobile"],
    countryCode: json["country_code"],
    profileImage: json["profile_image"],
    location: json["location"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    status: json["status"],
    isActive: json["is_active"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    webToken: json["web_token"],
    vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "unique_id": uniqueId,
    "role_id": roleId,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "mobile": mobile,
    "country_code": countryCode,
    "profile_image": profileImage,
    "location": location,
    "latitude": latitude,
    "longitude": longitude,
    "status": status,
    "is_active": isActive,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "web_token": webToken,
    "vendor": vendor?.toJson(),
  };
}

class Vendor {
  final int? id;
  final int? fkUserId;
  final String? businessAddress;
  final String? tradeLicenceNumber;
  final String? vehicleDealersLicence;
  final String? logo;
  final String? tradeLicenceImage;
  final String? dealerLicenceImage;
  final String? vendorStatus;
  final String? isVerified;
  final dynamic remark;
  final int? createdBy;
  final int? updatedBy;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;

  Vendor({
    this.id,
    this.fkUserId,
    this.businessAddress,
    this.tradeLicenceNumber,
    this.vehicleDealersLicence,
    this.logo,
    this.tradeLicenceImage,
    this.dealerLicenceImage,
    this.vendorStatus,
    this.isVerified,
    this.remark,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"],
    fkUserId: json["fk_user_id"],
    businessAddress: json["business_address"],
    tradeLicenceNumber: json["trade_licence_number"],
    vehicleDealersLicence: json["vehicle_dealers_licence"],
    logo: json["logo"],
    tradeLicenceImage: json["trade_licence_image"],
    dealerLicenceImage: json["dealer_licence_image"],
    vendorStatus: json["vendor_status"],
    isVerified: json["is_verified"],
    remark: json["remark"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fk_user_id": fkUserId,
    "business_address": businessAddress,
    "trade_licence_number": tradeLicenceNumber,
    "vehicle_dealers_licence": vehicleDealersLicence,
    "logo": logo,
    "trade_licence_image": tradeLicenceImage,
    "dealer_licence_image": dealerLicenceImage,
    "vendor_status": vendorStatus,
    "is_verified": isVerified,
    "remark": remark,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}
