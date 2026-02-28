import 'dart:convert';

class UserDetailsModel {
  bool? status;
  String? msg;
  Data? data;
  PaymentGateways? paymentGateways;

  UserDetailsModel({
    this.status,
    this.msg,
    this.data,
    this.paymentGateways,
  });

  factory UserDetailsModel.fromRawJson(String str) => UserDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) => UserDetailsModel(
    status: json["status"],
    msg: json["msg"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    paymentGateways: json["payment_gateways"] == null ? null : PaymentGateways.fromJson(json["payment_gateways"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": data?.toJson(),
    "payment_gateways": paymentGateways?.toJson(),
  };
}

class Data {
  int? id;
  String? name;
  String? audioDownloadList;
  String? email;
  String? artistVerifyStatus;
  DateTime? emailVerifiedAt;
  String? acceptTermAndPolicy;
  String? mobile;
  int? gender;
  int? planId;
  String? purchasedPlanDate;
  String? dob;
  String? image;
  int? status;
  int? role;
  String? address;
  String? billingDetail;
  String? countryId;
  String? stateId;
  String? cityId;
  String? braintreeId;
  String? pincode;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? planExpiryDate;
  int? inAppPurchase;
  PlanDetail? planDetail;
  int? download;
  int? ads;
  String? currencyCode;
  String? currencySymbol;
  String? tax;
  String? adminRzpKey;
  String? adminRzpSecret;
  String? paymentType;
  String? googleApiKey;
  String? ytChannelKey;
  String? ytCountryCode;
  int? isYoutube;
  String? appLanguage;

  Data({
    this.id,
    this.name,
    this.audioDownloadList,
    this.email,
    this.artistVerifyStatus,
    this.emailVerifiedAt,
    this.acceptTermAndPolicy,
    this.mobile,
    this.gender,
    this.planId,
    this.purchasedPlanDate,
    this.dob,
    this.image,
    this.status,
    this.role,
    this.address,
    this.billingDetail,
    this.countryId,
    this.stateId,
    this.cityId,
    this.braintreeId,
    this.pincode,
    this.createdAt,
    this.updatedAt,
    this.planExpiryDate,
    this.inAppPurchase,
    this.planDetail,
    this.download,
    this.ads,
    this.currencyCode,
    this.currencySymbol,
    this.tax,
    this.adminRzpKey,
    this.adminRzpSecret,
    this.paymentType,
    this.googleApiKey,
    this.ytChannelKey,
    this.ytCountryCode,
    this.isYoutube,
    this.appLanguage,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    audioDownloadList: json["audio_download_list"],
    email: json["email"],
    artistVerifyStatus: json["artist_verify_status"],
    emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
    acceptTermAndPolicy: json["accept_term_and_policy"],
    mobile: json["mobile"],
    gender: json["gender"],
    planId: json["plan_id"],
    purchasedPlanDate: json["purchased_plan_date"],
    dob: json["dob"],
    image: json["image"],
    status: json["status"],
    role: json["role"],
    address: json["address"],
    billingDetail: json["billing_detail"],
    countryId: json["country_id"],
    stateId: json["state_id"],
    cityId: json["city_id"],
    braintreeId: json["braintree_id"],
    pincode: json["pincode"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    planExpiryDate: json["plan_expiry_date"],
    inAppPurchase: json["in_app_purchase"],
    planDetail: json["plan_detail"] == null ? null : PlanDetail.fromJson(json["plan_detail"]),
    download: json["download"],
    ads: json["ads"],
    currencyCode: json["currencyCode"],
    currencySymbol: json["currencySymbol"],
    tax: json["tax"],
    adminRzpKey: json["admin_rzp_key"],
    adminRzpSecret: json["admin_rzp_secret"],
    paymentType: json["payment_type"],
    googleApiKey: json["google_api_key"],
    ytChannelKey: json["yt_channel_key"],
    ytCountryCode: json["yt_country_code"],
    isYoutube: json["is_youtube"],
    appLanguage: json["app_language"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "audio_download_list": audioDownloadList,
    "email": email,
    "artist_verify_status": artistVerifyStatus,
    "email_verified_at": emailVerifiedAt?.toIso8601String(),
    "accept_term_and_policy": acceptTermAndPolicy,
    "mobile": mobile,
    "gender": gender,
    "plan_id": planId,
    "purchased_plan_date": purchasedPlanDate,
    "dob": dob,
    "image": image,
    "status": status,
    "role": role,
    "address": address,
    "billing_detail": billingDetail,
    "country_id": countryId,
    "state_id": stateId,
    "city_id": cityId,
    "braintree_id": braintreeId,
    "pincode": pincode,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "plan_expiry_date": planExpiryDate,
    "in_app_purchase": inAppPurchase,
    "plan_detail": planDetail?.toJson(),
    "download": download,
    "ads": ads,
    "currencyCode": currencyCode,
    "currencySymbol": currencySymbol,
    "tax": tax,
    "admin_rzp_key": adminRzpKey,
    "admin_rzp_secret": adminRzpSecret,
    "payment_type": paymentType,
    "google_api_key": googleApiKey,
    "yt_channel_key": ytChannelKey,
    "yt_country_code": ytCountryCode,
    "is_youtube": isYoutube,
    "app_language": appLanguage,
  };
}

class PlanDetail {
  PlanDetail();

  factory PlanDetail.fromRawJson(String str) => PlanDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlanDetail.fromJson(Map<String, dynamic> json) => PlanDetail(
  );

  Map<String, dynamic> toJson() => {
  };
}

class PaymentGateways {
  PlanDetail? razorpay;
  PlanDetail? paypal;
  PlanDetail? stripe;
  PlanDetail? paystack;

  PaymentGateways({
    this.razorpay,
    this.paypal,
    this.stripe,
    this.paystack,
  });

  factory PaymentGateways.fromRawJson(String str) => PaymentGateways.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaymentGateways.fromJson(Map<String, dynamic> json) => PaymentGateways(
    razorpay: json["razorpay"] == null ? null : PlanDetail.fromJson(json["razorpay"]),
    paypal: json["paypal"] == null ? null : PlanDetail.fromJson(json["paypal"]),
    stripe: json["stripe"] == null ? null : PlanDetail.fromJson(json["stripe"]),
    paystack: json["paystack"] == null ? null : PlanDetail.fromJson(json["paystack"]),
  );

  Map<String, dynamic> toJson() => {
    "razorpay": razorpay?.toJson(),
    "paypal": paypal?.toJson(),
    "stripe": stripe?.toJson(),
    "paystack": paystack?.toJson(),
  };
}
