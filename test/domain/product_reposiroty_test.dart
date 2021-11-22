import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_ecommerce/domain/error/error.dart';
import 'package:test_ecommerce/domain/repository/get_product_repository.dart';
import 'package:test_ecommerce/domain/usecase/product_repository.dart';
import 'package:test_ecommerce/model/product.dart';

class ProductRepositoryMock extends Mock implements GetProductRepository {}

main() {
  final repository = ProductRepositoryMock();

  final usecase = GetProductsImpl(repository);

  test('Deve retornar uma lista de produtos', () async {
    when(repository.getProduct(any))
        .thenAnswer((_) async => const Right(<Product>[]));

    final result = await usecase('Banana');

    expect(result | null, isA<List<Product>>());
  });

  test('Deve retornar um erro', () async {
    when(repository.getProduct(any))
        .thenAnswer((_) async => const Right(<Product>[]));

    final result = await usecase(null);

    expect(result.fold(id, id), isA<Failure>());
  });
}
