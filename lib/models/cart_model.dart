import 'package:flutter/widgets.dart';
import 'package:h_p_library/models/book_model.dart';

class CartModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<Book> _books = [];

  /// List of books in the cart.
  List<Book> get books => _books;

  /// The current total price of all items.
  int get totalPrice => books.fold(
      0, (previousValue, current) => previousValue + (current.price ?? 0));

  set increaseAmount(Book book) {
    book.amount++;
    notifyListeners();
  }

  set decreaseAmount(Book book) {
    book.amount--;
    notifyListeners();
  }

  void add(Book book) {
    _books.add(book);
    notifyListeners();
  }

  void remove(Book book) {
    _books.remove(book);
    notifyListeners();
  }
}
