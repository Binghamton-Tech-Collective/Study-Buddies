import "package:flutter/material.dart";

import "package:study_buddies/models.dart";
import "package:study_buddies/pages.dart";
import "package:study_buddies/services.dart";

Future<void> main() async {
  await services.init();
  await models.init();
  await models.initFromOthers();
  runApp(const StudyBuddiesApp());
}

/// The main app widget.
class StudyBuddiesApp extends StatelessWidget {
  /// A const constructor.
  const StudyBuddiesApp();

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: "Flutter Demo",
    theme: ThemeData(
      useMaterial3: true,
    ),
    routerConfig: router,
  );
}
