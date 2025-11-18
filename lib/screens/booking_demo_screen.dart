import 'package:flutter/material.dart';
import 'enhanced_booking_screen.dart';

class BookingDemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking System Demo'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Zanzibar Trail Tours - Booking System',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            SizedBox(height: 16),
            Text(
              'Experience our enhanced booking system with WhatsApp and Email integration.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 32),

            // Demo Options
            _buildDemoOption(
              context,
              'Tour Booking',
              'Book a Zanzibar tour experience',
              Icons.explore,
              Colors.green,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EnhancedBookingScreen(
                      tourId: 'stone_town',
                      entityType: 'tour',
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 16),

            _buildDemoOption(
              context,
              'Safari Booking',
              'Book a Tanzania safari adventure',
              Icons.camera_alt,
              Colors.orange,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EnhancedBookingScreen(
                      tourId: 'serengeti_3day',
                      entityType: 'safari',
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 16),

            _buildDemoOption(
              context,
              'Hidden Gem Booking',
              'Book a unique hidden gem experience',
              Icons.diamond,
              Colors.purple,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EnhancedBookingScreen(
                      gemId: 'uzi_island',
                      entityType: 'hidden_gem',
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 32),

            // Features
            Text(
              'Booking Features:',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 16),

            _buildFeatureItem(
              context,
              Icons.chat,
              'WhatsApp Integration',
              'Quick and direct communication with pre-formatted messages',
            ),

            _buildFeatureItem(
              context,
              Icons.email,
              'Email Integration',
              'Professional email templates with all booking details',
            ),

            _buildFeatureItem(
              context,
              Icons.person,
              'Customer Information',
              'Collects name, email, phone, nationality, and special requests',
            ),

            _buildFeatureItem(
              context,
              Icons.calendar_today,
              'Booking Details',
              'Travel date, number of people, and package type selection',
            ),

            _buildFeatureItem(
              context,
              Icons.verified,
              'Validation',
              'Form validation ensures all required information is provided',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDemoOption(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(
    BuildContext context,
    IconData icon,
    String title,
    String description,
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
