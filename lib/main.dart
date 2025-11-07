import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/tours_screen.dart';
import 'screens/about_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/gallery_screen.dart';
import 'screens/testimonials_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/tour_detail_screen.dart';
import 'screens/hidden_gems_screen.dart';
import 'screens/booking_demo_screen.dart';
import 'widgets/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zanzibar Trail Tours',
      theme: ThemeData(
        primaryColor: const Color(0xFF00695C), // Ocean teal
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00695C),
          secondary: const Color(0xFFFF9800), // Sunset orange
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          displayMedium: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00695C)),
          displaySmall: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF00695C)),
          bodyLarge:
              TextStyle(fontSize: 16, color: Color(0xFF424242), height: 1.5),
          labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/tours': (context) => ToursScreen(),
        '/about': (context) => AboutScreen(),
        '/booking': (context) => BookingScreen(),
        '/gallery': (context) => GalleryScreen(),
        '/testimonials': (context) => TestimonialsScreen(),
        '/contact': (context) => ContactScreen(),
        '/tour-detail': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return TourDetailScreen(tourId: args['tourId']);
        },
        '/hidden-gems': (context) => HiddenGemsScreen(),
        '/booking-demo': (context) => BookingDemoScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
