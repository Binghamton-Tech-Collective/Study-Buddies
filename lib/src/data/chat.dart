import "utils.dart";

class Chat {
  List<String> messages;
  Map<String, String> members;
 
  Chat({});

  Foo.fromJson(Json json) :
	messages = json["messages"],
	members = json["members"]

  Json toJson() => {
	"messages": messages,
	"members": members
  };
}
