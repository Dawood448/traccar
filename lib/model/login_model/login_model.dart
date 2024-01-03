class LoginModel {
  bool? status;
  String? message;
  String? token;
  String? cookieData;
  User? user;
  int? userRole;
  bool? isLogin;

  LoginModel(
      {this.status,
        this.message,
        this.token,
        this.cookieData,
        this.user,
        this.userRole, this.isLogin});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    cookieData = json['cookieData'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    userRole = json['user_role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
    data['cookieData'] = this.cookieData;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['user_role'] = this.userRole;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? phone;
  String? timeZone;
  String? profilePic;
  String? lastName;
  String? firstName;
  String? email;
  String? customerSubscriptionId;
  String? customerStripeId;
  int? userCredits;
  int? userRole;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? verificationToken;
  String? userSubscription;
  bool? isVerify;

  User(
      {this.id,
        this.name,
        this.phone,
        this.timeZone,
        this.profilePic,
        this.lastName,
        this.firstName,
        this.email,
        this.customerSubscriptionId,
        this.customerStripeId,
        this.userCredits,
        this.userRole,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.verificationToken,
        this.userSubscription,
        this.isVerify});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    timeZone = json['time_zone'];
    profilePic = json['profile_pic'];
    lastName = json['last_name'];
    firstName = json['first_name'];
    email = json['email'];
    customerSubscriptionId = json['customer_subscription_id'];
    customerStripeId = json['customer_stripe_id'];
    userCredits = json['user_credits'];
    userRole = json['user_role'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    verificationToken = json['verification_token'];
    userSubscription = json['user_subscription'];
    isVerify = json['is_verify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['time_zone'] = this.timeZone;
    data['profile_pic'] = this.profilePic;
    data['last_name'] = this.lastName;
    data['first_name'] = this.firstName;
    data['email'] = this.email;
    data['customer_subscription_id'] = this.customerSubscriptionId;
    data['customer_stripe_id'] = this.customerStripeId;
    data['user_credits'] = this.userCredits;
    data['user_role'] = this.userRole;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['verification_token'] = this.verificationToken;
    data['user_subscription'] = this.userSubscription;
    data['is_verify'] = this.isVerify;
    return data;
  }
}
