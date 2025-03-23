import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_test_app/commons/components/profile_avatar/app/view/profile_avatar.dart';
import 'package:medical_test_app/commons/constants/app_colors.dart';
import 'package:medical_test_app/commons/constants/app_icons.dart';
import 'package:medical_test_app/commons/constants/app_images.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define menu items with title, subtitle, and onTap function
    final List<Map<String, dynamic>> menuItems = [
      {
        "title": "Bookings",
        "subtitle": "Check Your Booking Status",
        "onTap": () => context.push("/bookings"),
      },
      {
        "title": "Reports",
        "subtitle": "View Previous Reports",
        "onTap": () => context.push("/reports"),
      },
      {
        "title": "Track",
        "subtitle": "Check Your Report Status",
        "onTap": () => context.push("/track"),
      },
      {
        "title": "Family",
        "subtitle": "Check Members",
        "onTap": () => context.push("/family"),
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with name and email
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Asha Yadav',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'ashayadav@gmail.com',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ProfileAvatar(
                      imagePath: AppImages.profilePicture,
                      onTap: () {
                        context.push("/add_family_member_and_edit_profile",
                            extra: true);
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Switch Profile Button
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.teal,
                    side: const BorderSide(color: Colors.teal),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(120, 36),
                  ),
                  child: const Text('Switch Profile'),
                ),

                const SizedBox(height: 24),

                // Dynamically generate menu items with functions
                Column(
                  children: menuItems
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: BorderedMenuListItem(
                            title: item["title"]!,
                            subtitle: item["subtitle"]!,
                            iconColor: Colors.teal,
                            onTap: item["onTap"],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BorderedMenuListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color iconColor;
  final VoidCallback onTap;

  const BorderedMenuListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.teal.withOpacity(0.4),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: iconColor,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
        trailing: SvgPicture.asset(
          AppIcons.angleRight,
          colorFilter: const ColorFilter.mode(
            AppColors.teal,
            BlendMode.srcIn,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
