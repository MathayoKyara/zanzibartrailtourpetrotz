class TourDetail {
  final String id;
  final String title;
  final String description;
  final String price;
  final String location;
  final String howToGetThere;
  final String travelTime;
  final String imagePath;
  final List<String> highlights;
  final List<String> included;
  final List<String> notIncluded;
  final String duration;
  final String groupSize;
  final String category; // 'zanzibar' or 'safari'

  TourDetail({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.howToGetThere,
    required this.travelTime,
    required this.imagePath,
    required this.highlights,
    required this.included,
    required this.notIncluded,
    required this.duration,
    required this.groupSize,
    required this.category,
  });
}

class TourData {
  static List<TourDetail> zanzibarTours = [
    TourDetail(
      id: 'stone_town',
      title: 'Stone Town Walking Tour',
      description:
          'Explore the historic alleys, House of Wonders, and Old Fort of this UNESCO World Heritage Site. Discover the rich history and culture of Zanzibar\'s most iconic destination.',
      price: '20 – 40 USD pp',
      location: 'Stone Town',
      howToGetThere: 'Walk from hotel',
      travelTime: '0–10 min',
      imagePath: 'assets/images/stonetown-walking.png',
      highlights: [
        'UNESCO World Heritage Site',
        'Historic House of Wonders',
        'Old Fort exploration',
        'Traditional markets',
        'Architectural marvels',
        'Cultural insights'
      ],
      included: [
        'Professional local guide',
        'Entrance fees',
        'Hotel pickup (Stone Town area)',
        'Bottled water',
        'Cultural insights'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for guide',
        'Additional entrance fees',
        'Transport from outside Stone Town'
      ],
      duration: '3-4 hours',
      groupSize: '2-15 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'kendwa_sunset',
      title: 'Kendwa Beach Sunset Cruise (90 Minutes)',
      description:
          'Golden-hour views along one of Zanzibar\'s best beaches. Enjoy a relaxing cruise with stunning coastal scenery.',
      price: 'From \$160',
      location: 'Kendwa Beach, North Zanzibar',
      howToGetThere: 'Hotel transfer or taxi to Kendwa',
      travelTime: '60–90 min from Stone Town',
      imagePath: 'assets/images/alltours/sunsetcruise.jpg',
      highlights: [
        'Spectacular sunset views',
        'Scenic coastline cruising',
        'Relaxed romantic ambience',
        'Photography opportunities',
      ],
      included: [
        'Boat and crew',
        'Safety equipment',
        'Refreshments',
      ],
      notIncluded: [
        'Personal expenses',
        'Alcoholic beverages',
        'Hotel pickup outside Kendwa/Nungwi',
      ],
      duration: '90 minutes',
      groupSize: '2-20 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'spice_farm',
      title: 'Spice Farm Tour',
      description:
          'Discover the aromatic world of cloves, cinnamon, cardamom, and vanilla in our guided spice farm visits. Learn about Zanzibar\'s spice heritage and traditional farming methods.',
      price: '15 – 50 USD pp\n(Private ~100 USD/2pax)',
      location: 'Kizimbani / Jozani',
      howToGetThere: 'Taxi, rental car, or tour pickup',
      travelTime: '30–45 min',
      imagePath: 'assets/images/spice-tour.png',
      highlights: [
        'Spice plantation tour',
        'Traditional farming methods',
        'Spice tasting experience',
        'Local village visit',
        'Traditional lunch',
        'Cultural interaction'
      ],
      included: [
        'Professional guide',
        'Spice farm entrance',
        'Spice tasting session',
        'Traditional lunch',
        'Transport from Stone Town',
        'Cultural insights'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for guide',
        'Additional food and drinks',
        'Transport from outside Stone Town'
      ],
      duration: '4-5 hours',
      groupSize: '2-20 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'prison_island',
      title: 'Prison Island (Changuu)',
      description:
          'Visit the Aldabra giant tortoises and enjoy snorkeling in the crystal-clear waters. This historic island offers a perfect blend of wildlife and marine adventure.',
      price: '25 – 40 USD pp',
      location: 'Northwest of Stone Town',
      howToGetThere: '20-min boat ride from Stone Town harbor',
      travelTime: '20 min by boat',
      imagePath: 'assets/images/prison-island.png',
      highlights: [
        'Giant tortoise sanctuary',
        'Crystal clear snorkeling',
        'Historic prison ruins',
        'Beautiful beaches',
        'Marine life viewing',
        'Island exploration'
      ],
      included: [
        'Boat transfer',
        'Professional guide',
        'Snorkeling equipment',
        'Entrance fees',
        'Bottled water',
        'Safety briefing'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for guide',
        'Additional food and drinks',
        'Personal snorkeling gear'
      ],
      duration: '4-5 hours',
      groupSize: '2-15 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'jozani_forest',
      title: 'Jozani Forest Tour',
      description:
          'Encounter the rare Red Colobus monkeys and explore mangrove ecosystems. Experience the natural beauty of Zanzibar\'s only national park.',
      price: '25 – 45 USD pp',
      location: 'Jozani Chwaka Bay National Park',
      howToGetThere: 'Taxi or tour pickup',
      travelTime: '45–60 min',
      imagePath: 'assets/images/jozani.jpg',
      highlights: [
        'Red Colobus monkeys',
        'Mangrove forest walk',
        'Bird watching',
        'Nature trails',
        'Educational experience',
        'Photography opportunities'
      ],
      included: [
        'Professional guide',
        'Park entrance fees',
        'Transport from Stone Town',
        'Bottled water',
        'Educational insights',
        'Safety briefing'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for guide',
        'Additional food and drinks',
        'Personal equipment'
      ],
      duration: '3-4 hours',
      groupSize: '2-12 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'nakupenda_sandbank',
      title: 'Nakupenda Sandbank',
      description:
          'Experience pristine white sandbanks and crystal clear waters perfect for swimming and snorkeling. A paradise for beach lovers and water enthusiasts.',
      price: '40 – 65 USD pp',
      location: 'Off the coast of Stone Town',
      howToGetThere: '15–20 min by boat',
      travelTime: '15–20 min by boat',
      imagePath: 'assets/images/safariblue.jpg',
      highlights: [
        'Pristine white sandbanks',
        'Crystal clear waters',
        'Snorkeling adventure',
        'Beach relaxation',
        'Marine life viewing',
        'Photography paradise'
      ],
      included: [
        'Boat transfer',
        'Professional guide',
        'Snorkeling equipment',
        'Beach setup',
        'Bottled water',
        'Safety equipment'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for guide',
        'Additional food and drinks',
        'Personal beach equipment'
      ],
      duration: '5-6 hours',
      groupSize: '2-15 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'safari_blue',
      title: 'Safari Blue (Full Day)',
      description:
          'Full-day adventure with sailing, snorkeling, and seafood lunch on a traditional dhow. Experience the authentic Zanzibar marine adventure.',
      price: '65 USD pp (group)\nPrivate ~450 USD (up to 6pax)',
      location: 'Menai Bay Conservation Area, Southwest Zanzibar',
      howToGetThere: '60–90 min drive to Kizimkazi + dhow',
      travelTime: '1–1.5 hr',
      imagePath: 'assets/images/safariblue.jpg',
      highlights: [
        'Traditional dhow sailing',
        'Multiple snorkeling spots',
        'Fresh seafood lunch',
        'Island exploration',
        'Marine life viewing',
        'Sunset sailing'
      ],
      included: [
        'Transport from Stone Town',
        'Traditional dhow',
        'Professional crew',
        'Snorkeling equipment',
        'Fresh seafood lunch',
        'Bottled water and soft drinks',
        'Safety equipment'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for crew',
        'Alcoholic beverages',
        'Personal equipment'
      ],
      duration: '8-9 hours',
      groupSize: '6-20 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'mnemba_snorkeling',
      title: 'Mnemba Atoll Snorkeling',
      description:
          'Explore one of the most beautiful coral reefs in the world with diverse marine life. A must-do for snorkeling enthusiasts.',
      price: '40 – 60 USD pp',
      location: 'Near Matemwe, Northeast Zanzibar',
      howToGetThere: '1.5–2 hr drive + boat',
      travelTime: '1.5–2 hr',
      imagePath: 'assets/images/safariblue.jpg',
      highlights: [
        'World-class coral reefs',
        'Diverse marine life',
        'Crystal clear waters',
        'Multiple snorkeling spots',
        'Professional guidance',
        'Safety equipment'
      ],
      included: [
        'Transport from Stone Town',
        'Boat transfer to atoll',
        'Professional guide',
        'Snorkeling equipment',
        'Safety briefing',
        'Bottled water',
        'Lunch'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for guide',
        'Personal snorkeling gear',
        'Additional activities'
      ],
      duration: '6-7 hours',
      groupSize: '2-15 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'dolphin_tour',
      title: 'Dolphin Tour (Kizimkazi)',
      description:
          'Swim with wild dolphins in their natural habitat in the crystal waters of Kizimkazi. An unforgettable marine wildlife experience.',
      price: '30 – 50 USD pp',
      location: 'Kizimkazi Village, Southwest Zanzibar',
      howToGetThere: '1–1.5 hr drive',
      travelTime: '1–1.5 hr',
      imagePath: 'assets/images/alltours/dolphintour.jpg',
      highlights: [
        'Wild dolphin encounters',
        'Swimming with dolphins',
        'Marine wildlife viewing',
        'Professional boat crew',
        'Safety equipment',
        'Educational insights'
      ],
      included: [
        'Transport from Stone Town',
        'Professional boat crew',
        'Safety equipment',
        'Swimming gear',
        'Bottled water',
        'Safety briefing'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for crew',
        'Personal swimming gear',
        'Additional activities'
      ],
      duration: '4-5 hours',
      groupSize: '2-12 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'sunset_dhow',
      title: 'Sunset Dhow Cruise',
      description:
          'Experience the magical Zanzibar sunset aboard a traditional wooden dhow. A romantic and peaceful way to end your day.',
      price: '30 – 50 USD pp',
      location: 'Stone Town coast or Nungwi/Kendwa',
      howToGetThere: 'Harbor or beach departures',
      travelTime: '0–2 hr depending on location',
      imagePath: 'assets/images/safariblue.jpg',
      highlights: [
        'Traditional dhow sailing',
        'Breathtaking sunset views',
        'Romantic atmosphere',
        'Professional crew',
        'Refreshments',
        'Photography opportunities'
      ],
      included: [
        'Traditional dhow',
        'Professional crew',
        'Refreshments',
        'Safety equipment',
        'Photography assistance'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for crew',
        'Alcoholic beverages',
        'Personal equipment'
      ],
      duration: '2-3 hours',
      groupSize: '2-15 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'deep_sea_fishing',
      title: 'Deep Sea Fishing',
      description:
          'Professional fishing experience targeting marlin, tuna, and other big game fish. Perfect for fishing enthusiasts.',
      price: '450 – 600 USD / boat\n(shared costs)',
      location: 'Nungwi, Kendwa, or Paje',
      howToGetThere: 'Taxi or hotel transfer to departure beach',
      travelTime: '1–2 hr',
      imagePath: 'assets/images/bahari.png',
      highlights: [
        'Big game fishing',
        'Professional equipment',
        'Experienced crew',
        'Multiple fishing spots',
        'Catch and release options',
        'Professional guidance'
      ],
      included: [
        'Professional fishing boat',
        'Experienced crew',
        'Fishing equipment',
        'Safety equipment',
        'Refreshments',
        'Catch processing'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for crew',
        'Personal fishing gear',
        'Additional activities'
      ],
      duration: '6-8 hours',
      groupSize: '2-6 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'kite_surfing',
      title: 'Kite Surfing (lessons)',
      description:
          'Learn kite surfing from professional instructors on the perfect winds of Paje Beach. Suitable for beginners and advanced riders.',
      price: '50 – 100 USD pp',
      location: 'Paje Beach, Southeast Zanzibar',
      howToGetThere: 'Taxi, rental car, or tour transfer',
      travelTime: '50–60 min',
      imagePath: 'assets/images/bahari.png',
      highlights: [
        'Professional instruction',
        'Perfect wind conditions',
        'Safety equipment',
        'Progressive learning',
        'Beautiful beach location',
        'Equipment provided'
      ],
      included: [
        'Professional instructor',
        'Kite surfing equipment',
        'Safety equipment',
        'Insurance coverage',
        'Beach setup',
        'Progress tracking'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for instructor',
        'Personal equipment',
        'Accommodation'
      ],
      duration: '2-4 hours',
      groupSize: '1-4 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'scuba_diving',
      title: 'Scuba Diving (2 dives)',
      description:
          'Explore the underwater world with professional PADI certified instructors. Discover the amazing marine life of Zanzibar.',
      price: '120 – 150 USD pp',
      location: 'Mnemba, Nungwi, Kendwa',
      howToGetThere: '1.5–2 hr drive + boat',
      travelTime: '1.5–2 hr',
      imagePath: 'assets/images/safariblue.jpg',
      highlights: [
        'PADI certified instructors',
        'Two dive sites',
        'Professional equipment',
        'Marine life viewing',
        'Safety briefing',
        'Underwater photography'
      ],
      included: [
        'PADI certified instructor',
        'Diving equipment',
        'Safety equipment',
        'Two dive sites',
        'Transport from Stone Town',
        'Lunch and refreshments',
        'Insurance coverage'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for instructor',
        'Personal diving gear',
        'Additional dives'
      ],
      duration: '6-8 hours',
      groupSize: '2-8 people',
      category: 'zanzibar',
    ),
    // New tours matching scripted items
    TourDetail(
      id: 'prison_stone_spice_combo',
      title: 'Prison Island, Stone Town Tour and Spice Plantation (1 Day)',
      description:
          'A perfect cultural combo: historic Stone Town, Aldabra tortoises on Prison Island, and aromatic Spice Farm visit. Experience the best of Zanzibar\'s cultural heritage in one comprehensive tour.',
      price: 'From \$170',
      location: 'Stone Town, Prison Island, Spice Plantation',
      howToGetThere: 'Hotel pickup + boat transfer to Prison Island',
      travelTime: 'Full day tour (8-9 hours)',
      imagePath: 'assets/images/alltours/prison&stonetown.jpg',
      highlights: [
        'UNESCO World Heritage Stone Town',
        'Aldabra giant tortoises on Prison Island',
        'Historic House of Wonders',
        'Aromatic spice plantation tour',
        'Traditional spice tasting',
        'Cultural insights and history'
      ],
      included: [
        'Professional local guide',
        'Hotel pickup and drop-off',
        'Boat transfer to Prison Island',
        'Entrance fees to all sites',
        'Spice plantation tour',
        'Traditional lunch',
        'Bottled water'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for guide',
        'Additional food and drinks',
        'Personal shopping'
      ],
      duration: '8-9 hours',
      groupSize: '2-15 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'dolphin_jozani_spice',
      title: 'Dolphin Tour, Jozani Forest and Spice Plantation (8 Hours)',
      description:
          'Search for dolphins in Kizimkazi, walk among Red Colobus monkeys in Jozani, and explore spices. A perfect blend of marine wildlife, forest adventure, and cultural experience.',
      price: 'From \$160',
      location: 'Kizimkazi, Jozani Forest, Spice Plantation',
      howToGetThere: 'Hotel pickup + drive to Kizimkazi',
      travelTime: '8 hours total',
      imagePath: 'assets/images/alltours/dolphintour.jpg',
      highlights: [
        'Wild dolphin encounters in Kizimkazi',
        'Red Colobus monkeys in Jozani Forest',
        'Spice plantation exploration',
        'Marine wildlife viewing',
        'Forest nature walk',
        'Traditional spice tasting'
      ],
      included: [
        'Professional guide',
        'Hotel pickup and drop-off',
        'Boat trip for dolphin tour',
        'Jozani Forest entrance fees',
        'Spice plantation tour',
        'Traditional lunch',
        'Bottled water'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for guide',
        'Additional food and drinks',
        'Personal equipment'
      ],
      duration: '8 hours',
      groupSize: '2-12 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'jozani_rock_kuza',
      title:
          'Visit to Jozani Forest, The Rock Restaurant and Kuza Cave (1 Day)',
      description:
          'Nature and culinary adventure with a stop at the iconic oceanfront Rock Restaurant and Kuza Cave. Experience Zanzibar\'s natural beauty and unique dining.',
      price: 'From \$150',
      location: 'Jozani Forest, The Rock Restaurant, Kuza Cave',
      howToGetThere: 'Hotel pickup + drive to Jozani area',
      travelTime: 'Full day tour',
      imagePath: 'assets/images/alltours/kuzacave.jpg',
      highlights: [
        'Red Colobus monkeys in Jozani Forest',
        'Iconic Rock Restaurant dining',
        'Kuza Cave exploration',
        'Mangrove forest walk',
        'Oceanfront dining experience',
        'Natural cave formations'
      ],
      included: [
        'Professional guide',
        'Hotel pickup and drop-off',
        'Jozani Forest entrance fees',
        'Lunch at The Rock Restaurant',
        'Kuza Cave entrance',
        'Bottled water'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for guide',
        'Additional food and drinks',
        'Personal shopping'
      ],
      duration: '8 hours',
      groupSize: '2-12 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'jozani_dolphin_rock',
      title: 'Jozani Forest, Dolphin Tour & The Rock Restaurant (1 Day)',
      description:
          'A day of wildlife and ocean activities capped with a scenic meal at The Rock. Experience forest wildlife, marine encounters, and iconic dining.',
      price: 'From \$150',
      location: 'Jozani Forest, Kizimkazi, The Rock Restaurant',
      howToGetThere: 'Hotel pickup + drive to various locations',
      travelTime: 'Full day tour',
      imagePath: 'assets/images/alltours/jozani.jpg',
      highlights: [
        'Red Colobus monkeys in Jozani Forest',
        'Wild dolphin encounters',
        'Iconic Rock Restaurant dining',
        'Marine wildlife viewing',
        'Forest nature walk',
        'Oceanfront dining experience'
      ],
      included: [
        'Professional guide',
        'Hotel pickup and drop-off',
        'Jozani Forest entrance fees',
        'Boat trip for dolphin tour',
        'Lunch at The Rock Restaurant',
        'Bottled water'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for guide',
        'Additional food and drinks',
        'Personal equipment'
      ],
      duration: '8 hours',
      groupSize: '2-12 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'cooking_class_spice',
      title: 'Zanzibar Cooking Class and Spice Tour',
      description:
          'Hands-on traditional cooking class paired with an aromatic spice plantation tour. Learn authentic Zanzibari recipes and spice knowledge.',
      price: 'From \$110',
      location: 'Spice Plantation, Cooking School',
      howToGetThere: 'Hotel pickup + drive to spice plantation',
      travelTime: '4-5 hours',
      imagePath: 'assets/images/alltours/cookingclass.jpg',
      highlights: [
        'Hands-on cooking experience',
        'Traditional Zanzibari recipes',
        'Spice plantation tour',
        'Spice tasting session',
        'Cultural cooking methods',
        'Authentic local cuisine'
      ],
      included: [
        'Professional cooking instructor',
        'Hotel pickup and drop-off',
        'All cooking ingredients',
        'Spice plantation tour',
        'Traditional lunch',
        'Recipe booklet',
        'Bottled water'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for instructor',
        'Additional food and drinks',
        'Personal shopping'
      ],
      duration: '4-5 hours',
      groupSize: '2-12 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'turtle_sanctuary_beaches',
      title: 'Turtle Sanctuary and Northern Beaches (1 Day)',
      description:
          'Meet sea turtles and relax on Zanzibar\'s famous northern beaches like Nungwi and Kendwa. Perfect combination of wildlife conservation and beach relaxation.',
      price: 'From \$150',
      location: 'Turtle Sanctuary, Nungwi, Kendwa',
      howToGetThere: 'Hotel pickup + drive to northern beaches',
      travelTime: 'Full day tour',
      imagePath: 'assets/images/alltours/turtlesunctuary.webp',
      highlights: [
        'Sea turtle conservation center',
        'Nungwi Beach relaxation',
        'Kendwa Beach exploration',
        'Marine wildlife education',
        'Beach activities',
        'Conservation insights'
      ],
      included: [
        'Professional guide',
        'Hotel pickup and drop-off',
        'Turtle sanctuary entrance fees',
        'Beach activities',
        'Traditional lunch',
        'Bottled water'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for guide',
        'Additional food and drinks',
        'Personal beach equipment'
      ],
      duration: '8 hours',
      groupSize: '2-15 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'quad_bike_village',
      title: 'Quad bike excursion and visit to a local village (4 Hours)',
      description:
          'Ride through rural trails and experience authentic village life on this guided excursion. Adventure meets cultural immersion.',
      price: 'From \$110',
      location: 'Rural Zanzibar, Local Village',
      howToGetThere: 'Hotel pickup + drive to quad bike location',
      travelTime: '4 hours',
      imagePath: 'assets/images/alltours/quadbike.jpeg',
      highlights: [
        'Quad bike adventure',
        'Rural trail exploration',
        'Authentic village visit',
        'Cultural interaction',
        'Adventure activities',
        'Local community insights'
      ],
      included: [
        'Professional guide',
        'Hotel pickup and drop-off',
        'Quad bike rental',
        'Safety equipment',
        'Village tour',
        'Bottled water'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for guide',
        'Additional food and drinks',
        'Personal equipment'
      ],
      duration: '4 hours',
      groupSize: '2-8 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'horse_riding_nungwi',
      title: 'Horse riding in Nungwi',
      description:
          'Scenic beachside horse riding suited for all experience levels. Experience the beauty of Nungwi Beach on horseback.',
      price: 'Featured',
      location: 'Nungwi Beach, North Zanzibar',
      howToGetThere: 'Hotel pickup + drive to Nungwi',
      travelTime: '2-3 hours',
      imagePath: 'assets/images/alltours/horseriding.jpg',
      highlights: [
        'Beachside horse riding',
        'Scenic coastal views',
        'All experience levels welcome',
        'Professional instructors',
        'Safety equipment',
        'Photography opportunities'
      ],
      included: [
        'Professional instructor',
        'Hotel pickup and drop-off',
        'Horse rental',
        'Safety equipment',
        'Basic riding instruction',
        'Bottled water'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for instructor',
        'Additional food and drinks',
        'Personal equipment'
      ],
      duration: '2-3 hours',
      groupSize: '1-6 people',
      category: 'zanzibar',
    ),
    // Aquatic tours
    TourDetail(
      id: 'full_day_mnemba',
      title: 'Full Day Mnemba Island Tour (1 Day)',
      description:
          'Snorkel the famed reefs of Mnemba with pristine beaches and marine life. Experience one of the world\'s most beautiful coral reefs.',
      price: 'From \$450',
      location: 'Mnemba Atoll, Northeast Zanzibar',
      howToGetThere: 'Hotel pickup + drive to Matemwe + boat transfer',
      travelTime: 'Full day tour',
      imagePath: 'assets/images/alltours/fulldaymnemba.jpg',
      highlights: [
        'World-class coral reefs',
        'Pristine white sand beaches',
        'Diverse marine life',
        'Multiple snorkeling spots',
        'Crystal clear waters',
        'Professional guidance'
      ],
      included: [
        'Professional guide',
        'Hotel pickup and drop-off',
        'Boat transfer to Mnemba',
        'Snorkeling equipment',
        'Traditional lunch',
        'Bottled water and soft drinks',
        'Safety equipment'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for guide',
        'Personal equipment',
        'Additional activities'
      ],
      duration: '8-9 hours',
      groupSize: '2-15 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'half_day_mnemba',
      title: 'Half Day Mnemba Island Tour (6 Hours)',
      description:
          'A compact snorkeling adventure with crystal-clear waters and coral gardens. Perfect for those with limited time.',
      price: 'From \$150',
      location: 'Mnemba Atoll, Northeast Zanzibar',
      howToGetThere: 'Hotel pickup + drive to Matemwe + boat transfer',
      travelTime: '6 hours',
      imagePath: 'assets/images/alltours/halfdaymnemba.jpg',
      highlights: [
        'Crystal clear waters',
        'Coral gardens exploration',
        'Marine life viewing',
        'Snorkeling adventure',
        'Professional guidance',
        'Safety equipment'
      ],
      included: [
        'Professional guide',
        'Hotel pickup and drop-off',
        'Boat transfer to Mnemba',
        'Snorkeling equipment',
        'Light lunch',
        'Bottled water',
        'Safety equipment'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for guide',
        'Personal equipment',
        'Additional activities'
      ],
      duration: '6 hours',
      groupSize: '2-15 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'safari_blue_trip',
      title: 'Safari Blue Trip (1 Day)',
      description:
          'Sail a traditional dhow with multiple snorkeling stops, sandbanks, and a seafood lunch. Experience authentic Zanzibar marine adventure.',
      price: 'From \$150',
      location: 'Menai Bay Conservation Area, Southwest Zanzibar',
      howToGetThere: 'Hotel pickup + drive to Kizimkazi + dhow',
      travelTime: 'Full day tour',
      imagePath: 'assets/images/alltours/safariblue.jpg',
      highlights: [
        'Traditional dhow sailing',
        'Multiple snorkeling stops',
        'Sandbank exploration',
        'Fresh seafood lunch',
        'Marine life viewing',
        'Island hopping'
      ],
      included: [
        'Professional crew',
        'Hotel pickup and drop-off',
        'Traditional dhow',
        'Snorkeling equipment',
        'Fresh seafood lunch',
        'Bottled water and soft drinks',
        'Safety equipment'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for crew',
        'Personal equipment',
        'Additional activities'
      ],
      duration: '8-9 hours',
      groupSize: '6-20 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'salaam_cave_mtende_dolphin',
      title: 'Salaam Cave, Mtende Beach & Dolphin Tour in Kizimkazi (10 Hours)',
      description:
          'Epic ocean day with cave, beach vistas, and dolphin spotting in Kizimkazi. A comprehensive marine adventure experience.',
      price: 'From \$200',
      location: 'Salaam Cave, Mtende Beach, Kizimkazi',
      howToGetThere: 'Hotel pickup + drive to Kizimkazi area',
      travelTime: '10 hours',
      imagePath: 'assets/images/alltours/salaamcave.jpg',
      highlights: [
        'Salaam Cave exploration',
        'Mtende Beach relaxation',
        'Wild dolphin encounters',
        'Marine wildlife viewing',
        'Cave formations',
        'Beach activities'
      ],
      included: [
        'Professional guide',
        'Hotel pickup and drop-off',
        'Boat trip for dolphin tour',
        'Cave entrance fees',
        'Traditional lunch',
        'Bottled water',
        'Safety equipment'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for guide',
        'Additional food and drinks',
        'Personal equipment'
      ],
      duration: '10 hours',
      groupSize: '2-12 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'nakupenda_prison_stone_combo',
      title: 'Nakupenda, Prison Island & Stone Town Tour (Combo) (10 Hours)',
      description:
          'A premium combo of sandbank, island wildlife, and cultural history in Stone Town. Experience the best of Zanzibar in one day.',
      price: 'From \$250',
      location: 'Nakupenda Sandbank, Prison Island, Stone Town',
      howToGetThere: 'Hotel pickup + boat transfers',
      travelTime: '10 hours',
      imagePath: 'assets/images/alltours/nakupenda.jpg',
      highlights: [
        'Pristine Nakupenda sandbank',
        'Aldabra giant tortoises',
        'UNESCO Stone Town exploration',
        'Marine wildlife viewing',
        'Cultural heritage sites',
        'Island hopping adventure'
      ],
      included: [
        'Professional guide',
        'Hotel pickup and drop-off',
        'Boat transfers to all locations',
        'Entrance fees to all sites',
        'Traditional lunch',
        'Bottled water and soft drinks',
        'Safety equipment'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for guide',
        'Additional food and drinks',
        'Personal shopping'
      ],
      duration: '10 hours',
      groupSize: '2-15 people',
      category: 'zanzibar',
    ),
    TourDetail(
      id: 'sunset_dinner_kendwa',
      title: 'Sunset Dinner at Kendwa Beach (2 Hours)',
      description:
          'Romantic seaside dining experience at sunset. Perfect for couples and special occasions.',
      price: 'From \$250',
      location: 'Kendwa Beach, North Zanzibar',
      howToGetThere: 'Hotel pickup + drive to Kendwa',
      travelTime: '2 hours',
      imagePath: 'assets/images/alltours/sunsetkendwa.jpg',
      highlights: [
        'Romantic sunset views',
        'Seaside dining experience',
        'Fresh seafood cuisine',
        'Professional service',
        'Photography opportunities',
        'Intimate atmosphere'
      ],
      included: [
        'Professional service',
        'Hotel pickup and drop-off',
        'Multi-course dinner',
        'Wine and beverages',
        'Sunset viewing',
        'Romantic setup'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for staff',
        'Additional beverages',
        'Personal shopping'
      ],
      duration: '2 hours',
      groupSize: '2-8 people',
      category: 'zanzibar',
    ),
  ];

