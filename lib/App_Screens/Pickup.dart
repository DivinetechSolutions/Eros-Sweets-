import 'package:flutter/material.dart';

import 'Home_Page.dart';
// Ensure the correct import path

void main() {
  runApp(MaterialApp(home: PickupScreen()));
}

class PickupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(), // Replace the default AppBar with CustomAppBar
      body: Column(
        children: [
          // Pickup Location
          Container(
            padding: EdgeInsets.all(15),
            color: Colors.amber[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.store, color: Colors.black54),
                    SizedBox(width: 10),
                    Text("Pickup your order from here"),
                  ],
                ),
                Text("Eros foods pvt. Limited", style: TextStyle(fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {},
                  child: Text("Get Direction", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ),

          // Pickup Slot
          Container(
            padding: EdgeInsets.all(15),
            color: Colors.amber[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.black54),
                    SizedBox(width: 10),
                    Text("Pickup Slot"),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Select", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ),

          // Items Added
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(15),
              children: [
                Card(
                  child: ListTile(
                    title: Text("Aloo Bhujia"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Colors.red,
                          ),
                          child: Text("-"),
                        ),
                        Text("1"),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            backgroundColor: Colors.red,
                          ),
                          child: Text("+"),
                        ),
                      ],
                    ),
                  ),
                ),

                // Coupon Section
                Card(
                  child: ListTile(
                    leading: Icon(Icons.discount, color: Colors.black54),
                    title: Text("COMBO15"),
                    subtitle: Text("Add items worth Rs160 more to use this coupon"),
                    trailing: TextButton(
                      onPressed: () {},
                      child: Text("View more offers"),
                    ),
                  ),
                ),

                // Bill Details
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bill Details", style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        _billRow("Subtotal", "Rs 40"),
                        _billRow("GST", "Rs14.06"),
                        _billRow("Packing Charges", "Rs16.95"),
                        Divider(),
                        _billRow("Grand Total", "Rs92.2", isBold: true),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Pickup Slot Button
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.all(15),
              ),
              child: Text("Select Pickup Slot", style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _billRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
