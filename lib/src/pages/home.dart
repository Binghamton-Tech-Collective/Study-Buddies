import "package:flutter/material.dart";

import "package:study_buddies/view_models.dart";
import "package:study_buddies/widgets.dart";

/// The home page.
class HomePage extends ReactiveWidget<HomeModel> {
  @override
  HomeModel createModel() => HomeModel(20);

  @override
  Widget build(BuildContext context, HomeModel model) => Scaffold(
    appBar: AppBar(title: const Text("Counter")),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You have pressed the button this many times",
            style: context.textTheme.headlineLarge,
          ),
          Text(
            model.count.toString(),
            style: context.textTheme.headlineSmall,
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: model.increment,
      child: const Icon(Icons.add),
    ),
  );
}