  static List<TourDetail> safariTours = [
    TourDetail(
      id: 'mikumi_day_trip',
      title: 'Mikumi Day Trip (1 Day)',
      description:
          'Savannah landscapes and abundant wildlife near Dar es Salaam. Experience diverse wildlife in Tanzania\'s accessible national park.',
      price: 'From \$420',
      location: 'Mikumi National Park, Morogoro Region',
      howToGetThere: 'Drive from Dar es Salaam or fly-in safari',
      travelTime: '4-5 hours drive from Dar es Salaam',
      imagePath: 'assets/images/safaris.png',
      highlights: [
        'Savannah landscapes',
        'Abundant wildlife viewing',
        'Professional safari guide',
        '4x4 safari vehicle',
        'Accessible from Dar es Salaam',
        'Photography opportunities'
      ],
      included: [
        'Professional safari guide',
        '4x4 safari vehicle',
        'Park entrance fees',
        'Lunch and refreshments',
        'Transport from Dar es Salaam',
        'Game drives'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for guide',
        'Additional activities',
        'Personal insurance'
      ],
      duration: '1 day',
      groupSize: '2-6 people',
      category: 'safari',
    ),
    TourDetail(
      id: 'selous_day_trip',
      title: 'Selous Safari Day trip (1 Day)',
      description:
          'Day outing tracking wildlife along the Rufiji River in Nyerere (Selous). Classic boat and game drive possibilities.',
      price: 'From \$420',
      location: 'Nyerere (Selous) National Park',
      howToGetThere: 'Fly Dar es Salaam → Selous or drive (long day)',
      travelTime: '1 hr flight or 5–6 hr drive from Dar',
      imagePath: 'assets/images/alltours/seloussafaritrip.jpg',
      highlights: [
        'Rufiji River wildlife',
        'Boat and game drives',
        'Elephants, hippos, crocs, birds',
      ],
      included: [
        'Professional safari guide',
        'Park entrance fees',
        'Game drives',
      ],
      notIncluded: [
        'Flights (unless specified)',
        'Personal expenses',
        'Tips for staff',
      ],
      duration: '1 day',
      groupSize: '2-6 people',
      category: 'safari',
    ),
    TourDetail(
      id: 'five_days_safari',
      title: 'Unforgettable 6-Day Tanzania Safari Adventure (6 Days)',
      description:
          'Balanced itinerary across highlights of the Northern Circuit. Experience the best of Tanzania\'s wildlife with comprehensive game drives across Serengeti, Ngorongoro Crater, Tarangire, and Lake Manyara with experienced guides.',
      price: 'Featured',
      location:
          'Northern Circuit (Serengeti, Ngorongoro, Tarangire, Lake Manyara)',
      howToGetThere: 'Fly Zanzibar → Arusha + road transfers to parks',
      travelTime: '6-day comprehensive safari',
      imagePath: 'assets/images/alltours/safariadventure.jpg',
      highlights: [
        'Comprehensive Northern Circuit coverage',
        'Serengeti National Park game drives',
        'Ngorongoro Crater exploration',
        'Tarangire National Park elephant viewing',
        'Lake Manyara bird watching',
        'Multiple game drives with expert guides',
        'Luxury accommodation throughout'
      ],
      included: [
        'Luxury accommodation in all parks',
        'Professional safari guide',
        '4x4 safari vehicle with pop-up roof',
        'All meals and bottled water',
        'Park entrance fees',
        'Multiple game drives',
        'Airport transfers',
        'All activities as per itinerary',
        'Professional photography assistance'
      ],
      notIncluded: [
        'International flights',
        'Personal expenses',
        'Tips for staff',
        'Additional activities',
        'Alcoholic beverages',
        'Personal insurance'
      ],
      duration: '6 days',
      groupSize: '2-6 people',
      category: 'safari',
    ),
    TourDetail(
      id: 'tarangire_ngorongoro_2day',
      title: '2-Day Tarangire & Ngorongoro Crater from Zanzibar (2 Days)',
      description:
          'Short but mighty fly-in safari from the islands. Experience elephants in Tarangire and the Big Five in Ngorongoro Crater.',
      price: 'Featured',
      location: 'Tarangire National Park & Ngorongoro Conservation Area',
      howToGetThere: 'Fly Zanzibar → Arusha + drive to parks',
      travelTime: 'Multi-day safari with accommodation',
      imagePath: 'assets/images/simba.png',
      highlights: [
        'Elephant viewing in Tarangire',
        'Big Five in Ngorongoro Crater',
        'Professional safari guide',
        '4x4 safari vehicle',
        'Fly-in convenience',
        'Luxury accommodation'
      ],
      included: [
        'Return flights Zanzibar-Arusha',
        'Accommodation',
        'Professional safari guide',
        '4x4 safari vehicle',
        'All meals',
        'Park entrance fees',
        'Game drives'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for staff',
        'Additional activities',
        'Personal insurance'
      ],
      duration: '2 days',
      groupSize: '2-6 people',
      category: 'safari',
    ),
    TourDetail(
      id: 'serengeti_3day',
      title: 'Serengeti (3-Day Mid-Range)',
      description:
          'Experience the Great Migration and witness the circle of life in the Serengeti. A comprehensive safari experience.',
      price: '450 – 1,700 USD pp',
      location: 'Serengeti Region, Northern Tanzania',
      howToGetThere:
          'Fly Zanzibar → Arusha (1 hr) + 1 hr drive to park entry or small plane to airstrip',
      travelTime: 'Multi-day safari requires accommodation',
      imagePath: 'assets/images/simba.png',
      highlights: [
        'Great Migration viewing',
        'Big Five wildlife',
        'Professional safari guide',
        'Luxury tented camps',
        'Multiple game drives',
        'Cultural experiences'
      ],
      included: [
        'Accommodation in tented camps',
        'Professional safari guide',
        '4x4 safari vehicle',
        'All meals',
        'Park entrance fees',
        'Multiple game drives'
      ],
      notIncluded: [
        'International flights',
        'Personal expenses',
        'Tips for staff',
        'Additional activities'
      ],
      duration: '3 days',
      groupSize: '2-6 people',
      category: 'safari',
    ),
    TourDetail(
      id: 'serengeti_per_day',
      title: 'Serengeti (Per Day)',
      description:
          'Daily safari rates in the world-famous Serengeti National Park with various accommodation options.',
      price: '200 USD (budget) – 600+ USD (luxury)',
      location: 'Serengeti National Park',
      howToGetThere: 'Fly Zanzibar → Arusha + drive to park',
      travelTime: 'Daily rates with accommodation',
      imagePath: 'assets/images/safaris.png',
      highlights: [
        'Daily wildlife viewing',
        'Flexible accommodation',
        'Professional guides',
        '4x4 safari vehicles',
        'Photography opportunities',
        'Cultural experiences'
      ],
      included: [
        'Accommodation',
        'Professional safari guide',
        '4x4 safari vehicle',
        'All meals',
        'Park entrance fees',
        'Daily game drives'
      ],
      notIncluded: [
        'International flights',
        'Personal expenses',
        'Tips for staff',
        'Additional activities'
      ],
      duration: '1+ days',
      groupSize: '2-6 people',
      category: 'safari',
    ),
    TourDetail(
      id: 'safari_2day',
      title: '2-Day Safari (from Zanzibar)',
      description:
          'Short safari adventure combining multiple parks for maximum wildlife viewing in a compact timeframe.',
      price: '818+ USD pp',
      location: 'Multiple parks (Serengeti, Ngorongoro, etc.)',
      howToGetThere: 'Fly Zanzibar → Arusha + drive to parks',
      travelTime: '2-day adventure with accommodation',
      imagePath: 'assets/images/simba.png',
      highlights: [
        'Multiple park visits',
        'Intensive wildlife viewing',
        'Professional guides',
        'Luxury accommodation',
        'Efficient itinerary',
        'Photography opportunities'
      ],
      included: [
        'Return flights Zanzibar-Arusha',
        'Accommodation',
        'Professional safari guide',
        '4x4 safari vehicle',
        'All meals',
        'Park entrance fees'
      ],
      notIncluded: [
        'Personal expenses',
        'Tips for staff',
        'Additional activities',
        'Personal insurance'
      ],
      duration: '2 days',
      groupSize: '2-6 people',
      category: 'safari',
    ),
    TourDetail(
      id: 'safari_3_5day',
      title: '3–5 Day Safari (Serengeti + Ngorongoro)',
      description:
          'Comprehensive safari experience covering the best of northern Tanzania with luxury accommodations.',
      price: '1,500 – 3,500 USD pp',
      location: 'Serengeti + Ngorongoro Conservation Area',
      howToGetThere: 'Fly Zanzibar → Arusha + drive to parks',
      travelTime: 'Multi-day luxury safari',
      imagePath: 'assets/images/safaris.png',
      highlights: [
        'Comprehensive wildlife viewing',
        'Luxury accommodations',
        'Professional guides',
        'Multiple game drives',
        'Cultural experiences',
        'Photography opportunities'
      ],
      included: [
        'Luxury accommodation',
        'Professional safari guide',
        '4x4 safari vehicle',
        'All meals',
        'Park entrance fees',
        'Multiple game drives',
        'Cultural experiences'
      ],
      notIncluded: [
        'International flights',
        'Personal expenses',
        'Tips for staff',
        'Additional activities'
      ],
      duration: '3-5 days',
      groupSize: '2-6 people',
      category: 'safari',
    ),
    TourDetail(
      id: 'luxury_safaris',
      title: 'Luxury Safaris',
      description:
          'Premium safari experiences with luxury accommodations and exclusive game viewing opportunities.',
      price: 'Up to 5,000+ USD pp',
      location: 'Various premium locations',
      howToGetThere: 'Private transfers and flights',
      travelTime: 'Luxury private safari experience',
      imagePath: 'assets/images/simba.png',
      highlights: [
        'Exclusive wildlife viewing',
        'Luxury accommodations',
        'Private guides',
        'Premium vehicles',
        'Gourmet dining',
        'Personalized service'
      ],
      included: [
        'Luxury accommodation',
        'Private safari guide',
        'Premium 4x4 vehicle',
        'Gourmet meals',
        'Park entrance fees',
        'Private game drives',
        'Personalized service'
      ],
      notIncluded: [
        'International flights',
        'Personal expenses',
        'Tips for staff',
        'Additional luxury services'
      ],
      duration: '3-10 days',
      groupSize: '2-4 people',
      category: 'safari',
    ),
    // Additional safari tours from URLs
    TourDetail(
      id: 'migration_safari',
      title:
          '8 Days River Crossing – Wildebeest Migration Safari (8 Days) - Serengeti',
      description:
          'Witness the legendary migration and apex predators in action. Experience the Great Migration in its full glory with professional guides.',
      price: 'Featured',
      location: 'Serengeti National Park',
      howToGetThere: 'Fly Zanzibar → Arusha + drive to Serengeti',
      travelTime: '8-day safari adventure',
      imagePath: 'assets/images/alltours/migrationsafari.jpg',
      highlights: [
        'Wildebeest migration viewing',
        'River crossing spectacle',
        'Big Five wildlife',
        'Professional safari guide',
        'Luxury tented camps',
        'Multiple game drives'
      ],
      included: [
        'Accommodation in luxury camps',
        'Professional safari guide',
        '4x4 safari vehicle',
        'All meals',
        'Park entrance fees',
        'Multiple game drives',
        'Airport transfers'
      ],
      notIncluded: [
        'International flights',
        'Personal expenses',
        'Tips for staff',
        'Additional activities'
      ],
      duration: '8 days',
      groupSize: '2-6 people',
      category: 'safari',
    ),
    TourDetail(
      id: 'tarangire_serengeti_ngorongoro_4day',
      title: '4 Days Safari in Tarangire, Serengeti and Ngorongoro (4 Days)',
      description:
          'Elephants, big cats, and crater landscapes in one trip. Experience the best of northern Tanzania\'s wildlife.',
      price: 'Featured',
      location: 'Tarangire, Serengeti, Ngorongoro',
      howToGetThere: 'Fly Zanzibar → Arusha + drive to parks',
      travelTime: '4-day safari adventure',
      imagePath: 'assets/images/alltours/tarangire.webp',
      highlights: [
        'Elephant viewing in Tarangire',
        'Big cats in Serengeti',
        'Ngorongoro Crater exploration',
        'Professional safari guide',
        'Luxury accommodation',
        'Multiple game drives'
      ],
      included: [
        'Accommodation',
        'Professional safari guide',
        '4x4 safari vehicle',
        'All meals',
        'Park entrance fees',
        'Game drives',
        'Airport transfers'
      ],
      notIncluded: [
        'International flights',
        'Personal expenses',
        'Tips for staff',
        'Additional activities'
      ],
      duration: '4 days',
      groupSize: '2-6 people',
      category: 'safari',
    ),
    TourDetail(
      id: 'selous_4day',
      title: '4 Days / 3 Nights Selous Safari (4 Days)',
      description:
          'Selous Game Reserve (Nyerere) is Africa\'s largest game reserve with elephants, black rhinos, hippos, lions, wild dogs, buffalo, giraffes, zebras and crocs in great numbers. Enjoy wild and spectacular scenery, excellent birding, and variety: game drives, boat and walking safaris. Program: Day 1 Fly Zanzibar/Dar → Selous, full-day game drive, picnic lunch, dinner and overnight at camp. Day 2 Sunrise boat ride on Rufiji, breakfast, Masai village visit with lunch, village activities, dinner and overnight in tents at the village. Day 3 Breakfast, village walk, return to Selous for game drive, optional hot spring bath, dinner and overnight at camp. Day 4 Early breakfast, walking safari with armed ranger or morning boat safari, then transfer to airstrip for flight to Zanzibar/Dar.',
      price: 'Featured',
      location: 'Nyerere (Selous) National Park',
      howToGetThere: 'Fly Zanzibar/Dar es Salaam → Selous (recommended)',
      travelTime: '4 days total',
      imagePath: 'assets/images/alltours/seloussafari.jpg',
      highlights: [
        'Full-day game drive on arrival',
        'Sunrise boat ride on the Rufiji River',
        'Masai village visit with activities',
        'Hot spring en route (optional)',
        'Walking safari with armed ranger',
        'Abundant wildlife and birdlife'
      ],
      included: [
        'Flight to and from Zanzibar',
        'All park entrance fees & full safari',
        'Full Safari (4×4 Jeep)',
        'Boat Safari',
        'Government taxes',
        'Soft drinks',
        'Lunch box with 2 bottles of mineral water',
        'Transfer to/from the hotel'
      ],
      notIncluded: ['Tips for the guide', 'Activity not mentioned'],
      duration: '4 days / 3 nights',
      groupSize: '2-6 people',
      category: 'safari',
    ),
    TourDetail(
      id: 'calving_season_safari',
      title: '4 days migration calving season safari (4 Days)',
      description:
          'Prime time for predator sightings and new life on the plains. Witness the calving season of the Great Migration.',
      price: 'Featured',
      location: 'Serengeti National Park',
      howToGetThere: 'Fly Zanzibar → Arusha + drive to Serengeti',
      travelTime: '4-day safari adventure',
      imagePath: 'assets/images/alltours/calving.jpg',
      highlights: [
        'Calving season viewing',
        'Predator sightings',
        'New life on the plains',
        'Professional safari guide',
        'Luxury accommodation',
        'Multiple game drives'
      ],
      included: [
        'Accommodation',
        'Professional safari guide',
        '4x4 safari vehicle',
        'All meals',
        'Park entrance fees',
        'Game drives',
        'Airport transfers'
      ],
      notIncluded: [
        'International flights',
        'Personal expenses',
        'Tips for staff',
        'Additional activities'
      ],
      duration: '4 days',
      groupSize: '2-6 people',
      category: 'safari',
    ),
    TourDetail(
      id: 'selous_3day',
      title: '3 Days Selous Safari (3 Days)',
      description:
          'Immersive bush experience with diverse habitats in Tanzania\'s largest game reserve. Enjoy boat safaris, walking safaris, and game drives in this UNESCO World Heritage Site.',
      price: 'From \$650',
      location: 'Nyerere (Selous) National Park',
      howToGetThere: 'Fly Dar es Salaam → Selous',
      travelTime: '3-day safari adventure',
      imagePath: 'assets/images/alltours/3daysselous.jpg',
      highlights: [
        'Diverse habitat exploration',
        'Boat safaris on Rufiji River',
        'Walking safaris with armed rangers',
        'Game drives in 4x4 vehicles',
        'Wildlife viewing (elephants, hippos, crocodiles)',
        'Bird watching (400+ species)',
        'Professional guides'
      ],
      included: [
        'Accommodation in Selous',
        'Professional safari guide',
        '4x4 safari vehicle',
        'All meals and bottled water',
        'Park entrance fees',
        'Boat and walking safaris',
        'Airport transfers'
      ],
      notIncluded: [
        'International flights',
        'Personal expenses',
        'Tips for staff',
        'Additional activities',
        'Alcoholic beverages'
      ],
      duration: '3 days',
      groupSize: '2-6 people',
      category: 'safari',
    ),
    TourDetail(
      id: 'selous_2day',
      title: '2 Days Selous Safari (2 Days)',
      description:
          'Quick escape to the wild with river safaris. Perfect short safari experience in Selous.',
      price: 'From \$650',
      location: 'Nyerere (Selous) National Park',
      howToGetThere: 'Fly Dar es Salaam → Selous',
      travelTime: '2-day safari adventure',
      imagePath: 'assets/images/alltours/2daysselous.webp',
      highlights: [
        'River safari experience',
        'Wildlife viewing',
        'Professional guides',
        'Game drives',
        'Boat safaris',
        'Wilderness experience'
      ],
      included: [
        'Accommodation',
        'Professional safari guide',
        '4x4 safari vehicle',
        'All meals',
        'Park entrance fees',
        'Boat safaris',
        'Airport transfers'
      ],
      notIncluded: [
        'International flights',
        'Personal expenses',
        'Tips for staff',
        'Additional activities'
      ],
      duration: '2 days',
      groupSize: '2-6 people',
      category: 'safari',
    ),
    TourDetail(
      id: 'luxury_fly_safari',
      title: '3-Day Luxury Fly in, Fly out Safari (3 Days)',
      description:
          'Fly into the Serengeti to maximize time and comfort, enjoy luxury game drives, then continue to Ngorongoro Crater before flying back to Zanzibar. Day 1: Fly Zanzibar → Serengeti Airstrip, morning and evening game drives, lunch at lodge, sunset in Serengeti. Day 2: Morning game drive in Serengeti, lunch, then drive to Ngorongoro Serena Lodge on the crater rim. Day 3: Early descent into Ngorongoro Crater to seek the black rhino and Big Five, lunch at hippo lake, then drive to Arusha airport and fly back to Zanzibar.',
      price: 'Featured',
      location: 'Serengeti National Park, Ngorongoro Crater',
      howToGetThere:
          'Fly Zanzibar → Serengeti Airstrip → Ngorongoro → Arusha → Zanzibar',
      travelTime: '3 days',
      imagePath: 'assets/images/alltours/4dayssafari.jpg',
      highlights: [
        'Fly directly into the Serengeti (skip long drives)',
        'Luxury Serengeti game drives',
        'Ngorongoro Crater Big Five adventure',
        'Seamless scenic flight back to Zanzibar'
      ],
      included: [
        'All park entrances & taxes',
        'Accommodation',
        'Meals & bottled water (3L+ per day)',
        'Soft drinks (beers & wine)',
        'Fly & bug spray (for use in parks)',
        'Airport transfers (before/after the trip)',
        'Professional safari guide & safari chef',
        'All flights during the tour',
        'Air ambulance services',
        'Budget hotel before & after safari (as listed)',
        'Safari jeep 4×4 with pop-up roof, radio, cooler fridge & charging ports'
      ],
      notIncluded: [
        'Tips (see recommended guideline)',
        'Visas',
        'Items of personal nature'
      ],
      duration: '3 days',
      groupSize: '2-6 people',
      category: 'safari',
    ),
  ];

  static TourDetail? getTourById(String id) {
    final allTours = [...zanzibarTours, ...safariTours];
    try {
      return allTours.firstWhere((tour) => tour.id == id);
    } catch (e) {
      return null;
    }
  }
}
