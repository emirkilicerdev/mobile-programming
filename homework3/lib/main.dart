import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(9, 8, 66, 1),
                  Color.fromRGBO(94, 92, 219, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          title: const Text(
            "Firmalar",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            buildPurpleBox(),
            const SizedBox(height: 10),
            buildSearchBar(),
            const SizedBox(height: 10),
            buildContent(),
          ],
        ),
      ),
    );
  }

  Widget buildPurpleBox() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(9, 8, 66, 1),
            Color.fromRGBO(94, 92, 219, 1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.health_and_safety,
            color: Colors.white,
            size: 30,
          ),
          const Text(
            "Sağlık",
            style: TextStyle(color: Colors.white, 
            fontSize: 24,
            fontWeight: FontWeight.bold),
          ),
          Container(
            width: 30,
            height: 30,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 2.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Firma Ara",
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            prefixIcon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }

  Widget buildContent() {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 50),
          child: Text(
            "İstediğiniz firmada indirim yakalama fırsatı ...",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
