import "utils.dart";
import "chat.dart";

extension type CourseId(String value) {}

class Course {
  final String department;
  final int course_number;
  final String subject;
  Chat chat;
 
  Course({
	required this.CRN,
	required this.department
  }) {
	this.chat = Chat()
  };

  Course.fromJson(Json json) :
	this.CRN = json["CRN"],
	this.department = json["department"],
	this.chat = json["chat"]

  Json toJson() => {
	"CRN": this.CRN,
	"department": this.department,
	"chat": this.chat.toJson(),
  };
}
