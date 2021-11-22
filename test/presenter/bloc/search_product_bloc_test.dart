import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_ecommerce/domain/error/error.dart';
import 'package:test_ecommerce/domain/usecase/product_repository.dart';
import 'package:test_ecommerce/model/product.dart';
import 'package:test_ecommerce/presenter/bloc/search_product_bloc.dart';
import 'package:test_ecommerce/presenter/states/state.dart';

class SearchProductMock extends Mock implements GetProductsImpl {}

main() {
  final usecase = SearchProductMock();
  final bloc = SearchProductBloc(usecase);

  test('deve retornar os estados na ordem correta', () async {
    when(usecase.call(any)).thenAnswer((_) async => const Right(<Product>[]));

    expect(
        bloc,
        emitsInOrder([
          isA<SearchLoading>(),
          isA<SearchSuccess>(),
        ]));
    bloc.add('Banana');
  });
}
