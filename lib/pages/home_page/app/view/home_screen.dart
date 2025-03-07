import 'package:flutter/material.dart';
import 'package:medical_test_app/commons/components/navigation_bar/app/view/navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          NavBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBanner(),
                  _buildGridMenu(),
                  _buildHealthPackages(),
                  _buildCategoryScroll(),
                  _buildPromoSection(),
                  _buildBodyPartsGrid(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("10% off on Family body checkup package",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          ElevatedButton(onPressed: () {}, child: Text("Book Now")),
        ],
      ),
    );
  }

  Widget _buildGridMenu() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 3,
      children: [
        _gridButton("Book Home Collection"),
        _gridButton("View My Reports"),
        _gridButton("Popular Test Packages"),
        _gridButton("Need Your Booking Scans"),
      ],
    );
  }

  Widget _gridButton(String title) {
    return Card(
      child: Center(child: Text(title, textAlign: TextAlign.center)),
    );
  }

  Widget _buildHealthPackages() {
    return Column(
      children: [
        ListTile(title: Text("Popular Health Packages")),
        Container(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) => _healthPackageCard(),
          ),
        ),
      ],
    );
  }

  Widget _healthPackageCard() {
    return Container(
      width: 200,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Complete Blood Test",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text("₹1299"),
          ElevatedButton(onPressed: () {}, child: Text("Book Now")),
        ],
      ),
    );
  }

  Widget _buildCategoryScroll() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            List.generate(5, (index) => _categoryChip("Condition $index")),
      ),
    );
  }

  Widget _categoryChip(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chip(label: Text(title)),
    );
  }

  Widget _buildPromoSection() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Special offer for senior citizens"),
          ElevatedButton(onPressed: () {}, child: Text("Book Now")),
        ],
      ),
    );
  }

  Widget _buildBodyPartsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 2.5,
      children: [
        _gridButton("Kids Care"),
        _gridButton("Diabetes Care"),
        _gridButton("Partner Care"),
      ],
    );
  }
}
