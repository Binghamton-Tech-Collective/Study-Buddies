import "utils.dart";

extension type TutorID(String value) {}

class TutorAvailability {
  final TutorID tutorId;
  final String department;
  final List<String> availableCourses;
  final String tutorName;
  final String appointmentType;
  final DateTime appointmentDate;
  final String appointmentTime;
  final int maxStudents;
  final String location;
  final String tutorContact;
  final String? note;

  TutorAvailability({
    required this.tutorId,
    required this.department,
    required this.availableCourses,
    required this.tutorName,
    required this.appointmentType,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.maxStudents,
    required this.location,
    required this.tutorContact,
    this.note,
  });

  TutorAvailability.fromJson(Json json)
      : tutorId = TutorID(json["tutorId"]),
        department = json["department"],
        availableCourses = json["availableCourses"]?.cast<String>() ?? [],
        tutorName = json["tutorName"],
        appointmentType = json["appointmentType"],
        appointmentDate = DateTime.parse(json["appointmentDate"]),
        appointmentTime = json["appointmentTime"],
        maxStudents = json["maxStudents"],
        location = json["location"],
        tutorContact = json["tutorContact"],
        note = json["note"];

  Json toJson() => {
        "tutorId": tutorId.value,
        "department": department,
        "availableCourses": availableCourses,
        "tutorName": tutorName,
        "appointmentType": appointmentType,
        "appointmentDate": appointmentDate,
        "appointmentTime": appointmentTime,
        "maxStudents": maxStudents,
        "location": location,
        "tutorContact": tutorContact,
        "note": note,
      };
}
