class AuthToken {
  Profile? profile;
  Jwt? jwt;
  String? message;
  String? relayStateQuery;
  bool? succeeded;

  AuthToken(
      {this.profile,
      this.jwt,
      this.message,
      this.relayStateQuery,
      this.succeeded});

  AuthToken.fromJson(Map<String, dynamic> json) {
    profile = json['profile'] != null ? Profile.fromJson(json['profile']) : null;
    jwt = json['jwt'] != null ? Jwt.fromJson(json['jwt']) : null;
    message = json['message'];
    relayStateQuery = json['relayStateQuery'];
    succeeded = json['succeeded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    if (jwt != null) {
      data['jwt'] = jwt!.toJson();
    }
    data['message'] = message;
    data['relayStateQuery'] = relayStateQuery;
    data['succeeded'] = succeeded;
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
    data['id'] = id;
    data['employeeId'] = employeeId;
    data['lastName'] = lastName;
    data['firstName'] = firstName;
    data['email'] = email;
    data['role'] = role;
    data['emailPreferences'] = emailPreferences;
    data['lastLoginDateTime'] = lastLoginDateTime;
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
    data['validTo'] = validTo;
    data['token'] = token;
    return data;
  }
}