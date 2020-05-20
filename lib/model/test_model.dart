class Students {
  String name;
  int id;
  int score;
  List<Teachers> thachers;
  Students({
    this.name,
    this.id,
    this.score,
    this.thachers
  });
  factory Students.fromJson(Map<String, dynamic> parsedJson) {
    return Students(
      id: parsedJson['id'],
      name: parsedJson['name'],
      score: parsedJson['score'],
      thachers: getTeachers(parsedJson['teachers'])
    );
  }

  static List<Teachers> getTeachers(dynamic list) {
    List<Teachers> teachers = new List();
    list.forEach((f) {
      teachers.add(Teachers.fromJson(f));
    });
    return teachers;
  }
}

class Teachers {
  String name;
  int age;
  Teachers({
    this.name,
    this.age
  });
  factory Teachers.fromJson(Map<String, dynamic> hello) {
    return Teachers(
      age: hello['age'],
      name: hello['name']
    );
  }
}