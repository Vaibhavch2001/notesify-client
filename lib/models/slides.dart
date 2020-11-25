class Slide {
  int id;
  String name;
  String link;
  int subjectId;

  Slide({this.id, this.name, this.link, this.subjectId});

  Slide.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    link = json['link'];
    subjectId = json['SubjectId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['link'] = this.link;
    data['SubjectId'] = this.subjectId;
    return data;
  }
}