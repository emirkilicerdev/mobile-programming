import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
          backgroundColor: Colors.purple,
        ),
        body: const ProductPage(),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

final List<Product> products = [
  Product(name: 'Ürün 1', price: 100),
  Product(name: 'Ürün 2', price: 150),
  Product(name: 'Ürün 3', price: 200),
  Product(name: 'Ürün 4', price: 250),
  Product(name: 'Ürün 5', price: 300),
];

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int? selectedProductIndex;

  void updateSelectedProduct(int index) {
    setState(() {
      selectedProductIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductsList(
          onProductSelected: updateSelectedProduct,
        ),
        ProductsGrid(
          selectedProductIndex: selectedProductIndex,
        ),
      ],
    );
  }
}

class ProductsList extends StatelessWidget {
  final void Function(int) onProductSelected;

  const ProductsList({super.key, required this.onProductSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => onProductSelected(index),
            child: Container(
              width: 120,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    products[index].name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('${products[index].price} TL'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductsGrid extends StatelessWidget {
  final int? selectedProductIndex;

  const ProductsGrid({super.key, this.selectedProductIndex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              color: selectedProductIndex == index ? Colors.purple : Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(products[index].name),
                const SizedBox(height: 10),
                Text('${products[index].price} TL'),
              ],
            ),
          );
        },
      ),
    );
  }
}
