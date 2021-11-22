import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_ecommerce/domain/error/error.dart';
import 'package:test_ecommerce/infra/datasource/get_product_datasorce.dart';
import 'package:test_ecommerce/infra/repository/get_product_repository.dart';
import 'package:test_ecommerce/model/product.dart';

class GetProductRepositoryMock extends Mock implements GetProductDatasource {}

main() {
  final datasource = GetProductRepositoryMock();
  final repository = GetProductRepositoryImpl(datasource);

  test('Deve retornar uma lista de produtos', () async {
    when(datasource.getProduct(any)).thenAnswer((_) async => <Product>[]);

    final result = await repository.getProduct('Banana');

    expect(result | null, isA<List<Product>>());
  });

  test('Deve retornar um DatasourceError', () async {
    when(datasource.getProduct(any)).thenThrow(DatasourceError());

    final result = await repository.getProduct('Banana');

    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
