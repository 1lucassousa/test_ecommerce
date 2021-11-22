import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_ecommerce/app_module.dart';
import 'package:test_ecommerce/datasource/get_products_search_datasource.dart';
import 'package:test_ecommerce/domain/usecase/product_repository.dart';
import 'package:test_ecommerce/infra/repository/get_product_repository.dart';
import 'package:test_ecommerce/presenter/bloc/search_product_bloc.dart';
import 'package:test_ecommerce/presenter/detail_page.dart';
import 'package:test_ecommerce/presenter/home_page.dart';
import 'package:test_ecommerce/presenter/login_page.dart';
import 'package:test_ecommerce/presenter/shopping_cart_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SearchProductBloc(i())),
        Bind((i) => GetProductsImpl(i())),
        Bind((i) => GetProductsSearchDatasource()),
        Bind((i) => GetProductRepositoryImpl(i()))
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => const LoginPage()),
        ModularRouter('/', child: (_, __) => const HomePage()),
        ModularRouter('/', child: (_, __) => DetailPage()),
        ModularRouter('/', child: (_, __) => const ShoppingCartPage()),
      ];
}
