class UserCreatedQuizCategoryModel {
  int? id;
  String? name;
  String? image;
  int? status;

  ///is added for keeping the value of next_offset for using it for the next time
  int? nextOffset;

  ///is added for using radio buttons
  bool currentValue = false;

  UserCreatedQuizCategoryModel({id, name, image, status});

  UserCreatedQuizCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['status'] = status;
    return data;
  }
}