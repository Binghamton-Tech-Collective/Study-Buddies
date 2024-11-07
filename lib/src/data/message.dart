import "utils.dart";

extension type MessageId(String value) {}
extension type UserID(String value) {}

class Message {
  final MessageId id;
  final String content;
  final UserID author;
  final DateTime timestamp;

  Message({required this.id, required this.content, required this.author, required this.timestamp});

  Message.fromJson(Json json) :
	id = json["id"],
	content = json["content"],
	author = json["author"],
	timestamp = json["timestamp"];

  Json toJson() => {
	"id": id,
	"content": content,
	"author": author,
	"timestamp": timestamp,
  };
}
