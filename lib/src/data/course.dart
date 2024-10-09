import "utils.dart";
import "chat.dart";

class Course {
  final String department;
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
