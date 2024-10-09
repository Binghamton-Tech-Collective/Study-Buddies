import "utils.dart";

/// A course
class Course {
  /// Course id
  int id;

  /// Gets a course from a JSON format.
  Course.fromJson(Json json) :
    id = json["id"];
  
  /// Converts this year in school to a value you can store in a database.
  Json toJson() => {
    "id": id,
  };
}
