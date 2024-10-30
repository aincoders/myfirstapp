class CrudApiDataModel {
  String? user_name;
  String? user_email;
  String? user_phonenumber;
  String? user_address;

  CrudApiDataModel({
    this.user_name,
    this.user_email,
    this.user_phonenumber,
    this.user_address,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_name': user_name,
      'user_email': user_email,
      'user_phonenumber': user_phonenumber,
      'user_address': user_address,
    };
  }

  factory CrudApiDataModel.fromJson(Map<String, dynamic> json) {
    return CrudApiDataModel(
      user_name: json['user_name'],
      user_email: json['user_email'],
      user_phonenumber: json['user_phonenumber'],
      user_address: json['user_address'],
    );
  }
}
