import 'package:flutter/material.dart';
import '../models/service_model.dart';
import '../widgets/service_card.dart';

class ServicesScreen extends StatelessWidget {
  ServicesScreen({super.key});

  final List<Service> services = [
    Service(
      id: '1',
      name: 'Home Cleaning',
      description: 'Professional cleaning service for your home.',
      price: 20000,
      imageUrl: 'placeholder',
    ),
    Service(
      id: '2',
      name: 'Office Cleaning',
      description: 'Keep your office clean, fresh, and organized.',
      price: 30000,
      imageUrl: 'placeholder',
    ),
    Service(
      id: '3',
      name: 'Deep Cleaning',
      description: 'A detailed cleaning service for your entire space.',
      price: 50000,
      imageUrl: 'placeholder',
    ),
    Service(
      id: '4',
      name: 'Kitchen Cleaning',
      description: 'Thorough cleaning for your kitchen and surfaces.',
      price: 15000,
      imageUrl: 'placeholder',
    ),
    Service(
      id: '5',
      name: 'Bathroom Cleaning',
      description: 'Professional cleaning for a fresh and hygienic bathroom.',
      price: 12000,
      imageUrl: 'placeholder',
    ),
  ];

  void _showServiceMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Service details coming soon'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cleaning Services'),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];

          return ServiceCard(
            service: service,
            onTap: () => _showServiceMessage(context),
          );
        },
      ),
    );
  }
}