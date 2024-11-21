import "utils.dart";

extension type TutorID(String value) {}
extension type CourseID(String value) {}

enum AppointmentType {
  oneOnOne("one-on-one"),
  virtual("virtual"),
  group("group");

  final String jsonName;
  const AppointmentType(this.jsonName);

  String toJson() => jsonName;
  static AppointmentType fromJson(String name) =>
    values.firstWhere((value) => value.jsonName == name);
}

class TutorAvailability {
  final TutorID tutorId;
  final String department;
  final Set<CourseID> availableCourses;
  final String tutorName;
  final AppointmentType appointmentType;
  final DateTime appointmentDateTime;
  final int? maxStudents;
  final String location;
  final String tutorContact;
  final String? note;

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

  TutorAvailability.fromJson(Json json) :
    tutorId = TutorID(json["tutorId"]),
    department = json["department"],
    availableCourses = Set<CourseID>.from(json["availableCourses"]),
    tutorName = json["tutorName"],
    appointmentType = AppointmentType.fromJson(json["appointmentType"]),
    appointmentDateTime = DateTime.parse(json["appointmentDateTime"]),
    maxStudents = json["maxStudents"],
    location = json["location"],
    tutorContact = json["tutorContact"],
    note = json["note"];

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
