class JobMaster {
  String? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  JobMaster({this.id, this.name, this.createdAt, this.updatedAt});

  JobMaster.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? null;
    name = json['name'] ?? null;
    createdAt = json['created_at'] ?? null;
    updatedAt = json['updated_at'] ?? null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id ?? null;
    data['name'] = this.name ?? null;
    data['created_at'] = this.createdAt ?? null;
    data['updated_at'] = this.updatedAt ?? null;
    return data;
  }
}
