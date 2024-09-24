import 'utils.dart'; // Assuming this is where your Json type is defined.

class User {
  final String fullName;
  final String id;
  final String bio;
  final String major;
  final String year;
  final String email;
  final List<String> sections;
  final List<String> courses;
  final List<String> friends;
  final int age;

  User({
    required this.fullName,
    required this.id,
    required this.bio,
    required this.major,
    required this.year,
    required this.email,
    required this.sections,
    required this.courses,
    required this.friends,
    required this.age,
  });

  User.fromJson(Map<String, dynamic> json)
      : fullName = json['fullName'],
        id = json['id'],
        bio = json['bio'],
        major = json['major'],
        year = json['year'],
        email = json['email'],
        sections = List<String>.from(json['sections']),
        courses = List<String>.from(json['courses']),
        friends = List<String>.from(json['friends']),
        age = json['age'];

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'id': id,
        'bio': bio,
        'major': major,
        'year': year,
        'email': email,
        'sections': sections,
        'courses': courses,
        'friends': friends,
        'age': age,
      };
}
