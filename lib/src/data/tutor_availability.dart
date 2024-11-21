import "utils.dart";

/// A unique identifier for a Tutor.
extension type TutorID(String value) {}

///A unique identifier for a Course
extension type CourseID(String value) {}

///Types of appointments available
enum AppointmentType {
  ///One-on-One Meeting
  oneOnOne("one-on-one"),

  ///Virtual Meeting
  virtual("virtual"),

  ///Group Meetings
  group("group");

  /// The JSON representation of the appointment type.
  final String jsonName;

  const AppointmentType(this.jsonName);

  /// Converts the appointment type to its JSON representation.
  String toJson() => jsonName;

  /// Creates an AppointmentType from a JSON string.
  static AppointmentType fromJson(String name) =>
      values.firstWhere((value) => value.jsonName == name);
}

/// Represents a tutor's availability for appointments.
class TutorAvailability {
  /// The unique identifier of the tutor.
  final TutorID tutorId;

  /// The department to which the tutor belongs.
  final String department;

  /// Courses the tutor is available to teach.
  final Set<CourseID> availableCourses;

  /// The tutor's name.
  final String tutorName;

  /// The type of appointment.
  final AppointmentType appointmentType;

  /// The date and time of the appointment.
  final DateTime appointmentDateTime;

  /// The maximum number of students for the appointment.
  final int? maxStudents;

  /// The location of the appointment.
  final String location;

  /// Contact information for the tutor.
  final String tutorContact;

  /// Additional notes about the appointment.
  final String? note;

  /// Constructor for TutorAvailability.
  TutorAvailability({
    required this.tutorId,
    required this.department,
    required this.availableCourses,
    required this.tutorName,
    required this.appointmentType,
    required this.appointmentDateTime,
    required this.maxStudents,
    required this.location,
    required this.tutorContact,
    this.note,
  });

  /// Creates an instance of [TutorAvailability] from a JSON map.
  TutorAvailability.fromJson(Json json)
      : tutorId = TutorID(json["tutorId"]),
        department = json["department"],
        availableCourses = Set<CourseID>.from(json["availableCourses"]),
        tutorName = json["tutorName"],
        appointmentType = AppointmentType.fromJson(json["appointmentType"]),
        appointmentDateTime = DateTime.parse(json["appointmentDateTime"]),
        maxStudents = json["maxStudents"],
        location = json["location"],
        tutorContact = json["tutorContact"],
        note = json["note"];

  /// Converts the [TutorAvailability] instance to a JSON map.
  Json toJson() => {
        "tutorId": tutorId.value,
        "department": department,
        "availableCourses": availableCourses.toList(),
        "tutorName": tutorName,
        "appointmentType": appointmentType.toJson(),
        "appointmentDateTime": appointmentDateTime,
        "maxStudents": maxStudents,
        "location": location,
        "tutorContact": tutorContact,
        "note": note,
      };
}
