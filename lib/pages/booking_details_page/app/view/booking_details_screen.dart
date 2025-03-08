import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/components/buttons/app/floating_button__widget.dart';
import 'package:medical_test_app/commons/components/navigation_bar/app/view/bottom_navigation_bar.dart';
import 'package:medical_test_app/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';
import 'package:medical_test_app/commons/constants/app_images.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          NavBar(
            leadingIcon: FloatingButton(
              onPressed: () {
                context.pop();
              },
              iconPath: AppIcons.angleSmallRight,
              backgroundColor: AppColors.white,
              iconColor: AppColors.black,
              isDisabled: false,
              buttonSize: 42,
              iconSize: 20,
              isRotated: true,
            ),
            trailingIcon: const SizedBox(),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Card
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              AppImages.test1,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Complete Blood Count (CBC)",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  "29 Parameters",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 4,
                                  children: [
                                    _buildFeatureChip("Total 29 Tests"),
                                    _buildFeatureChip(
                                        "Overnight Fasting Required"),
                                    _buildFeatureChip("For All Genders"),
                                    _buildFeatureChip(
                                        "Online Report within 1 Day"),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                // Price and Buttons
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "₹1399",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.teal,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.teal,
                                            foregroundColor: Colors.white,
                                          ),
                                          onPressed: () {},
                                          child: const Text("Add to Cart"),
                                        ),
                                        const SizedBox(width: 8),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.orange,
                                            foregroundColor: Colors.white,
                                          ),
                                          onPressed: () {},
                                          child: const Text("Book Now"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Profile Description
                    const Text(
                      "Profile Description",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "The Complete Blood Count (CBC) test analyzes red blood cells, "
                      "white blood cells, and platelets, providing vital insights into your "
                      "health. It helps diagnose anemia, infections, leukemia, and clotting disorders.",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),

                    const SizedBox(height: 12),

                    // Features
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildFeatureIcon("NABL, CAP, UKAS", Icons.verified),
                        _buildFeatureIcon("Well-trained Agents", Icons.groups),
                        _buildFeatureIcon(
                            "Guaranteed Precision", Icons.check_circle),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Test List
                    ExpansionTile(
                      title: const Text(
                        "Test(s) Included (30)",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: const [
                        ListTile(title: Text("Haemoglobin (Hb)")),
                        ListTile(title: Text("RBC Count")),
                        ListTile(title: Text("PCV / Hematocrit")),
                        ListTile(title: Text("MCV")),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Bottom Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(14),
                            ),
                            onPressed: () {},
                            child: const Text("Add To Cart"),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(14),
                            ),
                            onPressed: () {},
                            child: const Text("Book Now"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Navigation Bar with shadow
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: BottomNavigationBarWidget(
              activeIndex: 0, // Set home button as active (index 0)
              onItemTapped: (index) {
                // Handle navigation based on index
                if (index == 0) {
                  context.go('/'); // Home
                } else if (index == 1) {
                  context.go('/help'); // Need Help
                } else if (index == 2) {
                  context.go('/call'); // Call
                } else if (index == 3) {
                  context.go('/track'); // Track
                } else if (index == 4) {
                  context.go('/account'); // Account
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureChip(String label) {
    return Chip(
      backgroundColor: Colors.teal.withOpacity(0.1),
      label:
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.teal)),
    );
  }

  Widget _buildFeatureIcon(String text, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.teal),
        const SizedBox(height: 4),
        Text(text,
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
