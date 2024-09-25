import "view_model.dart";

/// The view model for the home page.
class HomeModel extends ViewModel {
  HomeModel(this.count);

  int count;

  void increment() {
    count++;
    notifyListeners();
  }
}
