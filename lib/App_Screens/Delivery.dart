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
        backgroundColor: Colors.amber[700],
        title: Text("Sheetal Park, Rajkot", style: TextStyle(color: Colors.black)),
        actions: [
          Icon(Icons.account_circle, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ToggleButtons(
              borderColor: Colors.red,
              fillColor: Colors.red,
              selectedBorderColor: Colors.red,
              selectedColor: Colors.white,
              borderRadius: BorderRadius.circular(8),
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 30), child: Text("Delivery")),
                Padding(padding: EdgeInsets.symmetric(horizontal: 30), child: Text("Pickup")),
              ],
              isSelected: [false, true], // Pickup is selected
              onPressed: (index) {},
            ),
            SizedBox(height: 20),
            PickupInfoCard(),
            SizedBox(height: 20),
            ItemsList(),
            SizedBox(height: 20),
            BillDetails(),
            Spacer(),
            SelectPickupButton(),
          ],
        ),
      ),
    );
  }
}

class PickupInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pickup your order from here", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Text("Eros foods pvt.Limited", style: TextStyle(fontSize: 14)),
          TextButton(onPressed: () {}, child: Text("Get Direction", style: TextStyle(color: Colors.blue))),
          Divider(),
          Text("Pickup Slot", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Text("No Slot Selected", style: TextStyle(fontSize: 14, color: Colors.red)),
          TextButton(onPressed: () {}, child: Text("Select", style: TextStyle(color: Colors.blue))),
        ],
      ),
    );
  }
}

class ItemsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Items Added", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ListTile(
            title: Text("Aloo Bhujia"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: Icon(Icons.remove), onPressed: () {}),
                Text("1"),
                IconButton(icon: Icon(Icons.add), onPressed: () {}),
              ],
            ),
          ),
          TextField(
            decoration: InputDecoration(hintText: "Mention your special instruction here", border: OutlineInputBorder()),
          ),
          SizedBox(height: 10),
          CouponSection(),
        ],
      ),
    );
  }
}

class CouponSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.local_offer, color: Colors.black),
              SizedBox(width: 5),
              Text("COMBO15", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Text("Add items worth Rs160 more to use this coupon"),
          TextButton(onPressed: () {}, child: Text("View more offers", style: TextStyle(color: Colors.blue))),
        ],
      ),
    );
  }
}

class BillDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Bill Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          BillItem(label: "Subtotal", value: "Rs 40"),
          BillItem(label: "GST", value: "Rs14.06"),
          BillItem(label: "Packing Charges", value: "Rs16.95"),
          Divider(),
          BillItem(label: "Grand Total", value: "Rs92.2", isBold: true),
        ],
      ),
    );
  }
}

class BillItem extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  BillItem({required this.label, required this.value, this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}

class SelectPickupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {},
        child: Text("Select Pickup Slot", style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }
}
