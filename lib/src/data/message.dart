import "utils.dart";

extension type MessageId(String value) {}

class Message {
  final String id;
  final String content;
  final String author;

  Message({required this.id, required this.content, required this.author});

  Message.fromJson(Json json) :
	id = json["id"],
	content = json["content"],
	author = json["author"]

  Json toJson() => {
	"id": id,
	"content": content,
	"author": author,
  };
}
