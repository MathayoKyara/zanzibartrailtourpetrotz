import 'package:flutter/material.dart';

import '../models/hidden_gems_data.dart';
import 'enhanced_booking_screen.dart';

class HiddenGemDetailScreen extends StatelessWidget {
  final String gemId;

  const HiddenGemDetailScreen({Key? key, required this.gemId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gem = HiddenGemsData.getGemById(gemId);

    if (gem == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Hidden Gem Not Found'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: const Center(
          child: Text('We could not find the hidden gem you were looking for.'),
        ),
      );
    }

    final categoryColor = _categoryColorFor(gem.category, context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          gem.title,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: categoryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 16 / 10,
                child: Image.asset(
                  gem.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.image,
                        size: 64,
                        color: Colors.grey[500],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: categoryColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: categoryColor.withOpacity(0.45)),
                  ),
                  child: Text(
                    gem.category,
                    style: TextStyle(
                      color: categoryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Icon(Icons.location_on, color: categoryColor, size: 18),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    gem.location,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              gem.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionHeader(context, 'Highlights', Icons.star_outline),
            const SizedBox(height: 8),
            _buildSectionCard(
              context,
              child: Text(
                gem.highlights,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontStyle: FontStyle.italic,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionHeader(context, 'Why Visit', Icons.visibility_outlined),
            const SizedBox(height: 8),
            _buildSectionCard(
              context,
              child: Text(
                gem.whyVisit,
                style: TextStyle(
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionHeader(
              context,
              '2025 Update',
              Icons.update,
              iconColor: Colors.blue[700],
            ),
            const SizedBox(height: 8),
            _buildSectionCard(
              context,
              backgroundColor: Colors.blue[50],
              borderColor: Colors.blue[200],
              child: Text(
                gem.update2025,
                style: TextStyle(
                  color: Colors.blue[800],
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EnhancedBookingScreen(
                        gemId: gem.id,
                        entityType: 'hidden_gem',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.book_online),
                label: const Text(
                  'Book This Experience',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: categoryColor,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _categoryColorFor(String category, BuildContext context) {
    switch (category) {
      case 'Nature & Secluded Spots':
        return Colors.green[700] ?? Theme.of(context).primaryColor;
      case 'Cultural & Local Experiences':
        return Colors.orange[700] ?? Theme.of(context).colorScheme.secondary;
      case 'Offbeat Beaches':
        return Colors.blue[700] ?? Theme.of(context).primaryColor;
      case 'Historical & Spiritual Sites':
        return Colors.purple[700] ?? Theme.of(context).primaryColor;
      default:
        return Theme.of(context).primaryColor;
    }
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    IconData icon, {
    Color? iconColor,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor ?? Theme.of(context).primaryColor,
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionCard(
    BuildContext context, {
    required Widget child,
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor ?? Colors.grey[200]!),
      ),
      child: child,
    );
  }
}

