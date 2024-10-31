class CrudApiDataModel {
  int? user_id;
  String? user_name;
  String? user_email;
  String? user_phonenumber;

  CrudApiDataModel({
    this.user_id,
    this.user_name,
    this.user_email,
    this.user_phonenumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'user_name': user_name,
      'user_email': user_email,
      'user_phonenumber': user_phonenumber,
    };
  }

  factory CrudApiDataModel.fromJson(Map<String, dynamic> json) {
    return CrudApiDataModel(
      user_id: json['user_id'],
      user_name: json['user_name'],
      user_email: json['user_email'],
      user_phonenumber: json['user_phonenumber'],
    );
  }
}
