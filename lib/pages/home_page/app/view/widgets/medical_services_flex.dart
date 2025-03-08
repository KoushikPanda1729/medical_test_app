import 'package:flutter/material.dart';
import 'package:medical_test_app/commons/components/medical_services_card/app/view/medical_services_card.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';

class MedicalServicesFlex extends StatelessWidget {
  const MedicalServicesFlex({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> services = [
      {'title': 'Book Home Collection', 'iconPath': AppIcons.heartBeat},
      {'title': 'View My Reports', 'iconPath': AppIcons.heartBeat},
      {'title': 'Popular Test Packages', 'iconPath': AppIcons.heartBeat},
      {'title': 'Book Your Radiology Scans', 'iconPath': AppIcons.heartBeat},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.start,
        children: List.generate(services.length, (index) {
          return SizedBox(
            width: (MediaQuery.of(context).size.width / 2) - 20,
            child: MedicalServicesCard(
              title: services[index]['title']!,
              iconPath: services[index]['iconPath']!,
            ),
          );
        }),
      ),
    );
  }
}
