import "course.dart";
import "utils.dart";

/// Represents information about a normal user.
class UserProfile {
  /// The user's name.
  final String name;

  /// The user's current courses.
  final Set<CourseID> currentCourses;

  /// The user's past courses.
  final Set<CourseID> pastCourses;

  /// The user's current school year
  final SchoolYear year;

  /// Creates a seller's profile.
  const UserProfile({
    required this.name,
    required this.currentCourses,
    required this.pastCourses,
    required this.year,
  });

  /// Creates a new UserProfile object from a JSON object.
  UserProfile.fromJson(Json json) :
    name = json["name"],
    currentCourses = [
      for (final courseJson in json["currentCourses"])
        Course.fromJson(courseJson),
    ],
    pastCourses = [
      for (final courseJson in json["currentCourses"])
        Course.fromJson(courseJson),
    ],
    year = SchoolYear.fromJson(json["year"]);

  /// Convert this UserProfile to its JSON representation
  Json toJson() => {
    "name": name,
    "currentCourses": [
      for (final currentCourse in currentCourses)
        currentCourse.toJson(),
    ],
    "pastCourses": [
      for (final pastCourse in pastCourses)
        pastCourse.toJson(),
    ],
    "year": year.toJson(),
  };
}

/// A year in school
enum SchoolYear {
  freshman(id: 0),
  sophomore(id: 1),
  junior(id: 2),
  senior(id: 3),
  graduate(id: 4),
  faculty(id: 5);

  /// Stores the unique ID for this year in school.
  final int id;

  const SchoolYear({
    required this.id,
  });

  /// Gets a year in school from a JSON format.
  factory SchoolYear.fromJson(int id) => values.firstWhere((year) => year.id == id);
  
  /// Converts this year in school to a value you can store in a database.
  int toJson() => id;
}
