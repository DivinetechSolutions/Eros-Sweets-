/*
import 'package:flutter/material.dart';

import 'App_Screens/Empty_Cart.dart';


void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.18),
        child: CustomAppBar(),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.012),
        decoration: BoxDecoration(color: Color(0xFFEFC75B)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, "Home", 0, () {}),
            _buildNavItem(Icons.shopping_cart, "Cart", 1, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            }),
            _buildNavItem(Icons.menu, "Menu", 2, () {}),
            _buildNavItem(Icons.account_balance_wallet_outlined, "Wallet", 3, () {}),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.015),
                SizedBox(
                  height: screenHeight * 0.18,
                  child: PageView(
                    children: List.generate(
                      4,
                          (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.025),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Featured Items", style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold)),
                    Text("1 kg", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                SizedBox(height: screenHeight * 0.012),
                Container(
                  height: screenHeight * 0.28,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(5, (index) => ProductCard()),
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Explore Menu", style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold)),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: screenWidth * 0.02,
                    mainAxisSpacing: screenHeight * 0.01,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red[300],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: screenHeight * 0.015),
                          Image.asset("assets/sweet.png", height: screenHeight * 0.12, fit: BoxFit.cover),
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            child: Text("Namkeen", style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index, VoidCallback onTap) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
        onTap();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(icon, color: isSelected ? Colors.black : Colors.grey),
                if (isSelected)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(label, style: TextStyle(color: Colors.black)),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.45, // Responsive width (adjust as needed)
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 1),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assest/gulab-jamun.png",
                height: 100,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Eggless Fresh Cream Pineapple Cake",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  maxLines: 2, // Prevents overflow
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  "Cheese Cake",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                SizedBox(height: 6),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red[300],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "Bestseller",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "₹1199",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: Colors.black),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.add, color: Colors.black, size: 18),
                      SizedBox(width: 4),
                      Text("Add", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(120);
}

class _CustomAppBarState extends State<CustomAppBar> {
  // Track the selected option: either 'Delivery' or 'Pickup'
  String selectedOption = 'Delivery';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFFF4C55E),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row with location and action icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.black),
                    const SizedBox(width: 5),
                    const Expanded(
                      child: Text(
                        'Sheetal Park, Rajkot',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_drop_down),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Segmented control for Delivery/Pickup
          Container(
            height: 48,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Calculate the width for each segment (half of the available width)
                final segmentWidth = constraints.maxWidth / 2;
                return Stack(
                  children: [
                    // Animated red indicator sliding between the two segments
                    AnimatedAlign(
                      alignment: selectedOption == 'Delivery'
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: Container(
                        width: segmentWidth,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    // Row with the two tapable segments
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedOption = 'Delivery';
                              });
                            },
                            child: Center(
                              child: Text(
                                'Delivery',
                                style: TextStyle(
                                  color: selectedOption == 'Delivery'
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedOption = 'Pickup';
                              });
                            },
                            child: Center(
                              child: Text(
                                'Pickup',
                                style: TextStyle(
                                  color: selectedOption == 'Pickup'
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/
