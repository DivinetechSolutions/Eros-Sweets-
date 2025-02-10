import 'package:flutter/material.dart';

void main() {
  runApp(PickupScreen());
}

class PickupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Sheetal Park, Rajkot"),
        actions: [
          Icon(Icons.person),
          SizedBox(width: 10),
          Icon(Icons.search),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          // Delivery & Pickup Toggle
          Container(
            color: Colors.amber,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: Text("Delivery", style: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {},
                    child: Text("Pickup", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),

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
                Text("Eros foods pvt.Limited", style: TextStyle(fontWeight: FontWeight.bold)),
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
