class HiddenGem {
  final String id;
  final String title;
  final String category;
  final String location;
  final String highlights;
  final String whyVisit;
  final String update2025;
  final String imagePath;
  final String description;

  HiddenGem({
    required this.id,
    required this.title,
    required this.category,
    required this.location,
    required this.highlights,
    required this.whyVisit,
    required this.update2025,
    required this.imagePath,
    required this.description,
  });
}

class HiddenGemsData {
  static List<HiddenGem> natureSpots = [
    HiddenGem(
      id: 'uzi_island',
      title: 'Uzi Island',
      category: 'Nature & Secluded Spots',
      location: 'South of Zanzibar, 2 km off the main Unguja island',
      highlights:
          'Mangrove forests, coral causeway, local village life, birdwatching',
      whyVisit:
          'Known as one of Zanzibar\'s most untouched islands. Until now, it has been accessible only at low tide by foot.',
      update2025:
          'A new 8.7 km road and bridge is under construction (expected Dec 2025), which will make access much easier. Until then, the tidal walk remains an adventure.',
      imagePath: 'assets/images/alltours/uziisland.png',
      description:
          'Experience the untouched beauty of Uzi Island, one of Zanzibar\'s most pristine destinations. This hidden gem offers a unique adventure with its mangrove forests, coral causeway, and authentic local village life.',
    ),
    HiddenGem(
      id: 'kwale_island',
      title: 'Kwale Island',
      category: 'Nature & Secluded Spots',
      location:
          'Off the southern coast (in Mafia Channel, not far from Zanzibar)',
      highlights:
          'Mangroves, giant baobab tree, rich marine life (turtles, dugongs, whale sharks)',
      whyVisit:
          'Less crowded than Mnemba or Prison Island, offering a truly pristine nature experience.',
      update2025:
          'Community-run conservation programs now allow eco-tours supporting local livelihoods.',
      imagePath: 'assets/images/alltours/kwaleisland.png',
      description:
          'Discover the untouched paradise of Kwale Island, where giant baobab trees meet pristine marine life. This secluded haven offers encounters with turtles, dugongs, and even whale sharks.',
    ),
    HiddenGem(
      id: 'michamvi_peninsula',
      title: 'Michamvi Peninsula',
      category: 'Nature & Secluded Spots',
      location: 'East Coast, between Chwaka Bay and the Indian Ocean',
      highlights:
          'Quiet beaches, mangroves, breathtaking sunsets at Michamvi Kae',
      whyVisit:
          'One of the last tranquil peninsulas away from the busy Paje and Nungwi scenes.',
      update2025:
          'New eco-lodges are being developed while maintaining the area\'s natural tranquility.',
      imagePath: 'assets/images/safariblue.jpg',
      description:
          'Escape to the peaceful Michamvi Peninsula, where quiet beaches and mangroves create the perfect setting for breathtaking sunsets away from the tourist crowds.',
    ),
    HiddenGem(
      id: 'kidichi_baths',
      title: 'Kidichi Persian Baths',
      category: 'Nature & Secluded Spots',
      location: 'Central Unguja, built by Sultan Said',
      highlights: 'Persian-style arches, baths, gardens',
      whyVisit:
          'A glimpse into royal life—built for the Sultan\'s Persian wife, Princess Sheherazade.',
      update2025:
          'Restoration work is planned to preserve this historical architectural gem.',
      imagePath: 'assets/images/alltours/kidichipersianbaths.png',
      description:
          'Step into the royal world of the Kidichi Persian Baths, built for Princess Sheherazade. Experience the architectural beauty and historical significance of this hidden gem.',
    ),
    HiddenGem(
      id: 'nungwi_aquarium',
      title: 'Nungwi Natural Aquarium (Mnarani)',
      category: 'Nature & Secluded Spots',
      location: 'Nungwi Village, North Coast',
      highlights: 'Sea turtle rehabilitation center, natural tidal lagoon',
      whyVisit: 'Support conservation and even help feed or release turtles.',
      update2025:
          'Expanded conservation programs now include educational tours and volunteer opportunities.',
      imagePath: 'assets/images/alltours/nungwiaquarium.png',
      description:
          'Visit the Nungwi Natural Aquarium and contribute to sea turtle conservation. Experience the natural tidal lagoon and learn about marine life protection.',
    ),
    HiddenGem(
      id: 'chwaka_mangroves',
      title: 'Chwaka Bay Mangroves',
      category: 'Nature & Secluded Spots',
      location: 'East Coast near Jozani Forest',
      highlights: 'Kayaking, birdwatching, peaceful waters',
      whyVisit:
          'Rare chance to see Zanzibar\'s ecosystem of mangroves and birdlife.',
      update2025:
          'New eco-tourism initiatives include guided kayaking tours and birdwatching expeditions.',
      imagePath: 'assets/images/alltours/chwakabaymangrove.png',
      description:
          'Paddle through the serene Chwaka Bay Mangroves and discover Zanzibar\'s unique ecosystem. Perfect for kayaking, birdwatching, and peaceful nature experiences.',
    ),
    HiddenGem(
      id: 'kizimkazi_mkunguni',
      title: 'Kizimkazi Mkunguni Village',
      category: 'Nature & Secluded Spots',
      location: 'Southern Zanzibar, near Kizimkazi Dimbani',
      highlights: 'Fishing culture, dolphin spotting, authentic village life',
      whyVisit:
          'Less touristy than Dimbani, still rich in cultural and spiritual heritage.',
      update2025:
          'Community-based tourism programs are being developed to preserve local culture.',
      imagePath: 'assets/images/alltours/mkungunivillage.png',
      description:
          'Experience authentic village life in Kizimkazi Mkunguni, where fishing culture meets dolphin spotting in a less touristy setting.',
    ),
  ];

