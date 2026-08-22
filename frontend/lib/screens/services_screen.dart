import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  static const Color background = Color(0xFFF0FAF8);
  static const Color inkNavy = Color(0xFF0F172A);
  static const Color teal = Color(0xFF0B6E63);

  @override
  Widget build(BuildContext context) {
    final services = [
      ('🏠', 'Home Cleaning'),
      ('🏢', 'Office Cleaning'),
      ('🛋️', 'Deep Cleaning'),
      ('🪟', 'Window Cleaning'),
      ('🧺', 'Laundry'),
      ('🚗', 'Car Wash'),
    ];

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 16,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFE3EEEE),
                  ),
                ),
              ),
              child: Row(
                children: [
                  // Back button
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 46,
                      height: 46,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE8F6F3),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: teal,
                        size: 30,
                      ),
                    ),
                  ),

                  const SizedBox(width: 14),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose service',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: inkNavy,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Choose Services',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Services
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: GridView.builder(
                  itemCount: services.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 1.45,
                  ),
                  itemBuilder: (context, index) {
                    final service = services[index];

                    return _ServiceCard(
                      icon: service.$1,
                      title: service.$2,
                      onTap: () {
                        _selectService(
                          context,
                          service.$2,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectService(
    BuildContext context,
    String service,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$service selected'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(28),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(28),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: const Color(0xFFE1ECEA),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x12000000),
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                icon,
                style: const TextStyle(
                  fontSize: 38,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF263238),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}