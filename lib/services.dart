export "src/services/auth.dart";
export "src/services/database.dart";
export "src/services/service.dart";

import "src/services/service.dart";
import "src/services/auth.dart";
import "src/services/firebase.dart";

class Services extends Service{
  final firebase = FirebaseService();
  final auth = AuthService();


  @override
  Future<void> init() async {
    await firebase.init();
    await auth.init();
  }

  @override
  Future<void> dispose() async {
    await firebase.dispose();
    await auth.dispose();
  }
}

final services = Services();
