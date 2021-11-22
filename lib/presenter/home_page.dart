import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_ecommerce/presenter/bloc/search_product_bloc.dart';
import 'package:test_ecommerce/presenter/shopping_cart_page.dart';
import 'package:test_ecommerce/presenter/states/state.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = Modular.get<SearchProductBloc>();

  final productController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[700],
          actions: [
            GestureDetector(
              child: const Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShoppingCartPage(),
                  ),
                );
              },
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
          child: ListView(
            children: <Widget>[
              _textFormField("Product", controller: productController),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                stream: bloc,
                builder: (context, snapshot) {
                  final state = bloc.state;

                  if (state is SearchStart) {
                    return const Center(
                      child: Text("Digite um texto"),
                    );
                  }

                  if (state is SearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  List list = (state as SearchSuccess).list;

                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(list[index]),
                              ),
                            );
                          },
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage(list[index].pathImage),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Center(
                                  child: Text(list[index].name),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _textFormField(
    String label, {
    TextEditingController controller,
  }) {
    return TextFormField(
      onChanged: bloc.add,
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        labelText: label,
      ),
    );
  }
}
