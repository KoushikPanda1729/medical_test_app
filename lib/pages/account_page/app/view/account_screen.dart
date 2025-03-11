import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                const Row(
                  children: [
                    Expanded(
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
                    ProfileAvatar(),
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

                // Menu items with borders
                const BorderedMenuListItem(
                  title: 'Bookings',
                  subtitle: 'Check Your Booking Status',
                  iconColor: Colors.teal,
                ),

                const SizedBox(height: 12),

                const BorderedMenuListItem(
                  title: 'Reports',
                  subtitle: 'View Previous Reports',
                  iconColor: Colors.teal,
                ),

                const SizedBox(height: 12),

                const BorderedMenuListItem(
                  title: 'Track',
                  subtitle: 'Check Your Report Status',
                  iconColor: Colors.teal,
                ),

                const SizedBox(height: 12),

                const BorderedMenuListItem(
                  title: 'Family',
                  subtitle: 'Check Members',
                  iconColor: Colors.teal,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey,
          child: Icon(
            Icons.person,
            size: 40,
            color: Colors.white,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.edit,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class BorderedMenuListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color iconColor;

  const BorderedMenuListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
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
        trailing: Icon(
          Icons.chevron_right,
          color: iconColor,
        ),
        onTap: () {},
      ),
    );
  }
}
