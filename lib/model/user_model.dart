class UserModel {
  String? token;
  User? user;
  bool? status;

  UserModel({this.token, this.user, this.status});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? phone;
  String? email;
  Null? emailVerifiedAt;
  Null? address;
  int? role;
  Null? shopeId;
  int? isVerified;
  Null? otp;
  Null? image;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.name,
        this.phone,
        this.email,
        this.emailVerifiedAt,
        this.address,
        this.role,
        this.shopeId,
        this.isVerified,
        this.otp,
        this.image,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    address = json['address'];
    role = json['role'];
    shopeId = json['shope_id'];
    isVerified = json['is_verified'];
    otp = json['otp'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['address'] = this.address;
    data['role'] = this.role;
    data['shope_id'] = this.shopeId;
    data['is_verified'] = this.isVerified;
    data['otp'] = this.otp;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

