import 'dart:ffi';

class PhotoInfo {
  int? id;
  String? title;
  String? image;
  String? category;


  PhotoInfo({
  this.id,
   this.title,
   this.image,
   this.category,
  });

  PhotoInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    category = json['category'];

  }
  @override
  String toString() {
    return title ?? ''; // Return the title or an empty string if null
  }
}
