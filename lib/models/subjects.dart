class Subject {
  int id;
  String name;
  String semester;
  String branch;

  Subject({this.id, this.name, this.semester, this.branch});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    semester = json['semester'];
    branch = json['branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['semester'] = this.semester;
    data['branch'] = this.branch;
    return data;
  }
}