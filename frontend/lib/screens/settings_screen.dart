import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/routes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  bool _darkMode = false;
  bool _locationServices = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.inkNavy,
        elevation: 0.5,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: AppColors.inkNavy,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          _buildSectionHeader('Preferences'),
          _buildSwitchTile(
            title: 'Push Notifications',
            subtitle: 'Booking updates & service alerts',
            icon: Icons.notifications_outlined,
            value: _notifications,
            accentColor: AppColors.primaryBlue,
            onChanged: (val) => setState(() => _notifications = val),
          ),
          _buildSwitchTile(
            title: 'Location Services',
            subtitle: 'Show pros closest to your address',
            icon: Icons.location_on_outlined,
            value: _locationServices,
            accentColor: AppColors.accentOrange,
            onChanged: (val) => setState(() => _locationServices = val),
          ),
          _buildSwitchTile(
            title: 'Dark Mode',
            subtitle: 'Enable low-light interface palette',
            icon: Icons.dark_mode_outlined,
            value: _darkMode,
            accentColor: AppColors.accentPink,
            onChanged: (val) => setState(() => _darkMode = val),
          ),

          const SizedBox(height: 24),
          _buildSectionHeader('Account & Support'),
          _buildActionTile(
            title: 'My Saved Addresses',
            icon: Icons.home_work_outlined,
            iconColor: AppColors.primaryBlue,
            onTap: () {},
          ),
          _buildActionTile(
            title: 'Payment Methods',
            icon: Icons.credit_card_outlined,
            iconColor: AppColors.accentOrange,
            onTap: () {},
          ),
          _buildActionTile(
            title: 'Help Center & Support',
            icon: Icons.headset_mic_outlined,
            iconColor: AppColors.accentPink,
            onTap: () {},
          ),

          const SizedBox(height: 32),
          Center(
            child: Column(
              children: [
                // Signature 3-Color Brand Gradient Bar
                Container(
                  width: 48,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    gradient: AppColors.brandGradient,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'DEKIO • AI HUB Edition v1.0.0',
                  style: TextStyle(
                    color: AppColors.slateMuted,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 11.5,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
          color: AppColors.slateMuted,
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool value,
    required Color accentColor,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: SwitchListTile(
        secondary: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: accentColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: accentColor, size: 22),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: AppColors.inkNavy,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: AppColors.slateMuted),
        ),
        activeColor: accentColor,
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildActionTile({
    required String title,
    required IconData icon,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: AppColors.inkNavy,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.black38),
        onTap: onTap,
      ),
    );
  }
}
