'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "10c11bb993f38c7cdb245d8c61683c8e",
"assets/AssetManifest.bin.json": "2058edb42dbf86ef810606e6246412ba",
"assets/AssetManifest.json": "31bfe89cdb47456aec34972fd8ee6ff9",
"assets/assets/images/alltours/2daysselous.webp": "382e74aea1ccde2d1daa7367c0e59818",
"assets/assets/images/alltours/3daysselous.jpg": "6490f275bc9565f2ee083e0cfbcdc784",
"assets/assets/images/alltours/4dayssafari.jpg": "d5b26d1780955cb181ad0b36c1c7c79f",
"assets/assets/images/alltours/besttime.jpg": "ad6f5ea7b0cc07dc0992410d0b7b5e5e",
"assets/assets/images/alltours/bwejuubeach.png": "daa09ab3d993d7a4c103e9f570453f88",
"assets/assets/images/alltours/calving.jpg": "d4dd8d4462026398de1b28e5c75e961c",
"assets/assets/images/alltours/ceo.jpg": "a65c733a834573994ff21e49cc4b868a",
"assets/assets/images/alltours/chwakabaymangrove.png": "517516fbd72b17ebef3ec5d13f61a8d0",
"assets/assets/images/alltours/cookingclass.jpg": "fd32318e674e11c6aea773928380c437",
"assets/assets/images/alltours/dolphintour.jpg": "1ba8906ae41541e8b1126ecbdef595eb",
"assets/assets/images/alltours/fulldaymnemba.jpg": "e41a5d03cea3e763105a988679f16c57",
"assets/assets/images/alltours/halfdaymnemba.jpg": "aebe4750faaae24401f83b98e547c88c",
"assets/assets/images/alltours/horseriding.jpg": "c84d59b0f6984929c2e9a03ca7241b90",
"assets/assets/images/alltours/jozani.jpg": "54d16e0aa3edf707b19fc1f44295c469",
"assets/assets/images/alltours/kidichipersianbaths.png": "3b9220e17c01ce2ea993d6140ff2cfea",
"assets/assets/images/alltours/kizimkazibeach.png": "ff2e342e1cefc28ddd6002df9734728b",
"assets/assets/images/alltours/kizimkazioldmosque.png": "5920b11b1ee1c45d09416c997f4fd0c7",
"assets/assets/images/alltours/kuza.jpg": "a4fbf125b5a8ecf2ed60743c70ca5786",
"assets/assets/images/alltours/kuzacave.jpg": "ee5e2e8848e9e419ac49fae7a33720be",
"assets/assets/images/alltours/kwaleisland.png": "28296d46622839602b6ae5f0c557275c",
"assets/assets/images/alltours/logo.jpg": "a467e6fbeb20af818da0c38e1d1a182a",
"assets/assets/images/alltours/makunduchivillage.png": "ba6d2e4d761e5f1cbd2dc847b2cb78ca",
"assets/assets/images/alltours/mangapwanislavechambers.png": "8936b26a6781307e567101da061fa625",
"assets/assets/images/alltours/matemwebeach.png": "ab39a6232c71c6232a18db66169ee11e",
"assets/assets/images/alltours/migrationsafari.jpg": "19482f509c611e7dcb4c41d082eb2672",
"assets/assets/images/alltours/mikumidaytrip.jpeg": "254109cf9d2043ca5aff7d831fd09956",
"assets/assets/images/alltours/mkungunivillage.png": "a96ed37d92584392cea664f52f9711dc",
"assets/assets/images/alltours/mtonipalaceruins.png": "6a2e8d7468746f1374d547446e0416d9",
"assets/assets/images/alltours/muyunivillage.png": "dbb87bcb4309ac5b5be6c70721a64a3c",
"assets/assets/images/alltours/nakupenda.jpg": "437536348a999a7079d99ee3070263a8",
"assets/assets/images/alltours/ngorongoro.jpg": "7672dac4d1bfad749a55b278be574966",
"assets/assets/images/alltours/nungwiaquarium.png": "6b4bbe18560674918c37ea74e0a131cf",
"assets/assets/images/alltours/prison&stonetown.jpg": "bb4419a28c2565229597582979daac3e",
"assets/assets/images/alltours/quadbike.jpeg": "15d60b64bfd0f1254904b3e8170f7a71",
"assets/assets/images/alltours/safariadventure.jpg": "545d2cc599f67e51a9ef287fbde3b071",
"assets/assets/images/alltours/safariblue.jpg": "4c0a11074039491952be5f68c9f91f80",
"assets/assets/images/alltours/salaamcave.jpg": "c7646727812f17aae43d0b9275785308",
"assets/assets/images/alltours/seaweedcenter.png": "29a2ff68b39592edc6b954949b9fe6ca",
"assets/assets/images/alltours/seloussafari.jpg": "30125b0a889c6c394b6eeac701f71158",
"assets/assets/images/alltours/seloussafaritrip.jpg": "de1f502ad11212c8cea8104c4fe67ab2",
"assets/assets/images/alltours/sunsetcruise.jpg": "c0ca9d61c17858a78bc40dfeaa60d423",
"assets/assets/images/alltours/sunsetkendwa.jpg": "8caa00afd96de062f11efc555f433bd3",
"assets/assets/images/alltours/swahilicook.png": "b33f8d57dcc9197e2f277e0c8de023ab",
"assets/assets/images/alltours/tarangire.webp": "ea709c5c53742022a4657c9016af667b",
"assets/assets/images/alltours/tech.jpg": "37456b5103f833fc4d7f6a3fddfc1e85",
"assets/assets/images/alltours/townwalk.png": "274bf4c47b8da460a8dd58a54972892f",
"assets/assets/images/alltours/turtlesunctuary.webp": "ba0fca2ac39687f22639749a07b286b2",
"assets/assets/images/alltours/uziisland.png": "8e46e102ca22b69e5e64a8dbc11751f0",
"assets/assets/images/alltours/zalapark.png": "90c39ca40ab4674d3ebdc8726f286380",
"assets/assets/images/bahari.png": "fe6c1b397cc513785da4ddb68ad0a7b3",
"assets/assets/images/changuu.jpg": "6952bd6510a5fbb1e44a9b7b51823727",
"assets/assets/images/couple.png": "dad16d316fb534a9566d19cabcd840ff",
"assets/assets/images/jozani.jpg": "d409e93e6b9c126ac5ae78ade57642c5",
"assets/assets/images/jua.png": "0bd9e20cf0abe665658b0dd5487cd2f5",
"assets/assets/images/mji.png": "8cd86697d97f322190689722ad8bfe04",
"assets/assets/images/mji2.png": "9f8d8a06b20a93fb960b055179527c46",
"assets/assets/images/mzungu.png": "3bddd84a0f28aeb0062604311a00dc70",
"assets/assets/images/mzungu2.png": "1f87ed17c5301e1e0f1cd068159a3ee5",
"assets/assets/images/oldfort.png": "d38ce2b35ed439ce0ebcc38cf7a14e5c",
"assets/assets/images/prison-island.png": "ca140d0a49b03f45f2738abecb0dca62",
"assets/assets/images/README.md": "08965432a7fdbf84348d69b4358e1060",
"assets/assets/images/safariblue.jpg": "9d3aea3c3cdec47a8200385dc883a6f0",
"assets/assets/images/safaris.png": "737f511a9f963395d9e7b754f9aa9dcc",
"assets/assets/images/simba.png": "f543eec8332bbfb9ba00f02b718d2f16",
"assets/assets/images/spice-tour.png": "229a498675c7e0b15353c8e8afaa0478",
"assets/assets/images/spices.png": "2404aaf86b76a4bd98cc044effea41a4",
"assets/assets/images/stonetown-walking.png": "99b40298ce7870f0478210bb35ee2c1d",
"assets/assets/images/stonetown.jpg": "028b2a649f52133fc0b1663a6fc9f42e",
"assets/assets/images/tourists.jpg": "23ebc4ab08452d644d6e619f874e6e59",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "bebeecf098480119a5728f6d7e2d63d5",
"assets/NOTICES": "fe69af7b9b1aef12be8368a0363345af",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "5f72d664707e4d711a1c0c240912cd50",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "394b92583822aea82c6f1d10877c255f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "e848d24bc2ae8353d1eb767d2fa978d4",
"/": "e848d24bc2ae8353d1eb767d2fa978d4",
"main.dart.js": "69dcd6ba727c68ac2aadcc949966a838",
"manifest.json": "0a800c7152675abf3257689f1a1e2a92",
"version.json": "2a71af05616aa13acb0fc8ac0f3f347e"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
