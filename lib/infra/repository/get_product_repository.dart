import 'package:test_ecommerce/domain/error/error.dart';
import 'package:dartz/dartz.dart';
import 'package:test_ecommerce/domain/repository/get_product_repository.dart';
import 'package:test_ecommerce/infra/datasource/get_product_datasorce.dart';
import 'package:test_ecommerce/model/product.dart';

class GetProductRepositoryImpl implements GetProductRepository {
  final GetProductDatasource datasource;

  GetProductRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Product>>> getProduct(String nameProduct) async {
    try {
      final result = await datasource.getProduct(nameProduct);
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError(e));
    }
  }
}
