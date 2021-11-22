import 'package:dartz/dartz.dart';
import 'package:test_ecommerce/domain/error/error.dart';
import 'package:test_ecommerce/model/product.dart';

abstract class GetProductRepository {
  Future<Either<Failure, List<Product>>> getProduct(String nameProduct);
}
