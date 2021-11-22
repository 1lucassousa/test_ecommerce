import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:test_ecommerce/controller/shopping_cart_controller.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Text('Carrinho'),
        actions: [
          GestureDetector(
            child: const Icon(Icons.save),
            onTap: () async {
              final pdfFile = await generateTable(context);

              await openFile(pdfFile);
            },
          )
        ],
      ),
      body: ShoppingCartController.shoppingCart.isNotEmpty
          ? ListView.builder(
              itemCount: ShoppingCartController.shoppingCart.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(ShoppingCartController
                                  .shoppingCart[index]['product']['pathImage']),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Text(ShoppingCartController.shoppingCart[index]['product']
                          ['name']),
                      Text('Quantidade: ' +
                          ShoppingCartController.shoppingCart[index]['amount']
                              .toString()),
                    ],
                  ),
                );
              },
            )
          : const Center(
              child: Text('Carrinho vazio'),
            ),
    );
  }

  static Future<File> generateTable(BuildContext context) async {
    final pdf = pdfLib.Document();

    final headers = ['Produto', 'Quantidade'];

    final data = ShoppingCartController.shoppingCart
        .map((product) =>
            [product['product']['name'], product['amount'].toString()])
        .toList();

    pdf.addPage(pdfLib.Page(
      build: (context) => pdfLib.Table.fromTextArray(
        headers: headers,
        data: data,
      ),
    ));

    return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    String name,
    pdfLib.Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
