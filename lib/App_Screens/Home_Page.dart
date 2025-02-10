import 'package:flutter/material.dart';
import 'Empty_Cart.dart';
import 'Search_icon_screen.dart';

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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140),
        child: CustomAppBar(),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFFEFC75B),
        ),
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
            _buildNavItem(
                Icons.account_balance_wallet_outlined, "Wallet", 3, () {}),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,
                child: PageView(
                  children: List.generate(
                    4,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius:
                            BorderRadius.circular(20), // Circular border
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Featured Items",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("1 kg", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(5, (index) => ProductCard()),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Explore Menu",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Defines the number of columns in the grid (3 columns in this case).
                  childAspectRatio: 0.8, // Controls the aspect ratio (width/height) of each grid item (0.8 means taller items).
                  crossAxisSpacing: 8, // Sets the horizontal spacing between grid items.
                  mainAxisSpacing: 8, // Sets the vertical spacing between grid items.
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: Colors.red[300],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 10),
                          Image.asset(
                            "assest/sweet.png", // Ensure the correct path
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Namkeen",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // Ensures left alignment
                    children: [
                      Text(
                        "Manufactured by: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Lorem is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book, It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised.",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  )),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      IconData icon, String label, int index, VoidCallback onTap) {
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

    return SizedBox(
      width: screenWidth * 0.45, // Adjust width dynamically
      child: Container(
        padding: EdgeInsets.all(8),
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
          mainAxisSize: MainAxisSize.min, // Prevent overflow
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assest/gulab-jamun.png",
                height: 100,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Eggless Fresh Cream Pineapple Cake",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Text(
                  "Cheese Cake",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Spacer(),
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
            SizedBox(height: 8),
            Row(
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
          ],
        ),
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
                    /*const Icon(Icons.location_on, color: Colors.black),*/
                    const SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Change location',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(height: 5), // Adds spacing between texts
                        Text(
                          'Sheetal Park, Rajkot',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchMenuScreen()),
                        );
                      },
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
