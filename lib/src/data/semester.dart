import "package:meta/meta.dart";

import "utils.dart";

/// The seasons in a year when courses are held.
enum Season {
  /// The Spring semester.
  spring,

  /// The Summer semester.
  summer,

  /// The Fall semester.
  fall,

  /// The Winter semester.
  winter;

  /// Chooses the right type from a JSON value.
  static Season fromJson(String json) => values.byName(json);

  /// Converts this type to JSON.
  String toJson() => name;
}

/// A semester when a course or section is held.
@immutable
class Semester {
  /// What season this semester is in.
  final Season season;

  /// What year this semester is in.
  final int year;

  /// Creates a semester from a given year and season.
  const Semester({required this.season, required this.year});

  /// Creates a semester from a JSON string.
  Semester.fromJson(Json json) :
    season = Season.fromJson(json["season"]),
    year = json["year"];

  @override
  String toString() => "$season of $year";

  @override
  bool operator ==(Object other) => other is Semester
    && toString() == other.toString();

  @override
  int get hashCode => Object.hash(year, season);

  /// Converts this type to JSON.
  String toJson() => "${season.name}-$year";
}
