import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/demo_text_style.dart';

class ProductParentPage extends StatefulWidget {
  const ProductParentPage({super.key});

  @override
  State<ProductParentPage> createState() => _ProductParentPageState();
}

class _ProductParentPageState extends State<ProductParentPage> {
  String totalProduct = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          child: Column(
            children: [
              _buildParentHeader(size.height * 0.2),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductChildCard(
                        voidCallBack: appendToProduct,
                        name: "Shoes",
                      ),
                      ProductChildCard(
                        voidCallBack: appendToProduct,
                        name: "Shirt",
                      ),
                      ProductChildCard(
                        voidCallBack: appendToProduct,
                        name: "Pants",
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildParentHeader(double height) {
    return Card(
      elevation: 10,
      child: Container(
        color: Colors.black,
        width: double.infinity,
        height: height,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(totalProduct,
                style:
                    DemoTextStyle.copyWith(color: Colors.white, fontSize: 14)),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Products",
              style: DemoTextStyle.copyWith(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text("Parent Widget",
                style:
                    DemoTextStyle.copyWith(color: Colors.white, fontSize: 14))
          ],
        ),
      ),
    );
  }

  void appendToProduct(String string) {
    setState(() {
      if (totalProduct.isNotEmpty) {
        // Add a comma if the product string is not empty
        totalProduct += ", ";
      }
      totalProduct += string;
    });
  }
}

class ProductChildCard extends StatelessWidget {
  final Function(String) voidCallBack;
  final String name;
  const ProductChildCard(
      {super.key, required this.voidCallBack, required this.name});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 10,
      child: Container(
        width: size.width,
        height: 200,
        color: Colors.blue,
        child: Column(
          children: [
            Text(
              name,
              style: DemoTextStyle.copyWith(color: Colors.black, fontSize: 30),
            ),
            ElevatedButton(
                onPressed: () {
                  voidCallBack(name);
                },
                child: Text("Add")),
            Text(
              "Child Widget",
              style: DemoTextStyle.copyWith(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
