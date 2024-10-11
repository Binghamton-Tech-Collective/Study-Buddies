import "utils.dart";
import "chat.dart";

extension type CourseId(String value) {}

class Course {
  final String department;
  final int course_number;
  final String subject;
  Chat chat;

  Course({
	required this.department,
	required this.course_number,
	required this.subject,
  }) : chat = Chat();

  Course.fromJson(Json json) :
	this.department = json["department"],
	this.course_number = json["course_number"],
	this.subject = json["subject"],
	this.chat = json["chat"];

  Json toJson() => {
	"department": this.department,
	"course_number": this.course_number,
	"subject": this.subject,
	"chat": this.chat.toJson(),
  };
}
