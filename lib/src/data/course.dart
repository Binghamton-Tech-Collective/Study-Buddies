import "utils.dart";
import "chat.dart";

extension type CourseID(String value) {}

class Course {
  final CourseID id;
  final String department;
  final int courseNumber;
  final String subject;
  final Chat chat;

  Course({
    required this.id,
    required this.department,
    required this.courseNumber,
    required this.subject,
    required this.chat,
  });

  Course.fromJson(Json json) :
    id = json["id"],
    department = json["department"],
    courseNumber = json["courseNumber"],
    subject = json["subject"],
    chat = json["chat"];

  Json toJson() => {
    "id": id,
    "department": department,
    "courseNumber": courseNumber,
    "subject": subject,
    "chat": chat.toJson(),
  };
}
