//สร้างคลาส Soucre เเละ constructor

class Source {
  String id;
  String name;

  Source({this.id, this.name});

  //สร้าง factory function
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}
