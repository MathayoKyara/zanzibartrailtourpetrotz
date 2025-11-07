import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';
import 'enhanced_booking_screen.dart';

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 2;
  String _selectedCategory = 'All';
  late TabController _tabController;

  List<String> categories = [
    'All',
    'Zanzibar Tours',
    'Safari Adventures',
    'Cultural Experiences',
    'Beaches & Islands',
    'Wildlife & Nature',
    'Hidden Gems'
  ];

  // Comprehensive image collection from both directories
  List<Map<String, String>> allImages = [
    // Zanzibar Tours
    {
      'path': 'assets/images/alltours/prison&stonetown.jpg',
      'category': 'Zanzibar Tours',
      'caption': 'Prison Island & Stone Town Tour',
      'description': 'Historic Stone Town and Aldabra tortoises'
    },
    {
      'path': 'assets/images/alltours/dolphintour.jpg',
      'category': 'Zanzibar Tours',
      'caption': 'Dolphin Tour & Jozani Forest',
      'description': 'Swim with dolphins and explore Red Colobus monkeys'
    },
    {
      'path': 'assets/images/alltours/kuzacave.jpg',
      'category': 'Zanzibar Tours',
      'caption': 'Kuza Cave & Rock Restaurant',
      'description': 'Underground cave exploration and oceanfront dining'
    },
    {
      'path': 'assets/images/alltours/cookingclass.jpg',
      'category': 'Cultural Experiences',
      'caption': 'Zanzibar Cooking Class',
      'description': 'Learn traditional Swahili cuisine'
    },
    {
      'path': 'assets/images/alltours/quadbike.jpeg',
      'category': 'Zanzibar Tours',
      'caption': 'Quad Bike Village Tour',
      'description': 'Adventure through rural Zanzibar'
    },
    {
      'path': 'assets/images/alltours/horseriding.jpg',
      'category': 'Zanzibar Tours',
      'caption': 'Horse Riding in Nungwi',
      'description': 'Scenic beachside horse riding'
    },
    {
      'path': 'assets/images/alltours/turtlesunctuary.webp',
      'category': 'Wildlife & Nature',
      'caption': 'Turtle Sanctuary Visit',
      'description': 'Meet sea turtles and support conservation'
    },

    // Safari Adventures
    {
      'path': 'assets/images/alltours/migrationsafari.jpg',
      'category': 'Safari Adventures',
      'caption': 'Wildebeest Migration Safari',
      'description': 'Witness the great migration in Serengeti'
    },
    {
      'path': 'assets/images/alltours/safariadventure.jpg',
      'category': 'Safari Adventures',
      'caption': '6-Day Tanzania Safari',
      'description': 'Complete Northern Circuit experience'
    },
    {
      'path': 'assets/images/alltours/besttime.jpg',
      'category': 'Safari Adventures',
      'caption': '5-Day Safari Adventure',
      'description': 'Flexible game drives and accommodation'
    },
    {
      'path': 'assets/images/alltours/calving.jpg',
      'category': 'Safari Adventures',
      'caption': 'Calving Season Safari',
      'description': 'Prime time for predator sightings'
    },
    {
      'path': 'assets/images/alltours/tarangire.webp',
      'category': 'Safari Adventures',
      'caption': 'Tarangire & Ngorongoro Safari',
      'description': 'Elephants, big cats, and crater landscapes'
    },
    {
      'path': 'assets/images/alltours/ngorongoro.jpg',
      'category': 'Safari Adventures',
      'caption': '2-Day Ngorongoro Safari',
      'description': 'Short but mighty fly-in safari'
    },
    {
      'path': 'assets/images/alltours/4dayssafari.jpg',
      'category': 'Safari Adventures',
      'caption': '3-Day Luxury Safari',
      'description': 'Top-tier lodges and exclusive encounters'
    },
    {
      'path': 'assets/images/alltours/seloussafari.jpg',
      'category': 'Safari Adventures',
      'caption': '4-Day Selous Safari',
      'description': 'Boat, walking, and game drives'
    },
    {
      'path': 'assets/images/alltours/3daysselous.jpg',
      'category': 'Safari Adventures',
      'caption': '3-Day Selous Safari',
      'description': 'Immersive bush experience'
    },
    {
      'path': 'assets/images/alltours/2daysselous.webp',
      'category': 'Safari Adventures',
      'caption': '2-Day Selous Safari',
      'description': 'Quick escape to the wild'
    },
    {
      'path': 'assets/images/alltours/seloussafaritrip.jpg',
      'category': 'Safari Adventures',
      'caption': 'Selous Day Trip',
      'description': 'Day outing tracking wildlife'
    },
    {
      'path': 'assets/images/alltours/mikumidaytrip.jpeg',
      'category': 'Safari Adventures',
      'caption': 'Mikumi Day Trip',
      'description': 'Savannah landscapes near Dar es Salaam'
    },

    // Beaches & Islands
    {
      'path': 'assets/images/alltours/fulldaymnemba.jpg',
      'category': 'Beaches & Islands',
      'caption': 'Full Day Mnemba Island',
      'description': 'Snorkel pristine reefs and beaches'
    },
    {
      'path': 'assets/images/alltours/halfdaymnemba.jpg',
      'category': 'Beaches & Islands',
      'caption': 'Half Day Mnemba Island',
      'description': 'Compact snorkeling adventure'
    },
    {
      'path': 'assets/images/alltours/safariblue.jpg',
      'category': 'Beaches & Islands',
      'caption': 'Safari Blue Trip',
      'description': 'Sail traditional dhow with snorkeling'
    },
    {
      'path': 'assets/images/alltours/salaamcave.jpg',
      'category': 'Beaches & Islands',
      'caption': 'Salaam Cave & Mtende Beach',
      'description': 'Epic ocean day with cave exploration'
    },
    {
      'path': 'assets/images/alltours/nakupenda.jpg',
      'category': 'Beaches & Islands',
      'caption': 'Nakupenda Sandbank',
      'description': 'Premium sandbank and island combo'
    },
    {
      'path': 'assets/images/alltours/sunsetcruise.jpg',
      'category': 'Beaches & Islands',
      'caption': 'Kendwa Sunset Cruise',
      'description': 'Golden-hour views along the coast'
    },
    {
      'path': 'assets/images/alltours/sunsetkendwa.jpg',
      'category': 'Beaches & Islands',
      'caption': 'Sunset Dinner at Kendwa',
      'description': 'Romantic seaside dining experience'
    },
    {
      'path': 'assets/images/alltours/bwejuubeach.png',
      'category': 'Beaches & Islands',
      'caption': 'Bwejuu Beach',
      'description': 'Long sandy stretches and calm lagoon'
    },
    {
      'path': 'assets/images/alltours/kizimkazibeach.png',
      'category': 'Beaches & Islands',
      'caption': 'Kizimkazi Beach',
      'description': 'Quiet fishing village with dolphin tours'
    },
    {
      'path': 'assets/images/alltours/matemwebeach.png',
      'category': 'Beaches & Islands',
      'caption': 'Matemwe Beach',
      'description': 'Gateway to Mnemba Atoll diving'
    },

    // Hidden Gems
    {
      'path': 'assets/images/alltours/uziisland.png',
      'category': 'Hidden Gems',
      'caption': 'Uzi Island',
      'description': 'Untouched mangrove forests and coral causeway'
    },
    {
      'path': 'assets/images/alltours/kwaleisland.png',
      'category': 'Hidden Gems',
      'caption': 'Kwale Island',
      'description': 'Giant baobab trees and marine life'
    },
    {
      'path': 'assets/images/alltours/kidichipersianbaths.png',
      'category': 'Hidden Gems',
      'caption': 'Kidichi Persian Baths',
      'description': 'Royal Persian-style architecture'
    },
    {
      'path': 'assets/images/alltours/nungwiaquarium.png',
      'category': 'Hidden Gems',
      'caption': 'Nungwi Natural Aquarium',
      'description': 'Sea turtle rehabilitation center'
    },
    {
      'path': 'assets/images/alltours/chwakabaymangrove.png',
      'category': 'Hidden Gems',
      'caption': 'Chwaka Bay Mangroves',
      'description': 'Kayaking and birdwatching paradise'
    },
    {
      'path': 'assets/images/alltours/mkungunivillage.png',
      'category': 'Hidden Gems',
      'caption': 'Kizimkazi Mkunguni Village',
      'description': 'Authentic fishing culture and dolphin spotting'
    },
    {
      'path': 'assets/images/alltours/makunduchivillage.png',
      'category': 'Cultural Experiences',
      'caption': 'Makunduchi Village',
      'description': 'Mwaka Kogwa New Year Festival'
    },
    {
      'path': 'assets/images/alltours/seaweedcenter.png',
      'category': 'Cultural Experiences',
      'caption': 'Seaweed Center',
      'description': 'Women-led farming and natural cosmetics'
    },
    {
      'path': 'assets/images/alltours/muyunivillage.png',
      'category': 'Cultural Experiences',
      'caption': 'Muyuni Village',
      'description': 'Off-grid authentic Zanzibari life'
    },
    {
      'path': 'assets/images/alltours/swahilicook.png',
      'category': 'Cultural Experiences',
      'caption': 'Cooking with Swahili Family',
      'description': 'Hands-on traditional cooking lessons'
    },
    {
      'path': 'assets/images/alltours/zalapark.png',
      'category': 'Cultural Experiences',
      'caption': 'Zala Park',
      'description': 'Community-run reptile park and education'
    },
    {
      'path': 'assets/images/alltours/mtonipalaceruins.png',
      'category': 'Hidden Gems',
      'caption': 'Mtoni Palace Ruins',
      'description': 'Former palace of Sultan Seyyid Said'
    },
    {
      'path': 'assets/images/alltours/kizimkazioldmosque.png',
      'category': 'Hidden Gems',
      'caption': 'Kizimkazi Old Mosque',
      'description': 'Oldest mosque in East Africa (1107 CE)'
    },
    {
      'path': 'assets/images/alltours/mangapwanislavechambers.png',
      'category': 'Hidden Gems',
      'caption': 'Mangapwani Slave Chambers',
      'description': 'Historical underground chambers and coral cave'
    },

    // Additional images from main assets
    {
      'path': 'assets/images/stonetown.jpg',
      'category': 'Cultural Experiences',
      'caption': 'Stone Town Architecture',
      'description': 'UNESCO World Heritage site'
    },
    {
      'path': 'assets/images/spices.png',
      'category': 'Cultural Experiences',
      'caption': 'Zanzibar Spice Tour',
      'description': 'Aromatic spice plantation visit'
    },
    {
      'path': 'assets/images/jozani.jpg',
      'category': 'Wildlife & Nature',
      'caption': 'Jozani Forest',
      'description': 'Red Colobus monkey sanctuary'
    },
    {
      'path': 'assets/images/safariblue.jpg',
      'category': 'Beaches & Islands',
      'caption': 'Safari Blue Adventure',
      'description': 'Traditional dhow sailing experience'
    },
    {
      'path': 'assets/images/simba.png',
      'category': 'Wildlife & Nature',
      'caption': 'Serengeti Lions',
      'description': 'Big cats in their natural habitat'
    },
    {
      'path': 'assets/images/tourists.jpg',
      'category': 'Cultural Experiences',
      'caption': 'Cultural Exchange',
      'description': 'Meeting local communities'
    },
    {
      'path': 'assets/images/couple.png',
      'category': 'Beaches & Islands',
      'caption': 'Romantic Beach Getaway',
      'description': 'Perfect for couples and honeymoons'
    },
    {
      'path': 'assets/images/mzungu.png',
      'category': 'Cultural Experiences',
      'caption': 'Local Village Life',
      'description': 'Authentic cultural immersion'
    },
    {
      'path': 'assets/images/mzungu2.png',
      'category': 'Cultural Experiences',
      'caption': 'Community Interaction',
      'description': 'Learning from local communities'
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredImages = _selectedCategory == 'All'
        ? allImages
        : allImages
            .where((image) => image['category'] == _selectedCategory)
            .toList();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Gallery',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.grid_view, size: 18),
                  SizedBox(width: 8),
                  Text('Grid View'),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.view_list, size: 18),
                  SizedBox(width: 8),
                  Text('List View'),
                ],
              ),
            ),
          ],
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white.withOpacity(0.7),
          labelStyle: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          // Enhanced Category Filter
          _buildCategoryFilter(),

          // Content based on tab selection
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildGridView(filteredImages),
                _buildListView(filteredImages),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/tours');
              break;
            case 2:
              // Already on gallery screen
              break;
            case 3:
              Navigator.pushNamed(context, '/contact');
              break;
          }
        },
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.filter_list, size: 20, color: Colors.grey[700]),
              SizedBox(width: 8),
              Text(
                'Filter by Category',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              Spacer(),
              if (_selectedCategory != 'All')
                TextButton.icon(
                  onPressed: () => setState(() => _selectedCategory = 'All'),
                  icon: Icon(Icons.clear, size: 16),
                  label: Text('Clear'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red[600],
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                ),
            ],
          ),
          SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                final isSelected = _selectedCategory == category;
                final count = category == 'All'
                    ? allImages.length
                    : allImages
                        .where((img) => img['category'] == category)
                        .length;

                return Container(
                  margin: EdgeInsets.only(right: 12),
                  child: FilterChip(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(category),
                        SizedBox(width: 6),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.white.withOpacity(0.2)
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '$count',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: isSelected
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    selectedColor: Theme.of(context).primaryColor,
                    checkmarkColor: Colors.white,
                    labelStyle: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    backgroundColor: Colors.grey[50],
                    side: BorderSide(
                      color: isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.grey.withOpacity(0.3),
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridView(List<Map<String, String>> images) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive grid based on screen width
        int crossAxisCount;
        double childAspectRatio;

        if (constraints.maxWidth >= 1200) {
          // Large screens (PC) - 4 columns
          crossAxisCount = 4;
          childAspectRatio = 0.7; // Slightly taller to prevent elongation
        } else if (constraints.maxWidth >= 900) {
          // Medium screens (tablets) - 3 columns
          crossAxisCount = 3;
          childAspectRatio = 0.75;
        } else if (constraints.maxWidth >= 600) {
          // Small tablets - 2 columns
          crossAxisCount = 2;
          childAspectRatio = 0.8;
        } else {
          // Mobile - 1 column
          crossAxisCount = 1;
          childAspectRatio = 1.1; // Taller for single column
        }

        return GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return _buildGridImageCard(images[index]);
          },
        );
      },
    );
  }

  Widget _buildListView(List<Map<String, String>> images) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return _buildListImageCard(images[index]);
      },
    );
  }

  Widget _buildGridImageCard(Map<String, String> imageData) {
    return GestureDetector(
      onTap: () => _showImageDetail(imageData),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 15,
              offset: Offset(0, 8),
            ),
          ],
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Flexible image container - takes most of the space
            Expanded(
              flex: 3, // Takes 3/4 of available space
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Stack(
                  children: [
                    Image.asset(
                      imageData['path']!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover, // Maintain aspect ratio while filling
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.grey[300],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image,
                                  size: 40, color: Colors.grey[600]),
                              SizedBox(height: 8),
                              Text(
                                'Image not available',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          imageData['category']!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Compact content area - takes minimal space
            Expanded(
              flex: 1, // Takes 1/4 of available space
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      imageData['caption']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.grey[800],
                      ),
                      maxLines: 1, // Single line to save space
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      imageData['description']!,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[600],
                        height: 1.2,
                      ),
                      maxLines: 1, // Single line to save space
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListImageCard(Map<String, String> imageData) {
    return GestureDetector(
      onTap: () => _showImageDetail(imageData),
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 15,
              offset: Offset(0, 8),
            ),
          ],
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(16)),
              child: Image.asset(
                imageData['path']!,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 120,
                    height: 120,
                    color: Colors.grey[300],
                    child: Icon(Icons.image, size: 40, color: Colors.grey[600]),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        imageData['category']!,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      imageData['caption']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey[800],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      imageData['description']!,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                        height: 1.3,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to map gallery image captions to tour/gem IDs and entity types
  Map<String, String?> _getBookingInfo(String caption, String category) {
    final captionLower = caption.toLowerCase();
    
    // Zanzibar Tours
    if (captionLower.contains('prison island') && captionLower.contains('stone town')) {
      return {'id': 'prison_stone_spice_combo', 'entityType': 'tour'};
    } else if (captionLower.contains('dolphin') && captionLower.contains('jozani')) {
      return {'id': 'dolphin_jozani_spice', 'entityType': 'tour'};
    } else if (captionLower.contains('kuza cave') || (captionLower.contains('rock restaurant') && captionLower.contains('kuza'))) {
      return {'id': 'jozani_rock_kuza', 'entityType': 'tour'};
    } else if (captionLower.contains('jozani') && captionLower.contains('dolphin') && captionLower.contains('rock')) {
      return {'id': 'jozani_dolphin_rock', 'entityType': 'tour'};
    } else if (captionLower.contains('cooking class') && !captionLower.contains('swahili family')) {
      return {'id': 'cooking_class_spice', 'entityType': 'tour'};
    } else if (captionLower.contains('quad bike')) {
      return {'id': 'quad_bike_village', 'entityType': 'tour'};
    } else if (captionLower.contains('horse riding')) {
      return {'id': 'horse_riding_nungwi', 'entityType': 'tour'};
    } else if (captionLower.contains('turtle sanctuary')) {
      return {'id': 'turtle_sanctuary_beaches', 'entityType': 'tour'};
    } else if (captionLower.contains('full day mnemba')) {
      return {'id': 'full_day_mnemba', 'entityType': 'tour'};
    } else if (captionLower.contains('half day mnemba')) {
      return {'id': 'half_day_mnemba', 'entityType': 'tour'};
    } else if (captionLower.contains('safari blue')) {
      return {'id': 'safari_blue_trip', 'entityType': 'tour'};
    } else if (captionLower.contains('salaam cave')) {
      return {'id': 'salaam_cave_mtende_dolphin', 'entityType': 'tour'};
    } else if (captionLower.contains('nakupenda')) {
      return {'id': 'nakupenda_prison_stone_combo', 'entityType': 'tour'};
    } else if (captionLower.contains('kendwa sunset cruise')) {
      return {'id': 'kendwa_sunset', 'entityType': 'tour'};
    } else if (captionLower.contains('sunset dinner') && captionLower.contains('kendwa')) {
      return {'id': 'sunset_dinner_kendwa', 'entityType': 'tour'};
    } else if (captionLower.contains('spice tour') || captionLower.contains('spice plantation')) {
      return {'id': 'spice_farm', 'entityType': 'tour'};
    } else if (captionLower.contains('jozani forest') && !captionLower.contains('dolphin') && !captionLower.contains('rock')) {
      return {'id': 'jozani_forest', 'entityType': 'tour'};
    } else if (captionLower.contains('stone town')) {
      return {'id': 'stone_town', 'entityType': 'tour'};
    }
    
    // Safari Adventures
    if (category == 'Safari Adventures') {
      if (captionLower.contains('migration') || captionLower.contains('wildebeest')) {
        return {'id': 'migration_safari', 'entityType': 'safari'};
      } else if (captionLower.contains('6-day') || captionLower.contains('unforgettable')) {
        return {'id': 'five_days_safari', 'entityType': 'safari'};
      } else if (captionLower.contains('5-day')) {
        return {'id': 'five_days_safari', 'entityType': 'safari'};
      } else if (captionLower.contains('calving season')) {
        return {'id': 'calving_season_safari', 'entityType': 'safari'};
      } else if (captionLower.contains('tarangire') && captionLower.contains('ngorongoro') && !captionLower.contains('2-day')) {
        return {'id': 'tarangire_serengeti_ngorongoro_4day', 'entityType': 'safari'};
      } else if (captionLower.contains('2-day') && captionLower.contains('ngorongoro')) {
        return {'id': 'tarangire_ngorongoro_2day', 'entityType': 'safari'};
      } else if (captionLower.contains('3-day luxury') || captionLower.contains('luxury safari')) {
        return {'id': 'luxury_fly_safari', 'entityType': 'safari'};
      } else if (captionLower.contains('4-day') && captionLower.contains('selous')) {
        return {'id': 'selous_4day', 'entityType': 'safari'};
      } else if (captionLower.contains('3-day') && captionLower.contains('selous') && !captionLower.contains('luxury')) {
        return {'id': 'selous_3day', 'entityType': 'safari'};
      } else if (captionLower.contains('2-day') && captionLower.contains('selous')) {
        return {'id': 'selous_2day', 'entityType': 'safari'};
      } else if (captionLower.contains('selous day trip')) {
        return {'id': 'selous_day_trip', 'entityType': 'safari'};
      } else if (captionLower.contains('mikumi')) {
        return {'id': 'mikumi_day_trip', 'entityType': 'safari'};
      }
    }
    
    // Hidden Gems
    if (category == 'Hidden Gems') {
      if (captionLower.contains('uzi island')) {
        return {'id': 'uzi_island', 'entityType': 'hidden_gem'};
      } else if (captionLower.contains('kwale island')) {
        return {'id': 'kwale_island', 'entityType': 'hidden_gem'};
      } else if (captionLower.contains('kidichi persian baths')) {
        return {'id': 'kidichi_baths', 'entityType': 'hidden_gem'};
      } else if (captionLower.contains('nungwi natural aquarium') || captionLower.contains('nungwi aquarium')) {
        return {'id': 'nungwi_aquarium', 'entityType': 'hidden_gem'};
      } else if (captionLower.contains('chwaka bay mangroves')) {
        return {'id': 'chwaka_mangroves', 'entityType': 'hidden_gem'};
      } else if (captionLower.contains('kizimkazi mkunguni')) {
        return {'id': 'kizimkazi_mkunguni', 'entityType': 'hidden_gem'};
      } else if (captionLower.contains('mtoni palace')) {
        return {'id': 'mtoni_palace', 'entityType': 'hidden_gem'};
      } else if (captionLower.contains('kizimkazi old mosque')) {
        return {'id': 'kizimkazi_mosque', 'entityType': 'hidden_gem'};
      } else if (captionLower.contains('mangapwani')) {
        return {'id': 'mangapwani_cave', 'entityType': 'hidden_gem'};
      }
    }
    
    // Cultural Experiences that might be hidden gems
    if (category == 'Cultural Experiences') {
      if (captionLower.contains('makunduchi')) {
        return {'id': 'makunduchi_village', 'entityType': 'hidden_gem'};
      } else if (captionLower.contains('seaweed center')) {
        return {'id': 'seaweed_center', 'entityType': 'hidden_gem'};
      } else if (captionLower.contains('muyuni')) {
        return {'id': 'muyuni_village', 'entityType': 'hidden_gem'};
      } else if (captionLower.contains('cooking with swahili')) {
        return {'id': 'cooking_swahili', 'entityType': 'hidden_gem'};
      } else if (captionLower.contains('zala park')) {
        return {'id': 'zala_park', 'entityType': 'hidden_gem'};
      } else if (captionLower.contains('coffee ceremony')) {
        return {'id': 'coffee_ceremony', 'entityType': 'hidden_gem'};
      }
    }
    
    // Beaches & Islands (offbeat beaches - hidden gems)
    if (category == 'Beaches & Islands') {
      if (captionLower.contains('kizimkazi beach')) {
        return {'id': 'kizimkazi_beach', 'entityType': 'hidden_gem'};
      } else if (captionLower.contains('uroa beach')) {
        return {'id': 'uroa_beach', 'entityType': 'hidden_gem'};
      } else if (captionLower.contains('pingwe') || captionLower.contains('rock restaurant')) {
        return {'id': 'pingwe_beach', 'entityType': 'hidden_gem'};
      } else if (captionLower.contains('bwejuu beach')) {
        return {'id': 'bwejuu_beach', 'entityType': 'hidden_gem'};
      } else if (captionLower.contains('matemwe beach')) {
        return {'id': 'matemwe_beach', 'entityType': 'hidden_gem'};
      }
    }
    
    return {'id': null, 'entityType': null};
  }

  void _showImageDetail(Map<String, String> imageData) {
    final bookingInfo = _getBookingInfo(imageData['caption']!, imageData['category']!);
    final entityId = bookingInfo['id'];
    final entityType = bookingInfo['entityType'];
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 16 / 10,
                  child: Image.asset(
                    imageData['path']!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image,
                                size: 60, color: Colors.grey[600]),
                            SizedBox(height: 8),
                            Text(
                              'Image not available',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Category badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Theme.of(context).primaryColor.withOpacity(0.2)),
                ),
                child: Text(
                  imageData['category']!,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Title
              Text(
                imageData['caption']!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  height: 1.2,
                ),
              ),

              SizedBox(height: 12),

              // Description
              Text(
                imageData['description']!,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),

              SizedBox(height: 24),

              // Action button
              Container(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigate to EnhancedBookingScreen if we have a valid mapping
                    if (entityId != null && entityType != null) {
                      if (entityType == 'hidden_gem') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EnhancedBookingScreen(
                              gemId: entityId,
                              entityType: entityType,
                            ),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EnhancedBookingScreen(
                              tourId: entityId,
                              entityType: entityType,
                            ),
                          ),
                        );
                      }
                    } else {
                      // Fallback to tours page if no mapping found
                      Navigator.pushNamed(context, '/tours');
                    }
                  },
                  icon: Icon(Icons.book_online),
                  label: Text('Book This Experience'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
