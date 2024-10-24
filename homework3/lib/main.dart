import 'package:flutter/material.dart';

// The main entry point of the Flutter application
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Builds the MaterialApp widget and defines the home page
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        // The top navigation bar with gradient background
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back), // Back button icon
            color: Colors.white, // Sets the icon color to white
          ),
          flexibleSpace: Container(
            // Adds a gradient to the AppBar background
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(9, 8, 66, 1), // Dark blue color
                  Color.fromRGBO(94, 92, 219, 1), // Light blue color
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          title: const Text(
            "Firmalar", // Sets the title text in the AppBar
            style: TextStyle(
              color: Colors.white, // White color for the title
              fontSize: 15,
            ),
          ),
          centerTitle: true, // Centers the title in the AppBar
        ),
        
        // Main body content of the page
        body: Column(
          children: [
            buildPurpleBox(), // Custom widget for the purple health box
            const SizedBox(height: 10), // Adds vertical spacing
            buildSearchBar(), // Search bar widget
            const SizedBox(height: 10),
            buildText(), // A text description widget
            const SizedBox(height: 10),
            
            // Expanded widget to make ListView take remaining space
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 10), // Adds vertical padding
                children: [
                  buildContent("Firma Adı"), // List item with content
                  const SizedBox(height: 10),
                  buildContent("Firma Adı Uzun Firma Adı Uzun Firma Adı Uzun Firma Adı"),
                  const SizedBox(height: 10),
                  buildContent("Firma Adı"),
                  const SizedBox(height: 10),
                  buildContent("Firma Adı Uzun Firma Adı Uzun Firma Adı Uzun Firma Adı"),
                  const SizedBox(height: 10),
                  buildContent("Firma Adı"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for the purple box at the top
  Widget buildPurpleBox() {
    return Container(
      width: double.infinity, // Makes it stretch to the width of the screen
      margin: const EdgeInsets.all(10.0), // Adds margin around the container
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), // Padding inside the container
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(9, 8, 66, 1), // Gradient starting color
            Color.fromRGBO(94, 92, 219, 1), // Gradient ending color
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Spacing between child widgets
        children: [
          const Icon(
            Icons.health_and_safety, // Icon to represent health
            color: Colors.white, // Icon color
            size: 30,
          ),
          const Text(
            "Sağlık", // Text "Sağlık" in the box
            style: TextStyle(
              color: Colors.white, // White text color
              fontSize: 24,
              fontWeight: FontWeight.bold, // Bold text
            ),
          ),
          Container(
            width: 30, // Empty container to balance layout
            height: 30,
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }

  // Widget for the search bar
  Widget buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adds horizontal padding
      child: Container(
        width: double.infinity, // Makes the container stretch the full width
        decoration: BoxDecoration(
          color: Colors.white, // White background color
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4), // Shadow color with transparency
              blurRadius: 2.0, // Blurring effect of the shadow
              offset: const Offset(0, 4), // Positioning of the shadow
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Firma Ara", // Placeholder text
            fillColor: Colors.white, // Background fill color for the input field
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0), // Rounded border for the text field
              borderSide: BorderSide.none, // No border side
            ),
            prefixIcon: const Icon(Icons.search), // Search icon inside the input field
          ),
        ),
      ),
    );
  }

  // Text description below the search bar
  Widget buildText() {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 50), // Padding around the text
          child: Text(
            "İstediğiniz firmada indirim yakalama fırsatı ...", // Descriptive text
            style: TextStyle(
              color: Colors.grey, // Grey color for the text
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  // Content for each list item, taking a string as a parameter
  Widget buildContent(String name) {
    return Container(
      width: double.infinity, // Full width container
      padding: const EdgeInsets.only(left: 10), // Padding on the left side
      margin: const EdgeInsets.all(10.0), // Margin around the container
      decoration: BoxDecoration(
        color: Colors.white, // White background color
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4), // Shadow color with transparency
            blurRadius: 2.0, // Blurring effect for the shadow
            offset: const Offset(0, 4), // Position of the shadow
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between content and discount box
        crossAxisAlignment: CrossAxisAlignment.center, // Aligns items vertically in the center
        children: [
          const Icon(
            Icons.label_important, // Icon for each list item
            size: 30,
          ),
          Expanded( // Allows text to take up available space
            child: Text(
              name, // Displaying the company name
              softWrap: true, // Ensures text wraps if it's too long
              style: const TextStyle(
                color: Colors.black, // Black text color
                fontSize: 18,
              ),
            ),
          ),
          // Container for the discount percentage with gradient background
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), // Rounded top-right corner
                bottomRight: Radius.circular(10), // Rounded bottom-right corner
              ),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(9, 8, 66, 1), // Dark blue gradient
                  Color.fromRGBO(94, 92, 219, 1), // Lighter blue gradient
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            width: 80, // Width for the discount box
            height: 80, // Height for the discount box
            child: const Center(
              child: Text(
                "%10", // Text for the discount percentage
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Bold text
                  fontSize: 24, // Font size for the discount text
                  color: Colors.white, // White text color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
