import 'package:test_ecommerce/model/product.dart';

abstract class SearchState {}

class SearchStart implements SearchState {}

class SearchLoading implements SearchState {}

class SearchSuccess implements SearchState {
  final List<Product> list;

  SearchSuccess(this.list);
}

class SearchError implements SearchState {}