  static List<HiddenGem> culturalExperiences = [
    HiddenGem(
      id: 'coffee_ceremony',
      title: 'Zanzibar Coffee Ceremony',
      category: 'Cultural & Local Experiences',
      location: 'Stone Town',
      highlights:
          'Learn Swahili traditions through an interactive coffee ritual',
      whyVisit:
          'Unlike tourist cafés, this is a cultural immersion with locals.',
      update2025:
          'New interactive experiences include coffee roasting and traditional brewing methods.',
      imagePath: 'assets/images/spices.png',
      description:
          'Immerse yourself in authentic Swahili culture through the traditional Zanzibar Coffee Ceremony. Learn the art of coffee preparation and experience local hospitality.',
    ),
    HiddenGem(
      id: 'makunduchi_village',
      title: 'Makunduchi Village',
      category: 'Cultural & Local Experiences',
      location: 'Southern Zanzibar',
      highlights:
          'Hosts the Mwaka Kogwa New Year Festival (July), healing rituals, Swahili houses',
      whyVisit:
          'One of the most traditional villages still practicing age-old customs.',
      update2025:
          'The Mwaka Kogwa Festival is being expanded to include more cultural activities.',
      imagePath: 'assets/images/alltours/makunduchivillage.png',
      description:
          'Visit Makunduchi Village during the Mwaka Kogwa New Year Festival and witness ancient healing rituals and traditional Swahili customs.',
    ),
    HiddenGem(
      id: 'seaweed_center',
      title: 'Seaweed Center',
      category: 'Cultural & Local Experiences',
      location: 'Paje',
      highlights: 'Women-led farming, seaweed soaps, natural cosmetics',
      whyVisit:
          'Empowering women entrepreneurs while learning sustainable practices.',
      update2025:
          'New products and workshops are being introduced to support local women.',
      imagePath: 'assets/images/alltours/seaweedcenter.png',
      description:
          'Support women entrepreneurs at the Seaweed Center and learn about sustainable farming practices while discovering natural cosmetics made from local seaweed.',
    ),
    HiddenGem(
      id: 'muyuni_village',
      title: 'Muyuni Village',
      category: 'Cultural & Local Experiences',
      location: 'Southern Zanzibar',
      highlights: 'Fishing culture, authentic homestays, canoe trips',
      whyVisit: 'Off-grid and non-commercialized, real Zanzibari life.',
      update2025:
          'New homestay programs are being developed for authentic cultural experiences.',
      imagePath: 'assets/images/alltours/muyunivillage.png',
      description:
          'Experience off-grid Zanzibari life in Muyuni Village with authentic homestays, fishing culture, and traditional canoe trips.',
    ),
    HiddenGem(
      id: 'cooking_swahili',
      title: 'Cooking with a Swahili Family',
      category: 'Cultural & Local Experiences',
      location: 'Various locations across Zanzibar',
      highlights:
          'Hands-on lessons preparing pilau, octopus curry, coconut dishes',
      whyVisit: 'Eat local, live local—straight from a Zanzibari kitchen.',
      update2025:
          'New cooking classes include market visits and spice farm tours.',
      imagePath: 'assets/images/alltours/swahilicook.png',
      description:
          'Learn to cook authentic Zanzibari dishes in a local family\'s kitchen. Master the art of preparing pilau, octopus curry, and traditional coconut dishes.',
    ),
    HiddenGem(
      id: 'zala_park',
      title: 'Zala Park',
      category: 'Cultural & Local Experiences',
      location: 'Near Jozani Forest',
      highlights: 'Community-run reptile park, education center',
      whyVisit:
          'Conservation + cultural storytelling for children and families.',
      update2025:
          'New educational programs and conservation initiatives are being introduced.',
      imagePath: 'assets/images/alltours/zalapark.png',
      description:
          'Visit the community-run Zala Park for an educational experience combining conservation with cultural storytelling, perfect for families.',
    ),
  ];

