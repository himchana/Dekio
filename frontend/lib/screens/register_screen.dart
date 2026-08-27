import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _serviceAreaController = TextEditingController();
  final _experienceController = TextEditingController();
  final _hourlyRateController = TextEditingController();
  final _bioController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  String _selectedService = 'Home Cleaning';

  final List<String> _services = [
    'Home Cleaning',
    'Office Cleaning',
    'Deep Cleaning',
    'Move-in / Move-out Cleaning',
    'Carpet Cleaning',
    'Window Cleaning',
  ];

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _serviceAreaController.dispose();
    _experienceController.dispose();
    _hourlyRateController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    final role = arguments is String ? arguments : 'customer';

    final isProfessional = role == 'professional';

    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 800;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.inkNavy,
        elevation: 0,
        title: Text(
          isProfessional
              ? 'Professional Registration'
              : 'Customer Registration',
          style: const TextStyle(
            color: AppColors.inkNavy,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 35),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 900,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(isProfessional),
                    const SizedBox(height: 28),

                    if (isDesktop)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildBasicInformation(),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: isProfessional
                                ? _buildProfessionalInformation()
                                : _buildPasswordSection(),
                          ),
                        ],
                      )
                    else ...[
                      _buildBasicInformation(),
                      const SizedBox(height: 22),
                      isProfessional
                          ? _buildProfessionalInformation()
                          : _buildPasswordSection(),
                    ],

                    if (isDesktop && isProfessional) ...[
                      const SizedBox(height: 22),
                      _buildPasswordSection(),
                    ],

                    const SizedBox(height: 28),

                    _buildTerms(),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: _isLoading
                            ? null
                            : () => _handleRegister(
                                  isProfessional,
                                ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isProfessional
                              ? AppColors.accentPink
                              : AppColors.primaryBlue,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                isProfessional
                                    ? 'Create Professional Account'
                                    : 'Create Customer Account',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    Center(
                      child: TextButton(
                        onPressed: _isLoading
                            ? null
                            : () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.login,
                                );
                              },
                        child: const Text(
                          'Already have an account? Login',
                          style: TextStyle(
                            color: AppColors.primaryBlue,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(bool isProfessional) {
    final accentColor = isProfessional
        ? AppColors.accentPink
        : AppColors.primaryBlue;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: AppColors.brandGradient,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: 0.18),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              isProfessional
                  ? Icons.cleaning_services_rounded
                  : Icons.person_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isProfessional
                      ? 'Become a DEKIO Professional'
                      : 'Welcome to DEKIO',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  isProfessional
                      ? 'Offer your cleaning services and connect with customers.'
                      : 'Book trusted cleaning professionals for your home or office.',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12.5,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBasicInformation() {
    return _buildCard(
      title: 'Basic Information',
      icon: Icons.person_outline_rounded,
      child: Column(
        children: [
          _buildTextField(
            controller: _fullNameController,
            label: 'Full Name',
            hint: 'Enter your full name',
            icon: Icons.person_outline_rounded,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your name';
              }

              if (value.trim().length < 2) {
                return 'Name is too short';
              }

              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _emailController,
            label: 'Email Address',
            hint: 'you@example.com',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your email';
              }

              final emailRegex = RegExp(
                r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
              );

              if (!emailRegex.hasMatch(value.trim())) {
                return 'Enter a valid email address';
              }

              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _phoneController,
            label: 'Phone Number',
            hint: '+255 7XX XXX XXX',
            icon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your phone number';
              }

              if (value.trim().length < 9) {
                return 'Enter a valid phone number';
              }

              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfessionalInformation() {
    return _buildCard(
      title: 'Professional Information',
      icon: Icons.work_outline_rounded,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<String>(
            initialValue: _selectedService,
            decoration: _inputDecoration(
              label: 'Main Service',
              icon: Icons.cleaning_services_outlined,
            ),
            items: _services.map((service) {
              return DropdownMenuItem<String>(
                value: service,
                child: Text(service),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedService = value;
                });
              }
            },
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _experienceController,
            label: 'Experience',
            hint: 'e.g. 3 years',
            icon: Icons.workspace_premium_outlined,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your experience';
              }

              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _hourlyRateController,
            label: 'Hourly Rate',
            hint: 'e.g. 15000',
            icon: Icons.payments_outlined,
            keyboardType: TextInputType.number,
            prefixText: 'TZS ',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your hourly rate';
              }

              final rate = double.tryParse(value.trim());

              if (rate == null || rate <= 0) {
                return 'Enter a valid rate';
              }

              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _serviceAreaController,
            label: 'Service Area',
            hint: 'e.g. Mbeya City',
            icon: Icons.location_on_outlined,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your service area';
              }

              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _bioController,
            label: 'Professional Bio',
            hint: 'Tell customers about your experience...',
            icon: Icons.description_outlined,
            maxLines: 4,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please add a short bio';
              }

              if (value.trim().length < 20) {
                return 'Bio should be at least 20 characters';
              }

              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordSection() {
    return _buildCard(
      title: 'Security',
      icon: Icons.lock_outline_rounded,
      child: Column(
        children: [
          _buildTextField(
            controller: _passwordController,
            label: 'Password',
            hint: 'Create a strong password',
            icon: Icons.lock_outline_rounded,
            obscureText: _obscurePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }

              if (value.length < 8) {
                return 'Password must be at least 8 characters';
              }

              return null;
            },
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _confirmPasswordController,
            label: 'Confirm Password',
            hint: 'Re-enter your password',
            icon: Icons.lock_reset_outlined,
            obscureText: _obscureConfirmPassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              },
              icon: Icon(
                _obscureConfirmPassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }

              if (value != _passwordController.text) {
                return 'Passwords do not match';
              }

              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.borderLight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.025),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: AppColors.primaryBlue,
                size: 21,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: AppColors.inkNavy,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          child,
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    String? prefixText,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: obscureText ? 1 : maxLines,
      validator: validator,
      decoration: _inputDecoration(
        label: label,
        hint: hint,
        icon: icon,
        prefixText: prefixText,
        suffixIcon: suffixIcon,
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String label,
    String? hint,
    required IconData icon,
    String? prefixText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(
        icon,
        color: AppColors.primaryBlue,
        size: 21,
      ),
      prefixText: prefixText,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: AppColors.background,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 15,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: AppColors.borderLight,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: AppColors.borderLight,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: AppColors.primaryBlue,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Colors.redAccent,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 1.5,
        ),
      ),
    );
  }

  Widget _buildTerms() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.verified_user_outlined,
          color: AppColors.primaryBlue,
          size: 19,
        ),
        const SizedBox(width: 9),
        const Expanded(
          child: Text(
            'By creating an account, you agree to DEKIO terms of service and privacy policy.',
            style: TextStyle(
              fontSize: 11.5,
              height: 1.45,
              color: AppColors.slateMuted,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _handleRegister(bool isProfessional) async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Temporary frontend-only registration.
    // Backend authentication will be connected later.
    await Future.delayed(
      const Duration(milliseconds: 900),
    );

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isProfessional
              ? 'Professional account created successfully!'
              : 'Customer account created successfully!',
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );

    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    if (!mounted) return;

    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.home,
      (route) => false,
    );
  }
}