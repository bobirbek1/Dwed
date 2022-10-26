class OffersModel {
  int? id;
  String? name;
  String? description;
  Parent? parent;
  String? image;
  bool? hasSubs;

  OffersModel(
      {this.id,
        this.name,
        this.description,
        this.parent,
        this.image,
        this.hasSubs});

  OffersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    parent =
    json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
    image = json['image'];
    hasSubs = json['has_subs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.parent != null) {
      data['parent'] = this.parent!.toJson();
    }
    data['image'] = this.image;
    data['has_subs'] = this.hasSubs;
    return data;
  }
}

class Parent {
  int? id;
  String? name;
  String? description;
  String? parentId;
  String? image;

  Parent({this.id, this.name, this.description, this.parentId, this.image});

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    parentId = json['parent_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['parent_id'] = this.parentId;
    data['image'] = this.image;
    return data;
  }
}