  static List<HiddenGem> offbeatBeaches = [
    HiddenGem(
      id: 'kizimkazi_beach',
      title: 'Kizimkazi Beach',
      category: 'Offbeat Beaches',
      location: 'Southern Zanzibar',
      highlights:
          'Quiet fishing village, dolphin tours, historical mosque nearby',
      whyVisit: 'Peaceful alternative to Nungwi or Kendwa.',
      update2025:
          'New eco-friendly accommodations are being developed while maintaining the area\'s tranquility.',
      imagePath: 'assets/images/alltours/kizimkazibeach.png',
      description:
          'Discover the peaceful Kizimkazi Beach, a quiet fishing village offering dolphin tours and a historical mosque, perfect for those seeking tranquility.',
    ),
    HiddenGem(
      id: 'uroa_beach',
      title: 'Uroa Beach',
      category: 'Offbeat Beaches',
      location: 'East Coast',
      highlights: 'Starfish spotting, white sand',
      whyVisit: 'A calm escape, still untouched by mass resorts.',
      update2025:
          'Conservation efforts are being implemented to protect the starfish population.',
      imagePath: 'assets/images/bahari.png',
      description:
          'Escape to Uroa Beach for starfish spotting and pristine white sand, a calm retreat untouched by mass tourism.',
    ),
    HiddenGem(
      id: 'pingwe_beach',
      title: 'Pingwe Beach (The Rock)',
      category: 'Offbeat Beaches',
      location: 'East Coast',
      highlights: 'Famous Rock Restaurant, turquoise waters',
      whyVisit:
          'Beyond the restaurant, you\'ll find secluded sands and swimming spots.',
      update2025:
          'New walking trails are being developed to explore the surrounding area.',
      imagePath: 'assets/images/jua.png',
      description:
          'Explore Pingwe Beach beyond the famous Rock Restaurant to discover secluded sands and turquoise waters perfect for swimming.',
    ),
    HiddenGem(
      id: 'bwejuu_beach',
      title: 'Bwejuu Beach',
      category: 'Offbeat Beaches',
      location: 'East Coast',
      highlights: 'Long sandy stretches, calm lagoon',
      whyVisit: 'Quieter than Paje, great for couples and retreat seekers.',
      update2025: 'New wellness retreats are being developed in the area.',
      imagePath: 'assets/images/alltours/bwejuubeach.png',
      description:
          'Find peace at Bwejuu Beach with its long sandy stretches and calm lagoon, perfect for couples and wellness retreats.',
    ),
    HiddenGem(
      id: 'matemwe_beach',
      title: 'Matemwe Beach',
      category: 'Offbeat Beaches',
      location: 'Northeast Coast',
      highlights: 'Gateway to Mnemba Atoll diving, fishing village vibes',
      whyVisit: 'Still relatively peaceful compared to northern hotspots.',
      update2025: 'New diving and snorkeling programs are being developed.',
      imagePath: 'assets/images/alltours/matemwebeach.png',
      description:
          'Experience the peaceful Matemwe Beach, gateway to Mnemba Atoll diving, with authentic fishing village atmosphere.',
    ),
  ];

