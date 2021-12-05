class Source {
  Source({this.id, this.name});
  String? id;
  String? name;
  factory Source.fromJson(Map<String, dynamic> data) {
    final id = data['id'] as String?;
    final name = data['name'] as String?;
    return Source(id: id, name: name);
  }
  Map<String, dynamic> toJson(){
    return {
      'id':id, 
      'name': name 
    };
  }
}