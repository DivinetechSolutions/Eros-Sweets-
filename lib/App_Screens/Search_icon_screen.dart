import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: SearchMenuScreen()));
}

class SearchMenuScreen extends StatelessWidget {
  const SearchMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: const Color(0xFFD64658),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Color(0xFFEFC75B)),
                      onPressed: () {
                        Navigator.pop(context); // Navigate back to the previous screen
                      },
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Search Menu",
                      style: TextStyle(
                        color: Color(0xFFEFC75B),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Search for items or more ...",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                "POPULAR SEARCHES",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: List.generate(
                      7,
                          (index) => ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assest/search_screen_icon.png', // Replace with actual image
                            width: 40,
                            height: 40,
                          ),
                        ),
                        title: const Text("Cheese Crackers [100g]"),
                        trailing: const Icon(Icons.trending_up, color: Colors.green),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: Text(
                      "FEATURED ITEMS",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Horizontal Scrollable Cards
                // Horizontal Scrollable Cards with Spacing
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      8,
                          (index) => Padding(
                        padding: const EdgeInsets.only(right: 10), // Space between cards
                        child: _buildCard(),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard() {
    return SizedBox(
      width: 170, // Set width for each card
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                'assest/Search_screen_icon2.jpeg', // Replace with actual image
                fit: BoxFit.cover,
                height: 100,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Chevdo", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),

                  // Horizontal Scrollable Tags
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildTag("250g"),
                        _buildTag("500g"),
                        _buildTag("1Kg"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 2),
                  const Text("Customisable", style: TextStyle(color: Colors.grey)),
                  const Text("Customisable", style: TextStyle(color: Colors.white54)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "₹263",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD64658)),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Background color
                          side: const BorderSide(color: Color(0xFFD64658)), // Border color
                        ),
                        child: const Text(
                          "Add +",
                          style: TextStyle(color: Color(0xFFD64658), fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8AF).withOpacity(0.4),
        border: Border.all(color: const Color(0xFFD64658), width: 1.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Color(0xFFD64658), fontSize: 12),
      ),
    );
  }
}
