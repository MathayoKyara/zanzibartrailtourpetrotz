import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/bottom_navigation.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  int _currentIndex = 3;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Get in Touch',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  icon: Icon(Icons.info_outline, size: 18),
                  label: Text('About Us'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Have questions about our tours or ready to book your Tanzanian adventure? Reach out to us using the form below or through our contact details.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 32),

            // Contact Information
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Information',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      SizedBox(height: 16),
                      _buildContactItem(
                        Icons.email,
                        'Email',
                        'info@tanzaniatrailtours.com',
                        () async {
                          final Uri params = Uri(
                            scheme: 'mailto',
                            path: 'info@tanzaniatrailtours.com',
                            query: 'subject=Inquiry about Tanzania Trail Tours',
                          );
                          if (await canLaunchUrl(params)) {
                            await launchUrl(params);
                          }
                        },
                      ),
                      SizedBox(height: 16),
                      _buildContactItem(
                        Icons.phone,
                        'Phone',
                        '+255 777 123 456',
                        () async {
                          if (await canLaunchUrl(
                              Uri.parse('tel:+255777123456'))) {
                            await launchUrl(Uri.parse('tel:+255777123456'));
                          }
                        },
                      ),
                      SizedBox(height: 16),
                      _buildContactItem(
                        Icons.chat,
                        'WhatsApp',
                        '+255 777 123 456',
                        () async {
                          if (await canLaunchUrl(
                              Uri.parse('https://wa.me/255777123456'))) {
                            await launchUrl(
                                Uri.parse('https://wa.me/255777123456'));
                          }
                        },
                      ),
                      SizedBox(height: 16),
                      _buildContactItem(
                        Icons.location_on,
                        'Address',
                        'Stone Town, Zanzibar, Tanzania',
                        () async {
                          // Open maps
                          if (await canLaunchUrl(
                              Uri.parse('https://goo.gl/maps/example'))) {
                            await launchUrl(
                                Uri.parse('https://goo.gl/maps/example'));
                          }
                        },
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Follow Us',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.facebook,
                                size: 30, color: Colors.blue[600]),
                            onPressed: () async {
                              if (await canLaunchUrl(Uri.parse(
                                  'https://facebook.com/tanzaniatrailtours'))) {
                                await launchUrl(Uri.parse(
                                    'https://facebook.com/tanzaniatrailtours'));
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.camera_alt,
                                size: 30, color: Colors.purple[600]),
                            onPressed: () async {
                              if (await canLaunchUrl(Uri.parse(
                                  'https://instagram.com/tanzaniatrailtours'))) {
                                await launchUrl(Uri.parse(
                                    'https://instagram.com/tanzaniatrailtours'));
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.music_note,
                                size: 30, color: Colors.black),
                            onPressed: () async {
                              if (await canLaunchUrl(Uri.parse(
                                  'https://tiktok.com/@tanzaniatrailtours'))) {
                                await launchUrl(Uri.parse(
                                    'https://tiktok.com/@tanzaniatrailtours'));
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.play_circle,
                                size: 30, color: Colors.red[600]),
                            onPressed: () async {
                              if (await canLaunchUrl(Uri.parse(
                                  'https://youtube.com/tanzaniatrailtours'))) {
                                await launchUrl(Uri.parse(
                                    'https://youtube.com/tanzaniatrailtours'));
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 32),

                // Contact Form
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Send us a Message',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Your Name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _subjectController,
                          decoration: InputDecoration(
                            labelText: 'Subject',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a subject';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            labelText: 'Message',
                            border: OutlineInputBorder(),
                            alignLabelWithHint: true,
                          ),
                          maxLines: 5,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your message';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _sendMessage();
                            }
                          },
                          child: Text('Send Message'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            padding: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
              // Already on contact screen
              break;
          }
        },
      ),
    );
  }

  Widget _buildContactItem(
      IconData icon, String title, String value, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 24),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 4),
                Text(value),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    // Here you would typically send the message to your backend
    // For now, we'll just show a confirmation dialog

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Message Sent'),
          content: Text(
              'Thank you for your message! We will respond to your inquiry within 24 hours.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _formKey.currentState!.reset();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
