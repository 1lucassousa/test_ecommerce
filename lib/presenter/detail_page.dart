import 'package:flutter/material.dart';
import 'package:test_ecommerce/controller/shopping_cart_controller.dart';
import 'package:test_ecommerce/model/product.dart';

class DetailPage extends StatefulWidget {
  final Product product;

  DetailPage([this.product]);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Text(widget.product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView(
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.product.pathImage),
                    fit: BoxFit.fill),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _textFormField("Quantidade", controller: amountController),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.yellow[700],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                child: const Center(
                  child: Text(
                    "Adicionar ao carrinho",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                onPressed: () {
                  var amount = int.parse(amountController.text);
                  ShoppingCartController.addProductInShoppingCart(
                      widget.product, amount);
                  _alert(context, "Produto adicionado ao carrinho");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _textFormField(
    String label, {
    TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        labelText: label,
      ),
    );
  }

  _alert(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Aviso"),
          content: Text(msg),
          actions: <Widget>[
            TextButton(
              child: const Text("Ok"),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
