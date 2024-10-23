import "utils.dart";
import "chat.dart";

extension type CourseId(String value) {}

class Course {
  final String department;
  final int courseNumber;
  final String subject;
  Chat chat;

  Course({
	required this.department,
	required this.courseNumber,
	required this.subject,
  required this.chat,
  });

  Course.fromJson(Json json) :
	department = json["department"],
	courseNumber = json["courseNumber"],
	subject = json["subject"],
	chat = json["chat"];

  Json toJson() => {
	"department": department,
	"courseNumber": courseNumber,
	"subject": subject,
	"chat": chat.toJson(),
  };
}