  static List<HiddenGem> historicalSites = [
    HiddenGem(
      id: 'mtoni_palace',
      title: 'Mtoni Palace Ruins',
      category: 'Historical & Spiritual Sites',
      location: 'North of Stone Town',
      highlights:
          'Former palace of Sultan Seyyid Said, childhood home of Princess Salme',
      whyVisit: 'Walk through ruins of royal halls, courtyards, and baths.',
      update2025:
          'New guided tours are being developed to explore the palace\'s history.',
      imagePath: 'assets/images/alltours/mtonipalaceruins.png',
      description:
          'Explore the majestic ruins of Mtoni Palace, former home of Sultan Seyyid Said and Princess Salme, and walk through royal halls and courtyards.',
    ),
    HiddenGem(
      id: 'kizimkazi_mosque',
      title: 'Kizimkazi Old Mosque',
      category: 'Historical & Spiritual Sites',
      location: 'Southern Zanzibar',
      highlights:
          'Built in 1107 CE, oldest mosque in East Africa with Kufic inscriptions',
      whyVisit: 'Spiritual history meets ancient Swahili architecture.',
      update2025:
          'Restoration work is planned to preserve the ancient inscriptions.',
      imagePath: 'assets/images/alltours/kizimkazioldmosque.png',
      description:
          'Visit the ancient Kizimkazi Old Mosque, built in 1107 CE, the oldest mosque in East Africa featuring beautiful Kufic inscriptions.',
    ),
    HiddenGem(
      id: 'mangapwani_cave',
      title: 'Mangapwani Slave Chambers & Coral Cave',
      category: 'Historical & Spiritual Sites',
      location: 'Northwest Zanzibar',
      highlights:
          'Underground chambers and coral cave used in illegal slave trade',
      whyVisit: 'A haunting yet important historical reminder.',
      update2025:
          'New educational programs are being developed to honor the historical significance.',
      imagePath: 'assets/images/alltours/mangapwanislavechambers.png',
      description:
          'Explore the haunting Mangapwani Slave Chambers and Coral Cave, important historical sites that remind us of Zanzibar\'s complex past.',
    ),
  ];

  static List<HiddenGem> getAllGems() {
    return [
      ...natureSpots,
      ...culturalExperiences,
      ...offbeatBeaches,
      ...historicalSites,
    ];
  }

  static HiddenGem? getGemById(String id) {
    final allGems = getAllGems();
    try {
      return allGems.firstWhere((gem) => gem.id == id);
    } catch (e) {
      return null;
    }
  }

  static List<HiddenGem> getGemsByCategory(String category) {
    switch (category.toLowerCase()) {
      case 'nature':
        return natureSpots;
      case 'cultural':
        return culturalExperiences;
      case 'beaches':
        return offbeatBeaches;
      case 'historical':
        return historicalSites;
      default:
        return getAllGems();
    }
  }
}
