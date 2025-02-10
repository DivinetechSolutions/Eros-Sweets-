import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Choose_City(),
  ));
}

class Choose_City extends StatefulWidget {
  @override
  _Choose_CityState createState() => _Choose_CityState();
}

class _Choose_CityState extends State<Choose_City> {
  final Map<String, List<String>> citiesByAlphabet = {
    'A': ['Agra', 'Ahmedabad', 'Anand', 'Ambala', 'Amritsar', 'Aurangabad'],
    'B': ['Bangalore', 'Bhopal', 'Bhavnagar', 'Bareilly', 'Bhubaneswar'],
    'C': ['Chennai', 'Coimbatore', 'Cuttack', 'Chandigarh'],
    'D': ['Delhi', 'Dhanbad', 'Dehradun', 'Durgapur'],
    'E': ['Ernakulam', 'Erode', 'Eluru'],
    'F': ['Faridabad', 'Firozabad', 'Fatehpur'],
    'G': ['Gandhinagar', 'Gwalior', 'Ghaziabad', 'Gorakhpur', 'Goa'],
    'H': ['Hyderabad', 'Howrah', 'Hosur', 'Haridwar'],
    'I': ['Indore', 'Imphal', 'Itanagar'],
    'J': ['Jaipur', 'Jodhpur', 'Jamshedpur', 'Jhansi', 'Jalandhar'],
    'K': ['Kolkata', 'Kanpur', 'Kochi', 'Kota', 'Kurnool'],
    'L': ['Lucknow', 'Ludhiana', 'Latur'],
    'M': ['Mumbai', 'Mysore', 'Madurai', 'Meerut', 'Moradabad'],
    'N': ['Nagpur', 'Noida', 'Nashik', 'Nellore'],
    'O': ['Ooty', 'Osmanabad'],
    'P': ['Pune', 'Patna', 'Puducherry', 'Prayagraj', 'Panipat'],
    'Q': ['Quilon (Kollam)'],
    'R': ['Ranchi', 'Rajkot', 'Raipur', 'Rourkela'],
    'S': ['Surat', 'Shimla', 'Siliguri', 'Srinagar', 'Salem'],
    'T': ['Thane', 'Tirupati', 'Tiruchirappalli', 'Thrissur'],
    'U': ['Udaipur', 'Ujjain', 'Unnao'],
    'V': ['Varanasi', 'Vijayawada', 'Visakhapatnam', 'Vadodara'],
    'W': ['Warangal', 'Wardha'],
    'X': ['Xeldem (Goa)'],
    'Y': ['Yamunanagar', 'Yavatmal'],
    'Z': ['Zirakpur', 'Zunheboto'],
  };

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            setState(() {
              searchQuery = value.toLowerCase();
            });
          },
          decoration: InputDecoration(
            hintText: 'Search for area, city name...',
            border: InputBorder.none,
            icon: Icon(Icons.search, color: Colors.black),
          ),
        ),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.grey.shade200,
            child: Center(
              child: Text(
                'Choose by City',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8.0),
              children: citiesByAlphabet.entries.map((entry) {
                List<String> filteredCities = entry.value
                    .where((city) => city.toLowerCase().contains(searchQuery))
                    .toList();
                if (filteredCities.isEmpty) return SizedBox();
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xFFD64658),
                        child: Text(entry.key,
                            style: TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Wrap(
                          spacing: 16.0,
                          runSpacing: 8.0,
                          children: filteredCities.map((city) {
                            return GestureDetector(
                              onTap: () {
                                // Navigate to Explore_City when a city is tapped
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Explore_City(cityName: city),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.red.shade100,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Color(0xFFD64658), width: 2),
                                ),
                                child: Text(city, style: TextStyle(color: Colors.black)),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Navigate to Loading_Screen (if needed)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Explore_city()),
                );
              },
              icon: Icon(Icons.location_on),
              label: Text('Use your Current Location'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD64658),
                foregroundColor: Colors.black,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Explore_City extends StatelessWidget {
  final String cityName;

   Explore_City({Key? key, required this.cityName}) : super(key: key);

  final List<Map<String, dynamic>> outlets = [
    {
      'location': 'Andheri East, Mumbai',
      'reviews': 20,
    },
    {
      'location': 'Antop Hill, Mumbai',
      'reviews': 9,
    },
    {
      'location': 'Bandra Kurla Complex, Mumbai',
      'reviews': 25,
    },
    {
      'location': 'Bandra Reclamation, Mumbai',
      'reviews': 9,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD64658),
        title: Text("Explore $cityName Outlets", style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: outlets.length,
          itemBuilder: (context, index) {
            return OutletCard(
              location: outlets[index]['location'],
              reviews: outlets[index]['reviews'],
              showCancelIcon: index == 0, // Show cancel icon only for the first item
            );
          },
        ),
      ),
    );
  }
}

class OutletCard extends StatelessWidget {
  final String location;
  final int reviews;
  final bool showCancelIcon;

  const OutletCard({
    required this.location,
    required this.reviews,
    required this.showCancelIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              location,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 18),
                SizedBox(width: 4),
                Text("Delivery"),
                SizedBox(width: 12),
                Icon(
                  showCancelIcon ? Icons.cancel : Icons.check_circle,
                  color: showCancelIcon ? Colors.red : Colors.green,
                  size: 18,
                ),
                SizedBox(width: 4),
                Text("Pickup"),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                ...List.generate(5, (index) => Icon(Icons.star, color: Colors.amber, size: 18)),
                SizedBox(width: 4),
                Text("($reviews Reviews)", style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.access_time, size: 18, color: Colors.grey),
                SizedBox(width: 4),
                Text("Approx delivery time is ", style: TextStyle(color: Colors.grey)),
                Text("60 mins", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Explore_city extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading..."),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}