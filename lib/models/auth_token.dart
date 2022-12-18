class AuthToken {
  Profile? profile;
  Jwt? jwt;
  Null? message;
  String? relayStateQuery;
  bool? succeeded;

  AuthToken(
      {this.profile,
      this.jwt,
      this.message,
      this.relayStateQuery,
      this.succeeded});

  AuthToken.fromJson(Map<String, dynamic> json) {
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    jwt = json['jwt'] != null ? new Jwt.fromJson(json['jwt']) : null;
    message = json['message'];
    relayStateQuery = json['relayStateQuery'];
    succeeded = json['succeeded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    if (this.jwt != null) {
      data['jwt'] = this.jwt!.toJson();
    }
    data['message'] = this.message;
    data['relayStateQuery'] = this.relayStateQuery;
    data['succeeded'] = this.succeeded;
    return data;
  }
}

class Profile {
  int? id;
  String? employeeId;
  String? lastName;
  String? firstName;
  String? email;
  String? role;
  List<int>? emailPreferences;
  String? lastLoginDateTime;

  Profile(
      {this.id,
      this.employeeId,
      this.lastName,
      this.firstName,
      this.email,
      this.role,
      this.emailPreferences,
      this.lastLoginDateTime});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employeeId'];
    lastName = json['lastName'];
    firstName = json['firstName'];
    email = json['email'];
    role = json['role'];
    emailPreferences = json['emailPreferences'].cast<int>();
    lastLoginDateTime = json['lastLoginDateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employeeId'] = this.employeeId;
    data['lastName'] = this.lastName;
    data['firstName'] = this.firstName;
    data['email'] = this.email;
    data['role'] = this.role;
    data['emailPreferences'] = this.emailPreferences;
    data['lastLoginDateTime'] = this.lastLoginDateTime;
    return data;
  }
}

class Jwt {
  String? validTo;
  String? token;

  Jwt({this.validTo, this.token});

  Jwt.fromJson(Map<String, dynamic> json) {
    validTo = json['validTo'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['validTo'] = this.validTo;
    data['token'] = this.token;
    return data;
  }
}