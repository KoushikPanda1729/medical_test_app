import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/components/buttons/app/floating_button__widget.dart';
import 'package:medical_test_app/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:medical_test_app/commons/components/open_custom_buttomsheet/open_custom_buttomsheet.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';
import 'package:medical_test_app/commons/constants/app_images.dart';
import 'package:medical_test_app/pages/book_test_page/app/views/widgets/book_test_filter.dart';
import 'package:medical_test_app/pages/book_test_page/app/views/widgets/filter_switch_widget.dart';
import 'package:medical_test_app/commons/components/search_bar/app/view/search_bar_widget.dart';
import 'package:medical_test_app/commons/components/package_card/app/view/test_package_card.dart';

class BookTest extends StatelessWidget {
  const BookTest({super.key});

  @override
  Widget build(BuildContext context) {
    // Enhanced test packages with more details
    List<Map<String, dynamic>> testPackages = [
      {
        'title': 'Complete Blood Count (CBC)',
        'parameters': '25 Parameters',
        'price': 1399,
        'imagePath': AppImages.test1,
        'description':
            'The CBC (Complete Blood Count) is more than just a routine test—it\'s a crucial step in safeguarding your health and that of your loved ones. Timely testing can catch potential issues like anaemia or infections early, allowing for quick intervention.',
        'features': [
          'Online Report within 14 hours',
          'Fasting not required',
          'Recommended for all genders',
          'Total 25 parameters',
          'Age Group: 5-99 years',
          'Sample Collected from Home'
        ],
        'tests': [
          'ABS.BASOPHIL COUNT',
          'ABS.EOSINOPHIL COUNT',
          'ABS.LYMPHOCYTE COUNT',
          'ABS.MONOCYTE COUNT',
          'ABS. NEUTROPHIL COUNT',
          'ESR Automated',
          'Basophils',
          'Eosinophils',
          'Hemoglobin',
          'Lymphocytes'
        ]
      },
      {
        'title': 'Peripheral Blood Smear (PBS)',
        'parameters': '10 Parameters',
        'price': 999,
        'imagePath': AppImages.mainBanner7,
        'description':
            'Your blood holds vital clues about your health, and the Peripheral Blood Smear test helps uncover them. This test provides a detailed look at your blood cells, detecting abnormalities linked to anaemia, infections, and serious disorders.',
        'features': [
          'Online Report within 14 hours',
          'Fasting not required',
          'Recommended for all genders',
          'Total 10 parameters',
          'Age Group: 5-99 years',
          'Sample Collected from Home'
        ],
        'tests': [
          'Red Blood Cell Morphology',
          'White Blood Cell Morphology',
          'Platelet Morphology',
          'Anisocytosis',
          'Poikilocytosis',
          'Hypochromia',
          'Polychromasia',
          'Presence of Immature Cells',
          'Nucleated Red Blood Cells (NRBC)',
          'Parasites Screening'
        ]
      },
      {
        'title': 'Erythrocyte Sedimentation Rate (ESR)',
        'parameters': '10 Parameters',
        'price': 799,
        'imagePath': AppImages.test1,
        'description':
            'Your health tells a story, and the Erythrocyte Sedimentation Rate (ESR) test helps uncover hidden inflammation that may indicate infections, autoimmune disorders, or chronic diseases.',
        'features': [
          'Online Report within 14 hours',
          'Fasting not required',
          'Recommended for all genders',
          'Total 10 parameters',
          'Age Group: 5-99 years',
          'Sample Collected from Home'
        ],
        'tests': [
          'Red Blood Cell Morphology',
          'White Blood Cell Morphology',
          'Platelet Morphology',
          'Anisocytosis',
          'Poikilocytosis',
          'Hypochromia',
          'Polychromasia',
          'Presence of Immature Cells',
          'Nucleated Red Blood Cells (NRBC)',
          'Parasites Screening'
        ]
      },
      {
        'title': 'Prothrombin Time (PT) / INR',
        'parameters': '2 Parameters',
        'price': 599,
        'imagePath': AppImages.mainBanner7,
        'description':
            'Your blood carries the rhythm of life, and its ability to clot properly is crucial for your well-being. The Prothrombin Time (PT) / INR test ensures your blood flows just right—preventing dangerous clots or excessive bleeding.',
        'features': [
          'Online Report within 14 hours',
          'Fasting not required',
          'Recommended for all genders',
          'Total 2 parameters',
          'Age Group: 5-99 years',
          'Sample Collected from Home'
        ],
        'tests': [
          'Prothrombin Time (PT)',
          'International Normalized Ratio (INR)'
        ]
      },
      {
        'title': 'Activated Partial Thromboplastin Time (APTT)',
        'parameters': '1 Parameter',
        'price': 499,
        'imagePath': AppImages.test1,
        'description':
            'Every heartbeat is precious, and your body\'s ability to form clots plays a vital role in protecting you. The Activated Partial Thromboplastin Time (APTT) test helps assess how well your blood clots.',
        'features': [
          'Online Report within 14 hours',
          'Fasting not required',
          'Recommended for all genders',
          'Total 1 parameter',
          'Age Group: 5-99 years',
          'Sample Collected from Home'
        ],
        'tests': ['Activated Partial Thromboplastin Time (APTT)']
      },
      {
        'title': 'Reticulocyte Count Test',
        'parameters': '1 Parameter',
        'price': 449,
        'imagePath': AppImages.mainBanner7,
        'description':
            'Your blood tells a story of your health, and every new cell it produces is a sign of renewal. The Reticulocyte Count test measures young red blood cells, helping detect anemia, bone marrow function, or recovery after treatments.',
        'features': [
          'Online Report within 14 hours',
          'Fasting not required',
          'Recommended for all genders',
          'Total 1 parameter',
          'Age Group: 5-99 years',
          'Sample Collected from Home'
        ],
        'tests': ['Reticulocyte Count']
      },
      {
        'title': 'D-Dimer Test',
        'parameters': '1 Parameter',
        'price': 599,
        'imagePath': AppImages.test1,
        'description':
            'Your body often signals hidden risks, and the D-Dimer Test helps uncover them. It detects abnormal blood clotting, identifying serious conditions like deep vein thrombosis (DVT) and pulmonary embolism (PE) before they become life-threatening.',
        'features': [
          'Online Report within 14 hours',
          'Fasting not required',
          'Recommended for all genders',
          'Total 1 parameter',
          'Age Group: 5-99 years',
          'Sample Collected from Home'
        ],
        'tests': ['D-Dimer']
      },
      {
        'title': 'Fibrinogen Level Test',
        'parameters': '1 Parameter',
        'price': 499,
        'imagePath': AppImages.test1,
        'description':
            'Your body\'s ability to heal and prevent excessive bleeding depends on fibrinogen, a key blood-clotting protein. The Fibrinogen Level Test helps detect clotting disorders, inflammation, or underlying health risks like liver disease.',
        'features': [
          'Online Report within 14 hours',
          'Fasting not required',
          'Recommended for all genders',
          'Total Parameters: 1',
          'Age Group: 5-99 years',
          'Sample Collected from Home'
        ],
        'tests': ['Fibrinogen Level']
      },
      {
        'title': 'Hemoglobin Electrophoresis Test',
        'parameters': '1 Parameter',
        'price': 699,
        'imagePath': AppImages.test1,
        'description':
            'Your hemoglobin plays a vital role in carrying oxygen throughout your body, but abnormalities can lead to serious conditions like thalassemia or sickle cell disease. Hemoglobin Electrophoresis helps detect these disorders early.',
        'features': [
          'Online Report within 14 hours',
          'Fasting not required',
          'Recommended for all genders',
          'Total Parameters: 1',
          'Age Group: 5-99 years',
          'Sample Collected from Home'
        ],
        'tests': ['Hemoglobin Electrophoresis']
      },
      {
        'title': 'Total Leukocyte Count (TLC) Test',
        'parameters': '1 Parameter',
        'price': 399,
        'imagePath': AppImages.test1,
        'description':
            'Your body\'s defense system depends on healthy white blood cells (leukocytes) to fight infections and keep you strong. A Total Leukocyte Count (TLC) test helps assess your immune health.',
        'features': [
          'Online Report within 14 hours',
          'Fasting not required',
          'Recommended for all genders',
          'Total Parameters: 1',
          'Age Group: 5-99 years',
          'Sample Collected from Home'
        ],
        'tests': ['Total Leukocyte Count (TLC)']
      },
    ];

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
          const SizedBox(height: 17),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBarWidget(
                  onChanged: (value) {},
                ),
                const SizedBox(height: 17),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    PillTagChip(
                      label: "Complete Blood Count",
                      onRemove: () {
                        // Handle remove action
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                FilterSwitchWidget(
                  isSwitched: true,
                  onToggle: (value) {},
                  onFilterPressed: () {
                    openCustomBottomSheet(
                      context: context,
                      child: BookTestFilter(
                        categories: const [
                          "ABO Incompatibility",
                          "Acid Base Imbalance",
                          "leukemia",
                          "leukemia",
                          "ABO Incompatibility",
                          "Acid Base Imbalance",
                          "ABO Incompatibility",
                          "Acid Base Imbalance",
                          "leukemia",
                        ],
                        onApply: (selected) {},
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: testPackages.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: TestPackageCard(
                    title: testPackages[index]['title'],
                    parameters: testPackages[index]['parameters'],
                    price: testPackages[index]['price'],
                    onDetailsPressed: () {
                      // Pass the entire package data to the booking details page
                      context.push(
                        "/booking_details",
                        extra: testPackages[index],
                      );
                    },
                    onBookNowPressed: () {
                      // Pass the entire package data to the booking details page
                      context.push(
                        "/booking_details",
                        extra: testPackages[index],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PillTagChip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const PillTagChip({
    super.key,
    required this.label,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFD7F1F0),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF00A9A7)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(
              Icons.close,
              size: 18,
              color: Color(0xFF00A9A7),
            ),
          ),
        ],
      ),
    );
  }
}
