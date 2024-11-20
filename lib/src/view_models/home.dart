import "view_model.dart";

/// The view model for the home page.
class HomeModel extends ViewModel {
  /// How many times the user pressed the button.
  int count = 0;

  /// Increments [count] and updates the UI.
  void increment() {
    count++;
    notifyListeners();
  }
}
