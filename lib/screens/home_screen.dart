import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import '../widgets/bottom_navigation.dart';
import '../models/tour_data.dart';
import '../models/hidden_gems_data.dart';
import 'tour_detail_screen.dart';
import 'enhanced_booking_screen.dart';
import 'hidden_gem_detail_screen.dart';
// Removed unused import

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  // Background slideshow state
  final List<String> _heroImages = const [
    'assets/images/mji.png',
    'assets/images/safaris.png',
    'assets/images/bahari.png',
    'assets/images/simba.png',
    'assets/images/spices.png',
    'assets/images/safariblue.jpg',
    'assets/images/jua.png',
  ];
  int _currentHeroIndex = 0;
  Timer? _heroTimer;
  bool _scaleUp = false;
  bool _showZanzibarScrollHint = true;
  bool _showSafariScrollHint = true;
  bool _showGemScrollHint = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Precache hero slideshow images
    for (final path in _heroImages) {
      precacheImage(AssetImage(path), context);
    }
    // Precache Zanzibar tour images used on home cards (alltours folder + stone town)
    for (final path in const [
      'assets/images/alltours/dolphintour.jpg',
      'assets/images/alltours/kuzacave.jpg',
      'assets/images/alltours/jozani.jpg',
      'assets/images/alltours/townwalk.png',
    ]) {
      precacheImage(AssetImage(path), context);
    }

    _verifyZanzibarAssets();
  }

  Future<void> _verifyZanzibarAssets() async {
    const List<String> requiredAssets = [
      'assets/images/alltours/dolphintour.jpg',
      'assets/images/alltours/kuzacave.jpg',
      'assets/images/alltours/jozani.jpg',
      'assets/images/alltours/townwalk.png',
    ];
    for (final asset in requiredAssets) {
      try {
        await rootBundle.load(asset);
        // ignore: avoid_print
        print('[ASSET OK] ' + asset);
      } catch (e) {
        // ignore: avoid_print
        print('[ASSET MISSING] ' + asset + ' -> ' + e.toString());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _heroTimer = Timer.periodic(const Duration(seconds: 6), (timer) {
      if (!mounted) return;
      setState(() {
        _currentHeroIndex = (_currentHeroIndex + 1) % _heroImages.length;
        _scaleUp = !_scaleUp;
      });
    });
  }

  @override
  void dispose() {
    _heroTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(),
            _buildPopularToursAndSafaris(),
            _buildPopularHiddenGems(),
            _buildPricingSection(),
            _buildWhyChooseUs(),
            _buildTestimonials(),
            _buildContactSection(),
            // Add extra padding at bottom to prevent overflow
            SizedBox(height: 100),
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
              // Already on home screen
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

  Widget _buildHeroSection() {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          // Animated background slideshow
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1200),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              layoutBuilder: (currentChild, previousChildren) {
                return Stack(fit: StackFit.expand, children: <Widget>[
                  ...previousChildren,
                  if (currentChild != null)
                    Positioned.fill(child: currentChild),
                ]);
              },
              child: TweenAnimationBuilder<double>(
                key: ValueKey<int>(_currentHeroIndex),
                tween: Tween<double>(begin: 1.0, end: _scaleUp ? 1.08 : 1.0),
                duration: const Duration(seconds: 6),
                curve: Curves.easeInOut,
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: child,
                  );
                },
                child: SizedBox.expand(
                  child: Image.asset(
                    _heroImages[_currentHeroIndex],
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
          ),
          // Stronger overlay for text readability
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.55),
                    Colors.black.withOpacity(0.45),
                  ],
                ),
              ),
            ),
          ),
          // Content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                  ),
                  child: Icon(
                    Icons.beach_access,
                    size: 48,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Zanzibar Trail Tours',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  'Tours & Safaris with Prices (USD)',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                Text(
                  'Discover the magic of Zanzibar and Tanzania with our carefully curated tours. From historic Stone Town to the wild Serengeti, experience the best of East Africa.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final bool isCompact = constraints.maxWidth < 480;
                    final double horizontalPadding =
                        isCompact ? 16 : 32;
                    final double fontSize = isCompact ? 14 : 16;
                    final double spacing = isCompact ? 8 : 16;

                    Widget buildButton(Widget child) {
                      return Flexible(
                        child: child,
                      );
                    }

                    final exploreButton = ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/tours');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Theme.of(context).primaryColor,
                        padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        minimumSize: Size(0, 48),
                      ),
                      child: Text(
                        'Explore Tours',
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );

                    final hiddenGemsButton = ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/hidden-gems');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[600],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        minimumSize: Size(0, 48),
                      ),
                      child: Text(
                        'Hidden Gems',
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );

                    final bookNowButton = OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/booking');
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(color: Colors.white),
                        padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        minimumSize: Size(0, 48),
                      ),
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minWidth: constraints.maxWidth),
                        child: IntrinsicWidth(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: spacing),
                              buildButton(exploreButton),
                              SizedBox(width: spacing),
                              buildButton(hiddenGemsButton),
                              SizedBox(width: spacing),
                              buildButton(bookNowButton),
                              SizedBox(width: spacing),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularToursAndSafaris() {
    // Create the four scripted tours including Stone Town Walking Tour
    final List<_ScriptedItem> sampleTours = [
      _ScriptedItem(
        title: 'Dolphin Tour, Jozani Forest and Spice Plantation (8 Hours)',
        subtitle:
            'Search for dolphins in Kizimkazi, walk among Red Colobus monkeys in Jozani, and explore spices.',
        price: 'From \$160',
        featured: false,
        categoryAccent: Colors.green[700],
        imagePath: 'assets/images/alltours/dolphintour.jpg',
      ),
      _ScriptedItem(
        title: 'Kendwa Beach Sunset Cruise (90 Minutes)',
        subtitle: 'Golden-hour views along one of Zanzibar\'s best beaches.',
        price: 'From \$160',
        featured: false,
        categoryAccent: Colors.green[700],
        imagePath: 'assets/images/alltours/sunsetcruise.jpg',
      ),
      _ScriptedItem(
        title: 'Jozani Forest, Dolphin Tour & The Rock Restaurant (1 Day)',
        subtitle:
            'A day of wildlife and ocean activities capped with a scenic meal at The Rock.',
        price: 'From \$150',
        featured: false,
        categoryAccent: Colors.green[700],
        imagePath: 'assets/images/alltours/jozani.jpg',
      ),
      _ScriptedItem(
        title: 'Stone Town Walking Tour',
        subtitle:
            'Explore the historic alleys, House of Wonders, and Old Fort of this UNESCO World Heritage Site.',
        price: '20 – 40 USD pp',
        featured: false,
        categoryAccent: Colors.green[700],
        imagePath: 'assets/images/alltours/townwalk.png',
      ),
    ];

    final sampleSafaris = [
      'mikumi_day_trip',
      'tarangire_ngorongoro_2day',
      'selous_day_trip',
      'five_days_safari',
    ].map((id) => TourData.getTourById(id)).whereType<TourDetail>().toList();

    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Tours, Safaris & Hidden Gems',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Our popular Zanzibar tours and Tanzania safaris',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 24),

          // Zanzibar Tours Section
          Text(
            'Zanzibar Tours',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: 16),
          _buildHorizontalScrollContainer(
            height: 440,
            showHint: _showZanzibarScrollHint,
            hintLabel: 'Swipe to explore tours',
            onScrolled: () {
              if (_showZanzibarScrollHint) {
                setState(() {
                  _showZanzibarScrollHint = false;
                });
              }
            },
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sampleTours.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 320,
                  margin: EdgeInsets.only(right: 16),
                  child: _buildHorizontalScriptedCard(sampleTours[index]),
                );
              },
            ),
          ),

          SizedBox(height: 32),

          // Tanzania Safaris Section
          Text(
            'Tanzania Safaris',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.orange[700],
            ),
          ),
          SizedBox(height: 16),
          _buildHorizontalScrollContainer(
            height: 440,
            showHint: _showSafariScrollHint,
            hintLabel: 'Swipe to browse safaris',
            onScrolled: () {
              if (_showSafariScrollHint) {
                setState(() {
                  _showSafariScrollHint = false;
                });
              }
            },
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sampleSafaris.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 320,
                  margin: EdgeInsets.only(right: 16),
                  child:
                      _buildHorizontalTourCard(sampleSafaris[index], 'safari'),
                );
              },
            ),
          ),

          SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tours');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'View All Tours',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularHiddenGems() {
    // Get sample hidden gems from different categories
    final sampleGems = [
      HiddenGemsData.natureSpots.first,
      HiddenGemsData.culturalExperiences.first,
      HiddenGemsData.offbeatBeaches.first,
      HiddenGemsData.historicalSites.first,
    ];

    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Hidden Gems of Zanzibar',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Discover Zanzibar beyond the usual tourist spots',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 24),
          _buildHorizontalScrollContainer(
            height: 460,
            showHint: _showGemScrollHint,
            hintLabel: 'Swipe to see more gems',
            onScrolled: () {
              if (_showGemScrollHint) {
                setState(() {
                  _showGemScrollHint = false;
                });
              }
            },
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sampleGems.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 300,
                  margin: EdgeInsets.only(right: 16),
                  child: _buildHorizontalGemCard(sampleGems[index]),
                );
              },
            ),
          ),
          SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/hidden-gems');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[600],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Explore All Hidden Gems',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalTourCard(TourDetail tour, String type) {
    final isSafari = type == 'safari';
    final categoryColor = isSafari ? Colors.orange[700]! : Colors.green[700]!;
    final String imagePath = tour.imagePath;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tour Image
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                gaplessPlayback: true,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.broken_image_outlined,
                          size: 60,
                          color: Colors.grey[600],
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            imagePath,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[700],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Badge
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: categoryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: categoryColor.withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      isSafari ? 'Safari' : 'Tour',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: categoryColor,
                      ),
                    ),
                  ),

                  SizedBox(height: 8),

                  // Title
                  Text(
                    tour.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 8),

                  // Description
                  Expanded(
                    child: Text(
                      tour.description,
                      style: TextStyle(
                        fontSize:
                            13, // Increased font size for better readability
                        color: Colors.grey[600],
                        height: 1.4, // Increased line height
                      ),
                      maxLines: 5, // Increased from 4 to 5
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  SizedBox(height: 12),

                  // Price
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: categoryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      tour.price,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: categoryColor,
                      ),
                    ),
                  ),

                  SizedBox(height: 12),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    TourDetailScreen(tourId: tour.id),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10), // Increased padding
                            decoration: BoxDecoration(
                              border: Border.all(color: categoryColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                '→ Learn More',
                                style: TextStyle(
                                  color: categoryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13, // Increased font size
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to enhanced booking screen with pre-selected safari
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EnhancedBookingScreen(
                                  tourId: tour.id,
                                  entityType: isSafari ? 'safari' : 'tour',
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10), // Increased padding
                            decoration: BoxDecoration(
                              color: categoryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'Book Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13, // Increased font size
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalGemCard(HiddenGem gem) {
    final categoryColor = _getGemCategoryColor(gem.category);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gem Image
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                gem.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.image,
                      size: 60,
                      color: Colors.grey[600],
                    ),
                  );
                },
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Badge
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: categoryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: categoryColor.withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      gem.category,
                      style: TextStyle(
                        fontSize: 11, // Slightly increased font size
                        fontWeight: FontWeight.bold,
                        color: categoryColor,
                      ),
                    ),
                  ),

                  SizedBox(height: 8),

                  // Title
                  Text(
                    gem.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 8),

                  // Description
                  Expanded(
                    child: Text(
                      gem.description,
                      style: TextStyle(
                        fontSize:
                            13, // Increased font size for better readability
                        color: Colors.grey[600],
                        height: 1.4, // Increased line height
                      ),
                      maxLines: 4, // Increased from 3 to 4
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  SizedBox(height: 8),

                  // Highlights
                  Text(
                    'Highlights:',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 4),
                  Expanded(
                    child: Text(
                      gem.highlights,
                      style: TextStyle(
                        fontSize: 12, // Increased font size
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                        height: 1.3, // Added line height
                      ),
                      maxLines: 4, // Increased from 3 to 4
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  SizedBox(height: 12),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HiddenGemDetailScreen(
                                  gemId: gem.id,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10), // Increased padding
                            decoration: BoxDecoration(
                              border: Border.all(color: categoryColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'Learn More',
                                style: TextStyle(
                                  color: categoryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13, // Increased font size
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to enhanced booking screen with pre-selected hidden gem
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
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10), // Increased padding
                            decoration: BoxDecoration(
                              color: categoryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'Book Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13, // Increased font size
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getGemCategoryColor(String category) {
    switch (category) {
      case 'Nature & Secluded Spots':
        return Colors.green[700]!;
      case 'Cultural & Local Experiences':
        return Colors.orange[700]!;
      case 'Offbeat Beaches':
        return Colors.blue[700]!;
      case 'Historical & Spiritual Sites':
        return Colors.purple[700]!;
      default:
        return Colors.grey[700]!;
    }
  }

  Widget _buildHorizontalScrollContainer({
    required double height,
    required Widget child,
    required bool showHint,
    required String hintLabel,
    required VoidCallback onScrolled,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool enableHints = constraints.maxWidth < 900;
        final bool displayHint = enableHints && showHint;
        return SizedBox(
          height: height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (!displayHint) return false;
                  if (notification.metrics.pixels > 8) {
                    onScrolled();
                  }
                  return false;
                },
                child: child,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedOpacity(
                  opacity: displayHint ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: _buildScrollHintChip(hintLabel),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildScrollHintChip(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.65),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.swipe, size: 16, color: Colors.white70),
          SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              letterSpacing: 0.2,
            ),
          ),
          SizedBox(width: 6),
          Icon(Icons.keyboard_double_arrow_right,
              size: 16, color: Colors.white70),
        ],
      ),
    );
  }

  Widget _buildPricingSection() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey[50],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tour Price Ranges',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 24),
          _buildPriceCategory('Zanzibar Tours & Excursions', [
            'Stone Town Walking Tour: 20 – 40 USD pp',
            'Spice Farm Tour: 15 – 50 USD pp (Private ~100 USD/2pax)',
            'Prison Island (Changuu): 25 – 40 USD pp',
            'Jozani Forest Tour: 25 – 45 USD pp',
            'Nakupenda Sandbank: 40 – 65 USD pp',
            'Safari Blue (Full Day): 65 USD pp (group), Private ~450 USD (up to 6pax)',
            'Mnemba Atoll Snorkeling: 40 – 60 USD pp',
            'Dolphin Tour (Kizimkazi): 30 – 50 USD pp',
            'Sunset Dhow Cruise: 30 – 50 USD pp',
            'Deep Sea Fishing: 450 – 600 USD / boat (shared costs)',
            'Kite Surfing (lessons): 50 – 100 USD pp',
            'Scuba Diving (2 dives): 120 – 150 USD pp',
          ]),
          SizedBox(height: 24),
          _buildPriceCategory('Tanzania Mainland Safaris', [
            'Ngorongoro Crater (Day Trip from Zanzibar): 790 – 1,276 USD pp',
            'Ngorongoro (Per Day estimate): 500 – 1,360 USD pp',
            'Serengeti (3-Day Mid-Range): 450 – 1,700 USD pp',
            'Serengeti (Per Day): 200 USD (budget) – 600+ USD (luxury)',
            '2-Day Safari (from Zanzibar): 818+ USD pp',
            '3–5 Day Safari (Serengeti + Ngorongoro): 1,500 – 3,500 USD pp',
            'Luxury Safaris: Up to 5,000+ USD pp',
          ]),
        ],
      ),
    );
  }

  Widget _buildPriceCategory(String title, List<String> prices) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: 16),
          ...prices
              .map((price) => Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle,
                            color: Colors.green[600], size: 16),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            price,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildWhyChooseUs() {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Why Choose Zanzibar Trail Tours?',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 24),
          _buildFeatureCard(
            Icons.star,
            'Expert Guides',
            'Our experienced local guides ensure authentic and informative experiences',
            Colors.amber[600]!,
          ),
          _buildFeatureCard(
            Icons.security,
            'Safe & Reliable',
            'Licensed operators with comprehensive safety measures and insurance',
            Colors.green[600]!,
          ),
          _buildFeatureCard(
            Icons.people,
            'Small Groups',
            'Intimate experiences with personalized attention and flexible itineraries',
            Colors.blue[600]!,
          ),
          _buildFeatureCard(
            Icons.local_offer,
            'Best Prices',
            'Competitive pricing with no hidden fees and transparent cost breakdown',
            Colors.purple[600]!,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
      IconData icon, String title, String description, Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
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
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
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

  Widget _buildTestimonials() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.05),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What Our Guests Say',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 24),
          _buildTestimonialCard(
            'Amazing experience! The Stone Town tour was incredible and our guide was so knowledgeable. Highly recommend!',
            'Sarah M.',
            '⭐⭐⭐⭐⭐',
          ),
          _buildTestimonialCard(
            'The Safari Blue tour exceeded all expectations. The snorkeling was breathtaking and the lunch was delicious.',
            'Michael R.',
            '⭐⭐⭐⭐⭐',
          ),
          _buildTestimonialCard(
            'Professional service from start to finish. The Serengeti safari was a once-in-a-lifetime experience.',
            'Emma L.',
            '⭐⭐⭐⭐⭐',
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(String review, String name, String rating) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            rating,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            review,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.5,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 12),
          Text(
            '- $name',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.8),
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Ready to Start Your Adventure?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            'Contact us to book your perfect Zanzibar tour or Tanzania safari',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.9),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              final bool isCompact = constraints.maxWidth < 480;
              final double horizontalPadding =
                  isCompact ? 16 : 32;
              final double fontSize = isCompact ? 14 : 16;
              final double spacing = isCompact ? 8 : 16;

              Widget buildButton(Widget child) {
                return Flexible(child: child);
              }

              final contactButton = ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/contact');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).primaryColor,
                  padding:
                      EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(0, 48),
                ),
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );

              final bookButton = ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/booking');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  side: BorderSide(color: Colors.white),
                  padding:
                      EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(0, 48),
                ),
                child: Text(
                  'Book Now',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );

              final aboutButton = ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  side: BorderSide(color: Colors.white),
                  padding:
                      EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: Size(0, 48),
                ),
                child: Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth),
                  child: IntrinsicWidth(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: spacing),
                        buildButton(contactButton),
                        SizedBox(width: spacing),
                        buildButton(bookButton),
                        SizedBox(width: spacing),
                        buildButton(aboutButton),
                        SizedBox(width: spacing),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalScriptedCard(_ScriptedItem item) {
    final categoryColor = Colors.green[700]!;
    final String imagePath = item.imagePath ?? _imageForScriptedItem(item);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tour Image
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                gaplessPlayback: true,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.broken_image_outlined,
                          size: 60,
                          color: Colors.grey[600],
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            imagePath,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[700],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Badge
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: categoryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: categoryColor.withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      'Tour',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: categoryColor,
                      ),
                    ),
                  ),

                  SizedBox(height: 8),

                  // Title
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: 8),

                  // Description
                  Expanded(
                    child: Text(
                      item.subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  SizedBox(height: 12),

                  // Price
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: categoryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item.price,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: categoryColor,
                      ),
                    ),
                  ),

                  SizedBox(height: 12),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _navigateToTourDetail(item);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: categoryColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                '→ Learn More',
                                style: TextStyle(
                                  color: categoryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _navigateToBooking(item);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: categoryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'Book Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _imageForScriptedItem(_ScriptedItem item) {
    final title = item.title.toLowerCase();
    if (title.contains('stone')) return 'assets/images/alltours/townwalk.png';
    if (title.contains('dolphin'))
      return 'assets/images/alltours/dolphintour.jpg';
    if (title.contains('jozani')) return 'assets/images/alltours/jozani.jpg';
    if (title.contains('rock') || title.contains('kuza')) {
      return 'assets/images/alltours/kuzacave.jpg';
    }
    return 'assets/images/alltours/jozani.jpg';
  }

  void _navigateToTourDetail(_ScriptedItem item) {
    // Map scripted tours to existing TourDetail objects
    String? tourId;

    if (item.title.contains('Stone Town Walking Tour')) {
      tourId = 'stone_town';
    } else if (item.title.contains('Kendwa Beach Sunset Cruise')) {
      tourId = 'kendwa_sunset';
    } else if (item.title
        .contains('Dolphin Tour, Jozani Forest and Spice Plantation')) {
      // Map to dolphin tour as it's the closest match
      tourId = 'dolphin_tour';
    } else if (item.title.contains(
        'Visit to Jozani Forest, The Rock Restaurant and Kuza Cave')) {
      // Map to jozani forest as it's the closest match
      tourId = 'jozani_forest';
    } else if (item.title
        .contains('Jozani Forest, Dolphin Tour & The Rock Restaurant')) {
      // Map to jozani forest as it's the closest match
      tourId = 'jozani_forest';
    }

    if (tourId != null) {
      // Navigate to the specific tour detail
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TourDetailScreen(tourId: tourId!),
        ),
      );
    } else {
      // Fallback to tours page if no match found
      Navigator.pushNamed(context, '/tours');
    }
  }

  void _navigateToBooking(_ScriptedItem item) {
    // Map scripted tours to existing TourDetail objects for booking
    String? tourId;
    String entityType = 'tour';

    if (item.title.contains('Stone Town Walking Tour')) {
      tourId = 'stone_town';
    } else if (item.title.contains('Kendwa Beach Sunset Cruise')) {
      tourId = 'kendwa_sunset';
    } else if (item.title
        .contains('Dolphin Tour, Jozani Forest and Spice Plantation')) {
      tourId = 'dolphin_tour';
    } else if (item.title.contains(
        'Visit to Jozani Forest, The Rock Restaurant and Kuza Cave')) {
      tourId = 'jozani_forest';
    } else if (item.title
        .contains('Jozani Forest, Dolphin Tour & The Rock Restaurant')) {
      tourId = 'jozani_forest';
    }

    if (tourId != null) {
      // Navigate to enhanced booking screen with pre-selected tour
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EnhancedBookingScreen(
            tourId: tourId,
            entityType: entityType,
          ),
        ),
      );
    } else {
      // Fallback to general booking screen
      Navigator.pushNamed(context, '/booking');
    }
  }
}

class _ScriptedItem {
  final String title;
  final String subtitle;
  final String price;
  final bool featured;
  final Color? categoryAccent;
  final String? imagePath;

  _ScriptedItem({
    required this.title,
    required this.subtitle,
    required this.price,
    this.featured = false,
    this.categoryAccent,
    this.imagePath,
  });
}
