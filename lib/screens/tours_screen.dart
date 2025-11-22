import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';
import '../models/tour_data.dart';
import 'tour_detail_screen.dart';
import 'enhanced_booking_screen.dart';

class ToursScreen extends StatefulWidget {
  @override
  _ToursScreenState createState() => _ToursScreenState();
}

class _ToursScreenState extends State<ToursScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 1;

  // Filter state
  String _selectedLocation = 'All';
  String _selectedDuration = 'All';
  String _selectedActivity = 'All';
  String _selectedPrice = 'All';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zanzibar Trail Tours',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Zanzibar Tours'),
            Tab(text: 'Safaris'),
            Tab(text: 'How to Get There'),
          ],
          indicatorColor: Theme.of(context).colorScheme.secondary,
          labelStyle:
              TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.7)),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white.withOpacity(0.7),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildZanzibarToursTab(),
          _buildSafarisTab(),
          _buildTravelGuideTab(),
        ],
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
              // Already on tours screen
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

  Widget _buildZanzibarToursTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderSection(
            'View All Tours',
            'Browse our complete collection of unforgettable experiences in Tanzania.',
            Icons.travel_explore,
          ),
          _buildFiltersToolbar(),
          SizedBox(height: 24),
          _buildSectionTitle('Zanzibar Island Tours & Activities'),
          _buildSubsectionTitle('Zanzibar Day Trips & Cultural Experiences'),
          _buildResponsiveGrid<_ScriptedItem>(
              _getFilteredZanzibarCultural(), _buildScriptedCard),
          SizedBox(height: 16),
          _buildSubsectionTitle('Zanzibar Aquatic & Beach Adventures'),
          _buildResponsiveGrid<_ScriptedItem>(
              _getFilteredZanzibarAquatic(), _buildScriptedCard),
          SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSafarisTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderSection(
            'Mainland Safari Adventures',
            'Wildlife safaris across Tanzania\'s world-famous parks and reserves.',
            Icons.camera_alt,
          ),
          _buildFiltersToolbar(),
          SizedBox(height: 24),
          _buildSectionTitle(
              'Northern Circuit Safaris (Serengeti, Ngorongoro, Tarangire)'),
          _buildResponsiveGrid<_ScriptedItem>(
              _getFilteredNorthernSafaris(), _buildScriptedCard),
          SizedBox(height: 16),
          _buildSectionTitle('Southern Circuit Safaris (Selous, Mikumi)'),
          _buildResponsiveGrid<_ScriptedItem>(
              _getFilteredSouthernSafaris(), _buildScriptedCard),
          SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildTravelGuideTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderSection(
            'How to Get There',
            'Comprehensive guide for reaching Zanzibar tours and Tanzania mainland safaris',
            Icons.map,
          ),
          SizedBox(height: 24),
          _buildTravelSection('Zanzibar Tours & Excursions'),
          SizedBox(height: 16),
          ...TourData.zanzibarTours
              .map((tour) => _buildTravelCard(
                    tour.title,
                    tour.location,
                    tour.howToGetThere,
                    tour.travelTime,
                  ))
              .toList(),
          SizedBox(height: 32),
          _buildTravelSection('Tanzania Mainland Safaris'),
          SizedBox(height: 16),
          ...TourData.safariTours
              .map((tour) => _buildSafariTravelCard(
                    tour.title,
                    tour.location,
                    tour.howToGetThere,
                    tour.travelTime,
                  ))
              .toList(),
          SizedBox(height: 24),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue[200]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.info, color: Colors.blue[700]),
                    SizedBox(width: 8),
                    Text(
                      'Travel Tips',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  '• Most tours include hotel pickups\n• For mainland safaris, flights or private 4×4 transfers are recommended\n• Plan early for dolphin tours, Safari Blue, and sunrise wildlife drives\n• Book in advance for peak season (July-September)',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue[800],
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderSection(String title, String subtitle, IconData icon) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.8)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTravelSection(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildTravelCard(
      String tour, String location, String transport, String time) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
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
            tour,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  location,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.directions_car, size: 16, color: Colors.grey[600]),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  transport,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
              SizedBox(width: 4),
              Text(
                time,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSafariTravelCard(
      String safari, String location, String transport, String notes) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
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
            safari,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  location,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.flight, size: 16, color: Colors.grey[600]),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  transport,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.info_outline, size: 16, color: Colors.grey[600]),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  notes,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFiltersToolbar() {
    final hasActiveFilters = _selectedLocation != 'All' ||
        _selectedDuration != 'All' ||
        _selectedActivity != 'All' ||
        _selectedPrice != 'All';

    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.tune, size: 20, color: Colors.grey[700]),
              SizedBox(width: 8),
              Text(
                'Filter Tours',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              Spacer(),
              if (hasActiveFilters)
                TextButton.icon(
                  onPressed: _clearAllFilters,
                  icon: Icon(Icons.clear_all, size: 16),
                  label: Text('Clear All'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red[600],
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                ),
            ],
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildFilterChip(Icons.place, 'Location', _selectedLocation,
                  _showLocationFilter),
              _buildFilterChip(Icons.timelapse, 'Duration', _selectedDuration,
                  _showDurationFilter),
              _buildFilterChip(Icons.category, 'Activity', _selectedActivity,
                  _showActivityFilter),
              _buildFilterChip(Icons.attach_money, 'Price', _selectedPrice,
                  _showPriceFilter),
            ],
          ),
          if (hasActiveFilters) ...[
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: Theme.of(context).primaryColor.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline,
                      size: 16, color: Theme.of(context).primaryColor),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '${_getActiveFiltersCount()} filter(s) applied',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFilterChip(
      IconData icon, String label, String selectedValue, VoidCallback onTap) {
    final bool isSelected = selectedValue != 'All';
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor.withOpacity(0.1)
              : Colors.grey[50],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Colors.grey.withOpacity(0.2),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                size: 16,
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.grey[700]),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.grey[800]),
            ),
            SizedBox(width: 6),
            Icon(Icons.tune,
                size: 16,
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.grey[600]),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.grey[800],
        ),
      ),
    );
  }

  Widget _buildSubsectionTitle(String title) {
    return Container(
      margin: EdgeInsets.only(top: 12, bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Widget _buildScriptedCard(_ScriptedItem item) {
    final String imagePath = item.imagePath ?? _imageForItem(item);
    final Color accent = item.categoryAccent ?? Theme.of(context).primaryColor;
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 10,
                  child: Image.asset(
                    imagePath,
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
              if (item.featured)
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.amber[600],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, size: 14, color: Colors.white),
                        SizedBox(width: 4),
                        Text('Featured',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6),
                Text(
                  item.subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: accent.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    item.price,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: accent,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        // Map scripted item titles to actual tour IDs
                        String tourId = _getTourIdFromTitle(item.title);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TourDetailScreen(tourId: tourId),
                          ),
                        );
                      },
                      icon: Icon(Icons.info_outline, size: 16),
                      label: Text('Learn More'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue[700],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _navigateToBooking(item);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Book Now'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _imageForItem(_ScriptedItem item) {
    final title = item.title.toLowerCase();
    if (title.contains('stone') || title.contains('prison'))
      return 'assets/images/stonetown-walking.png';
    if (title.contains('spice') || title.contains('cooking'))
      return 'assets/images/spice-tour.png';
    if (title.contains('mnemba') ||
        title.contains('safari blue') ||
        title.contains('sandbank')) {
      return 'assets/images/safariblue.jpg';
    }
    if (title.contains('jozani')) return 'assets/images/jozani.jpg';
    if (title.contains('dolphin') ||
        title.contains('kendwa') ||
        title.contains('beach')) {
      return 'assets/images/bahari.png';
    }
    if (title.contains('selous') || title.contains('mikumi'))
      return 'assets/images/safaris.png';
    if (title.contains('ngorongoro') ||
        title.contains('serengeti') ||
        title.contains('safari')) return 'assets/images/simba.png';
    return 'assets/images/mji.png';
  }

  List<_ScriptedItem> _buildScriptedZanzibarCultural() {
    return [
      _ScriptedItem(
        title: 'Prison Island, Stone Town Tour and Spice Plantation (1 Day)',
        subtitle:
            'A perfect cultural combo: historic Stone Town, Aldabra tortoises on Prison Island, and aromatic Spice Farm visit.',
        price: 'From \$170',
        featured: false,
        categoryAccent: Colors.green[700],
        imagePath: 'assets/images/alltours/prison&stonetown.jpg',
      ),
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
        title:
            'Visit to Jozani Forest, The Rock Restaurant and Kuza Cave (1 Day)',
        subtitle:
            'Nature and culinary adventure with a stop at the iconic oceanfront Rock Restaurant and Kuza Cave.',
        price: 'From \$150',
        featured: false,
        categoryAccent: Colors.green[700],
        imagePath: 'assets/images/alltours/kuzacave.jpg',
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
        title: 'Zanzibar Cooking Class and Spice Tour',
        subtitle:
            'Hands-on traditional cooking class paired with an aromatic spice plantation tour.',
        price: 'From \$110',
        featured: false,
        categoryAccent: Colors.green[700],
        imagePath: 'assets/images/alltours/cookingclass.jpg',
      ),
      _ScriptedItem(
        title: 'Turtle Sanctuary and Northern Beaches (1 Day)',
        subtitle:
            'Meet sea turtles and relax on Zanzibar\'s famous northern beaches like Nungwi and Kendwa.',
        price: 'From \$150',
        featured: false,
        categoryAccent: Colors.green[700],
        imagePath: 'assets/images/alltours/turtlesunctuary.webp',
      ),
      _ScriptedItem(
        title: 'Quad bike excursion and visit to a local village (4 Hours)',
        subtitle:
            'Ride through rural trails and experience authentic village life on this guided excursion.',
        price: 'From \$110',
        featured: false,
        categoryAccent: Colors.green[700],
        imagePath: 'assets/images/alltours/quadbike.jpeg',
      ),
      _ScriptedItem(
        title: 'Horse riding in Nungwi',
        subtitle:
            'Scenic beachside horse riding suited for all experience levels.',
        price: 'Featured',
        featured: true,
        categoryAccent: Colors.green[700],
        imagePath: 'assets/images/alltours/horseriding.jpg',
      ),
    ];
  }

  List<_ScriptedItem> _buildScriptedZanzibarAquatic() {
    return [
      _ScriptedItem(
        title: 'Full Day Mnemba Island Tour (1 Day)',
        subtitle:
            'Snorkel the famed reefs of Mnemba with pristine beaches and marine life.',
        price: 'From \$450',
        featured: false,
        categoryAccent: Colors.blue[700],
        imagePath: 'assets/images/alltours/fulldaymnemba.jpg',
      ),
      _ScriptedItem(
        title: 'Half Day Mnemba Island Tour (6 Hours)',
        subtitle:
            'A compact snorkeling adventure with crystal-clear waters and coral gardens.',
        price: 'From \$150',
        featured: false,
        categoryAccent: Colors.blue[700],
        imagePath: 'assets/images/alltours/halfdaymnemba.jpg',
      ),
      _ScriptedItem(
        title: 'Safari Blue Trip (1 Day)',
        subtitle:
            'Sail a traditional dhow with multiple snorkeling stops, sandbanks, and a seafood lunch.',
        price: 'From \$150',
        featured: false,
        categoryAccent: Colors.blue[700],
        imagePath: 'assets/images/alltours/safariblue.jpg',
      ),
      _ScriptedItem(
        title:
            'Salaam Cave, Mtende Beach & Dolphin Tour in Kizimkazi (10 Hours)',
        subtitle:
            'Epic ocean day with cave, beach vistas, and dolphin spotting in Kizimkazi.',
        price: 'From \$200',
        featured: true,
        categoryAccent: Colors.blue[700],
        imagePath: 'assets/images/alltours/salaamcave.jpg',
      ),
      _ScriptedItem(
        title: 'Nakupenda, Prison Island & Stone Town Tour (Combo) (10 Hours)',
        subtitle:
            'A premium combo of sandbank, island wildlife, and cultural history in Stone Town.',
        price: 'From \$250',
        featured: true,
        categoryAccent: Colors.blue[700],
        imagePath: 'assets/images/alltours/nakupenda.jpg',
      ),
      _ScriptedItem(
        title: 'Kendwa Beach Sunset Cruise (90 Minutes)',
        subtitle: 'Golden-hour views along one of Zanzibar\'s best beaches.',
        price: 'From \$160',
        featured: false,
        categoryAccent: Colors.blue[700],
        imagePath: 'assets/images/alltours/sunsetcruise.jpg',
      ),
      _ScriptedItem(
        title: 'Sunset Dinner at Kendwa Beach (2 Hours)',
        subtitle: 'Romantic seaside dining experience at sunset.',
        price: 'From \$250',
        featured: false,
        categoryAccent: Colors.blue[700],
        imagePath: 'assets/images/alltours/sunsetkendwa.jpg',
      ),
    ];
  }

  List<_ScriptedItem> _buildScriptedNorthernSafaris() {
    return [
      _ScriptedItem(
        title:
            '8 Days River Crossing – Wildebeest Migration Safari (8 Days) - Serengeti',
        subtitle:
            'Witness the legendary migration and apex predators in action.',
        price: 'Featured',
        featured: true,
        categoryAccent: Colors.orange[700],
        imagePath: 'assets/images/alltours/migrationsafari.jpg',
      ),
      _ScriptedItem(
        title: 'Unforgettable 6-Day Tanzania Safari Adventure (6 Days)',
        subtitle:
            'Balanced itinerary across highlights of the Northern Circuit.',
        price: 'Featured',
        featured: true,
        categoryAccent: Colors.orange[700],
        imagePath: 'assets/images/alltours/safariadventure.jpg',
      ),
      _ScriptedItem(
        title: '5-Days Safari Adventure (5 Days)',
        subtitle: 'Flexible game drives and accommodation options.',
        price: 'Featured',
        featured: true,
        categoryAccent: Colors.orange[700],
        imagePath: 'assets/images/alltours/besttime.jpg',
      ),
      _ScriptedItem(
        title: '4 days migration calving season safari (4 Days)',
        subtitle:
            'Prime time for predator sightings and new life on the plains.',
        price: 'Featured',
        featured: true,
        categoryAccent: Colors.orange[700],
        imagePath: 'assets/images/alltours/calving.jpg',
      ),
      _ScriptedItem(
        title: '4 Days Safari in Tarangire, Serengeti and Ngorongoro (4 Days)',
        subtitle: 'Elephants, big cats, and crater landscapes in one trip.',
        price: 'Featured',
        featured: true,
        categoryAccent: Colors.orange[700],
        imagePath: 'assets/images/alltours/tarangire.webp',
      ),
      _ScriptedItem(
        title: '2-Day Tarangire & Ngorongoro Crater from Zanzibar (2 Days)',
        subtitle: 'Short but mighty fly-in safari from the islands.',
        price: 'Featured',
        featured: true,
        categoryAccent: Colors.orange[700],
        imagePath: 'assets/images/alltours/ngorongoro.jpg',
      ),
      _ScriptedItem(
        title: '3-Day Luxury Fly in, Fly out Safari (3 Days)',
        subtitle: 'Top-tier lodges and exclusive wildlife encounters.',
        price: 'Featured',
        featured: true,
        categoryAccent: Colors.orange[700],
        imagePath: 'assets/images/alltours/4dayssafari.jpg',
      ),
    ];
  }

  List<_ScriptedItem> _buildScriptedSouthernSafaris() {
    return [
      _ScriptedItem(
        title: '4 Days / 3 Nights Selous Safari (4 Days)',
        subtitle: 'Boat, walking, and classic game drives in the Selous.',
        price: 'Featured',
        featured: true,
        categoryAccent: Colors.orange[700],
        imagePath: 'assets/images/alltours/seloussafari.jpg',
      ),
      _ScriptedItem(
        title: '3 Days Selous Safari (3 Days)',
        subtitle: 'Immersive bush experience with diverse habitats.',
        price: 'From \$650',
        featured: false,
        categoryAccent: Colors.orange[700],
        imagePath: 'assets/images/alltours/3daysselous.jpg',
      ),
      _ScriptedItem(
        title: '2 Days Selous Safari (2 Days)',
        subtitle: 'Quick escape to the wild with river safaris.',
        price: 'From \$650',
        featured: false,
        categoryAccent: Colors.orange[700],
        imagePath: 'assets/images/alltours/2daysselous.webp',
      ),
      _ScriptedItem(
        title: 'Selous Safari Day trip (1 Day)',
        subtitle: 'Day outing tracking wildlife along the Rufiji River.',
        price: 'From \$420',
        featured: false,
        categoryAccent: Colors.orange[700],
        imagePath: 'assets/images/alltours/seloussafaritrip.jpg',
      ),
      _ScriptedItem(
        title: 'Mikumi Day Trip (1 Day)',
        subtitle:
            'Savannah landscapes and abundant wildlife near Dar es Salaam.',
        price: 'From \$420',
        featured: false,
        categoryAccent: Colors.orange[700],
        imagePath: 'assets/images/alltours/mikumidaytrip.jpeg',
      ),
    ];
  }

  Widget _buildResponsiveGrid<T>(
      List<T> items, Widget Function(T item) itemBuilder) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        int crossAxisCount = 1;
        double childAspectRatio = 0.80; // more height to avoid overflow
        if (width >= 1200) {
          crossAxisCount = 4;
          childAspectRatio = 0.70; // taller cells on wide screens
        } else if (width >= 900) {
          crossAxisCount = 3;
          childAspectRatio = 0.72;
        } else if (width >= 600) {
          crossAxisCount = 2;
          childAspectRatio = 0.75;
        } else {
          crossAxisCount = 1;
          childAspectRatio = 0.80;
        }
        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) => itemBuilder(items[index]),
        );
      },
    );
  }

  // Filter methods
  void _showLocationFilter() async {
    final selection = await _openFilterBottomSheet(
      title: 'Location',
      options: [
        'All',
        'Stone Town',
        'Nungwi',
        'Paje',
        'Kizimkazi',
        'Jozani',
        'Mnemba',
        'Serengeti',
        'Ngorongoro',
        'Selous',
        'Mikumi'
      ],
      initialValue: _selectedLocation,
    );
    if (selection != null) {
      setState(() => _selectedLocation = selection);
    }
  }

  void _showDurationFilter() async {
    final selection = await _openFilterBottomSheet(
      title: 'Duration',
      options: [
        'All',
        'Half Day',
        'Full Day',
        '2 Days',
        '3 Days',
        '4 Days',
        '5 Days',
        '6 Days',
        '8 Days'
      ],
      initialValue: _selectedDuration,
    );
    if (selection != null) {
      setState(() => _selectedDuration = selection);
    }
  }

  void _showActivityFilter() async {
    final selection = await _openFilterBottomSheet(
      title: 'Activity',
      options: [
        'All',
        'Cultural',
        'Wildlife',
        'Beach',
        'Snorkeling',
        'Safari',
        'Cooking',
        'Walking',
        'Boat'
      ],
      initialValue: _selectedActivity,
    );
    if (selection != null) {
      setState(() => _selectedActivity = selection);
    }
  }

  void _showPriceFilter() async {
    final selection = await _openFilterBottomSheet(
      title: 'Price Range',
      options: [
        'All',
        'Under \$150',
        '\$150 - \$300',
        '\$300 - \$500',
        'Over \$500',
        'Featured'
      ],
      initialValue: _selectedPrice,
    );
    if (selection != null) {
      setState(() => _selectedPrice = selection);
    }
  }

  Future<String?> _openFilterBottomSheet({
    required String title,
    required List<String> options,
    required String initialValue,
  }) {
    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        String tempSelection = initialValue;
        return StatefulBuilder(
          builder: (context, setModalState) {
            return _buildFilterBottomSheet(
              title,
              options,
              tempSelection,
              (value) => setModalState(() => tempSelection = value),
              () => Navigator.pop(sheetContext, tempSelection),
              () => Navigator.pop(sheetContext),
            );
          },
        );
      },
    );
  }

  Widget _buildFilterBottomSheet(
      String title,
      List<String> options,
      String selected,
      ValueChanged<String> onSelect,
      VoidCallback onConfirm,
      VoidCallback onCancel) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Header
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Filter by $title',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onCancel,
                  icon: Icon(Icons.close, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          // Options list
          Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: options
                    .map((option) => Container(
                          margin: EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            color: selected == option
                                ? Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1)
                                : Colors.grey[50],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: selected == option
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey.withOpacity(0.2),
                              width: selected == option ? 2 : 1,
                            ),
                          ),
                          child: ListTile(
                            title: Text(
                              option,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: selected == option
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                                color: selected == option
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey[800],
                              ),
                            ),
                            trailing: selected == option
                                ? Icon(Icons.check_circle,
                                    color: Theme.of(context).primaryColor)
                                : Icon(Icons.radio_button_unchecked,
                                    color: Colors.grey[400]),
                            onTap: () => onSelect(option),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          // Action buttons
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onCancel,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: Colors.grey[400]!),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onConfirm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      'OK',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Filtered data methods
  List<_ScriptedItem> _getFilteredZanzibarCultural() {
    return _applyFilters(_buildScriptedZanzibarCultural());
  }

  List<_ScriptedItem> _getFilteredZanzibarAquatic() {
    return _applyFilters(_buildScriptedZanzibarAquatic());
  }

  List<_ScriptedItem> _getFilteredNorthernSafaris() {
    return _applyFilters(_buildScriptedNorthernSafaris());
  }

  List<_ScriptedItem> _getFilteredSouthernSafaris() {
    return _applyFilters(_buildScriptedSouthernSafaris());
  }

  void _clearAllFilters() {
    setState(() {
      _selectedLocation = 'All';
      _selectedDuration = 'All';
      _selectedActivity = 'All';
      _selectedPrice = 'All';
    });
  }

  int _getActiveFiltersCount() {
    int count = 0;
    if (_selectedLocation != 'All') count++;
    if (_selectedDuration != 'All') count++;
    if (_selectedActivity != 'All') count++;
    if (_selectedPrice != 'All') count++;
    return count;
  }

  List<_ScriptedItem> _applyFilters(List<_ScriptedItem> items) {
    return items.where((item) {
      // Location filter
      if (_selectedLocation != 'All') {
        if (!item.title
                .toLowerCase()
                .contains(_selectedLocation.toLowerCase()) &&
            !item.subtitle
                .toLowerCase()
                .contains(_selectedLocation.toLowerCase())) {
          return false;
        }
      }

      // Duration filter
      if (_selectedDuration != 'All') {
        if (!item.title
            .toLowerCase()
            .contains(_selectedDuration.toLowerCase())) {
          return false;
        }
      }

      // Activity filter
      if (_selectedActivity != 'All') {
        final titleLower = item.title.toLowerCase();
        switch (_selectedActivity) {
          case 'Cultural':
            if (!titleLower.contains('stone') &&
                !titleLower.contains('spice') &&
                !titleLower.contains('cooking') &&
                !titleLower.contains('village')) {
              return false;
            }
            break;
          case 'Wildlife':
            if (!titleLower.contains('dolphin') &&
                !titleLower.contains('jozani') &&
                !titleLower.contains('turtle') &&
                !titleLower.contains('safari')) {
              return false;
            }
            break;
          case 'Beach':
            if (!titleLower.contains('beach') &&
                !titleLower.contains('mnemba') &&
                !titleLower.contains('sandbank') &&
                !titleLower.contains('kendwa')) {
              return false;
            }
            break;
          case 'Snorkeling':
            if (!titleLower.contains('snorkel') &&
                !titleLower.contains('mnemba') &&
                !titleLower.contains('safari blue')) {
              return false;
            }
            break;
          case 'Safari':
            if (!titleLower.contains('safari') &&
                !titleLower.contains('serengeti') &&
                !titleLower.contains('ngorongoro') &&
                !titleLower.contains('selous')) {
              return false;
            }
            break;
          case 'Cooking':
            if (!titleLower.contains('cooking') &&
                !titleLower.contains('spice')) {
              return false;
            }
            break;
          case 'Walking':
            if (!titleLower.contains('walking') &&
                !titleLower.contains('tour') &&
                !titleLower.contains('forest')) {
              return false;
            }
            break;
          case 'Boat':
            if (!titleLower.contains('boat') &&
                !titleLower.contains('cruise') &&
                !titleLower.contains('dhow') &&
                !titleLower.contains('safari blue')) {
              return false;
            }
            break;
        }
      }

      // Price filter
      if (_selectedPrice != 'All') {
        if (_selectedPrice == 'Featured') {
          if (!item.featured) return false;
        } else {
          final priceText = item.price.toLowerCase();
          switch (_selectedPrice) {
            case 'Under \$150':
              if (priceText.contains('from \$150') ||
                  priceText.contains('from \$200') ||
                  priceText.contains('from \$250') ||
                  priceText.contains('from \$300') ||
                  priceText.contains('from \$420') ||
                  priceText.contains('from \$450') ||
                  priceText.contains('from \$650')) {
                return false;
              }
              break;
            case '\$150 - \$300':
              if (!priceText.contains('from \$150') &&
                  !priceText.contains('from \$160') &&
                  !priceText.contains('from \$170') &&
                  !priceText.contains('from \$200') &&
                  !priceText.contains('from \$250')) {
                return false;
              }
              break;
            case '\$300 - \$500':
              if (!priceText.contains('from \$420') &&
                  !priceText.contains('from \$450')) {
                return false;
              }
              break;
            case 'Over \$500':
              if (!priceText.contains('from \$650')) {
                return false;
              }
              break;
          }
        }
      }

      return true;
    }).toList();
  }

  String _getTourIdFromTitle(String title) {
    // Map scripted item titles to actual tour IDs
    final titleLower = title.toLowerCase();

    if (titleLower.contains('prison island') &&
        titleLower.contains('stone town') &&
        titleLower.contains('spice plantation')) {
      return 'prison_stone_spice_combo';
    } else if (titleLower.contains('dolphin tour') &&
        titleLower.contains('jozani forest') &&
        titleLower.contains('spice plantation')) {
      return 'dolphin_jozani_spice';
    } else if (titleLower.contains('jozani forest') &&
        titleLower.contains('rock restaurant') &&
        titleLower.contains('kuza cave')) {
      return 'jozani_rock_kuza';
    } else if (titleLower.contains('jozani forest') &&
        titleLower.contains('dolphin tour') &&
        titleLower.contains('rock restaurant')) {
      return 'jozani_dolphin_rock';
    } else if (titleLower.contains('cooking class') &&
        titleLower.contains('spice tour')) {
      return 'cooking_class_spice';
    } else if (titleLower.contains('turtle sanctuary') &&
        titleLower.contains('northern beaches')) {
      return 'turtle_sanctuary_beaches';
    } else if (titleLower.contains('quad bike') &&
        titleLower.contains('local village')) {
      return 'quad_bike_village';
    } else if (titleLower.contains('horse riding') &&
        titleLower.contains('nungwi')) {
      return 'horse_riding_nungwi';
    } else if (titleLower.contains('full day mnemba')) {
      return 'full_day_mnemba';
    } else if (titleLower.contains('half day mnemba')) {
      return 'half_day_mnemba';
    } else if (titleLower.contains('safari blue trip')) {
      return 'safari_blue_trip';
    } else if (titleLower.contains('salaam cave') &&
        titleLower.contains('mtende beach') &&
        titleLower.contains('dolphin tour')) {
      return 'salaam_cave_mtende_dolphin';
    } else if (titleLower.contains('nakupenda') &&
        titleLower.contains('prison island') &&
        titleLower.contains('stone town')) {
      return 'nakupenda_prison_stone_combo';
    } else if (titleLower.contains('kendwa beach sunset cruise')) {
      return 'kendwa_sunset';
    } else if (titleLower.contains('sunset dinner') &&
        titleLower.contains('kendwa beach')) {
      return 'sunset_dinner_kendwa';
    } else if (titleLower
        .contains('unforgettable 6-day tanzania safari adventure')) {
      return 'five_days_safari';
    } else if (titleLower.contains('5-days safari adventure')) {
      return 'five_days_safari';
    } else if (titleLower.contains('8 days river crossing') &&
        titleLower.contains('wildebeest migration safari')) {
      return 'migration_safari';
    } else if (titleLower.contains('4 days safari') &&
        titleLower.contains('tarangire') &&
        titleLower.contains('serengeti') &&
        titleLower.contains('ngorongoro')) {
      return 'tarangire_serengeti_ngorongoro_4day';
    } else if (
        // Match both with and without slash between 4 Days and 3 Nights
        titleLower.contains('4 days 3 nights selous safari') ||
            titleLower.contains('4 days / 3 nights selous safari') ||
            // Fallback: keyword conjunction
            (titleLower.contains('selous') &&
                titleLower.contains('4 days') &&
                titleLower.contains('3 nights'))) {
      return 'selous_4day';
    } else if (titleLower.contains('mikumi day trip')) {
      return 'mikumi_day_trip';
    } else if (titleLower.contains('2-day tarangire') &&
        titleLower.contains('ngorongoro crater') &&
        titleLower.contains('zanzibar')) {
      return 'tarangire_ngorongoro_2day';
    } else if (titleLower.contains('4 days migration calving season safari')) {
      return 'calving_season_safari';
    } else if (titleLower.contains('3 days selous safari')) {
      return 'selous_3day';
    } else if (titleLower.contains('2 days selous safari')) {
      return 'selous_2day';
    } else if (titleLower.contains('selous safari day trip')) {
      return 'selous_day_trip';
    } else if ((titleLower.contains('3-day') || titleLower.contains('3 day')) &&
        titleLower.contains('luxury') &&
        titleLower.contains('fly') &&
        titleLower.contains('out') &&
        titleLower.contains('safari')) {
      return 'luxury_fly_safari';
    }

    // Default fallback
    return 'stone_town';
  }

  void _navigateToBooking(_ScriptedItem item) {
    // Get the correct tour ID
    String tourId = _getTourIdFromTitle(item.title);

    // Find the matching tour from TourData
    final match = TourData.zanzibarTours
        .followedBy(TourData.safariTours)
        .firstWhere((t) => t.id == tourId,
            orElse: () => TourData.zanzibarTours.first);

    // Determine entity type based on tour category
    String entityType = match.category == 'safari' ? 'safari' : 'tour';

    // Navigate to enhanced booking screen with pre-selected tour
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EnhancedBookingScreen(
          tourId: match.id,
          entityType: entityType,
        ),
      ),
    );
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
