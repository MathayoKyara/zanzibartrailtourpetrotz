import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';

class TestimonialsScreen extends StatefulWidget {
  @override
  _TestimonialsScreenState createState() => _TestimonialsScreenState();
}

class _TestimonialsScreenState extends State<TestimonialsScreen> {
  int _currentIndex = 0;

  List<Map<String, dynamic>> testimonials = [
    {
      'name': 'Sarah Johnson',
      'location': 'United States',
      'rating': 5,
      'tour': 'Zanzibar Spice Tour',
      'comment': 'The Zanzibar Spice Tour was the highlight of our trip! Our guide was incredibly knowledgeable and friendly. We learned so much about the spices and their uses. The lunch prepared with fresh spices was absolutely delicious.',
      'date': 'January 15, 2023',
      'image': 'assets/images/testimonial1.jpg'
    },
    {
      'name': 'David Müller',
      'location': 'Germany',
      'rating': 5,
      'tour': 'Serengeti Safari',
      'comment': 'Our Serengeti safari exceeded all expectations. We saw the Big Five and witnessed the great migration. Our guide spotted animals we would have never found on our own. The accommodations were comfortable and the food was excellent.',
      'date': 'March 22, 2023',
      'image': 'assets/images/testimonial2.jpg'
    },
    {
      'name': 'Aisha Patel',
      'location': 'India',
      'rating': 5,
      'tour': 'Stone Town Cultural Tour',
      'comment': 'The Stone Town tour was fascinating. Our guide shared so much history and stories about the architecture and culture. The blend of Arab, Persian, Indian and European influences is remarkable. Highly recommend this tour!',
      'date': 'February 8, 2023',
      'image': 'assets/images/testimonial3.jpg'
    },
    {
      'name': 'James Wilson',
      'location': 'United Kingdom',
      'rating': 5,
      'tour': 'Mount Kilimanjaro Trek',
      'comment': 'Climbing Kilimanjaro was a life-changing experience. The guides and porters were professional, encouraging, and made sure we were safe and comfortable throughout the journey. The summit sunrise was absolutely breathtaking.',
      'date': 'July 12, 2023',
      'image': 'assets/images/testimonial4.jpg'
    },
    {
      'name': 'Liu Wei',
      'location': 'China',
      'rating': 5,
      'tour': 'Prison Island & Snorkeling',
      'comment': 'Prison Island was amazing! The giant tortoises were incredible to see up close. The snorkeling afterward was fantastic with crystal clear waters and colorful fish. The boat ride was smooth and the crew was very professional.',
      'date': 'April 30, 2023',
      'image': 'assets/images/testimonial5.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testimonials'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: testimonials.length,
        itemBuilder: (context, index) {
          return _buildTestimonialCard(testimonials[index]);
        },
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Navigate to different screens based on index
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/tours');
              break;
            case 2:
              Navigator.pushNamed(context, '/gallery');
              break;
            case 3:
              Navigator.pushNamed(context, '/contact');
              break;
          }
        },
      ),
    );
  }

  Widget _buildTestimonialCard(Map<String, dynamic> testimonial) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(testimonial['image']),
                  onBackgroundImageError: (exception, stackTrace) {
                    // Handle image loading error
                  },
                  child: testimonial['image'] == null 
                      ? Text(
                          testimonial['name'][0].toUpperCase(),
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      : null,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        testimonial['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        testimonial['location'],
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                for (int i = 0; i < testimonial['rating']; i++)
                  Icon(Icons.star, color: Colors.amber, size: 20),
                SizedBox(width: 8),
                Text(
                  testimonial['tour'],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              testimonial['comment'],
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 8),
            Text(
              testimonial['date'],
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
