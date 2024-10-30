class UserModel {
  String? email;
  int? id;

  UserModel({
   this.email,
   this.id,

  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'id': id,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      id: json['id'],
    );
  }
}


