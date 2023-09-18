'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "1a30a607c11b55eee35cf68f82f5f86c",
"splash/img/light-2x.png": "33008abafef7f4d308b452caddce8646",
"splash/img/dark-4x.png": "f86c4a0ea25ff963ebcbfe697c460503",
"splash/img/light-3x.png": "6937dae072bbbf338d0cfad788ad3642",
"splash/img/dark-3x.png": "6937dae072bbbf338d0cfad788ad3642",
"splash/img/light-4x.png": "f86c4a0ea25ff963ebcbfe697c460503",
"splash/img/dark-2x.png": "33008abafef7f4d308b452caddce8646",
"splash/img/dark-1x.png": "d9c0175c80dfa10efd1d96cec4671384",
"splash/img/light-1x.png": "d9c0175c80dfa10efd1d96cec4671384",
"splash/splash.js": "123c400b58bea74c1305ca3ac966748d",
"splash/style.css": "0f7569a895dbfcaf7e22e485490a1666",
"index.html": "088b81b2b241fda15bfe5762b9224ecb",
"/": "c5fccfed62c26d7369a990bccf663e99",
"test/widget_test.dart": "e56c17895854c0b8c912a16524b1b270",
"qbrix_cdfb1.iml": "731a1a3080009db8d4572ef3fb1679c3",
"main.dart.js": "88684d007d1786946876ca21c8e7976a",
"web/index.html": "31dabb6fbb20d78c98ae3e273f7b1aa0",
"web/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"web/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"web/icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"web/icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"web/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"web/manifest.json": "724c741db600ffd934aa57a07d788aa5",
"pubspec.lock": "9b31aed2573a2475e3a0aa60c1c85309",
"flutter.js": "0b19a3d1d54c58174c41cd35acdd9388",
"README.md": "a6e5d18dd3c22a9cd79b5cc9ad7b12dc",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"pubspec.yaml": "c569b74c05136508baa32bab7ceb0704",
"icons/Icon-192.png": "6ffed53e08d555865d5f398954fe9046",
"icons/Icon-maskable-192.png": "6ffed53e08d555865d5f398954fe9046",
"icons/Icon-maskable-512.png": "0b848a908f21cd21165110231d8e58b8",
"icons/Icon-512.png": "0b848a908f21cd21165110231d8e58b8",
"manifest.json": "1f56defdbafee2f8133ebbe28c43d9aa",
"lib/main.dart": "86b0318255916c11ea138782b971c22e",
"analysis_options.yaml": "66d03d7647c8e438164feaf5b922d44a",
"build/web/version.json": "206451eee24789689db8813eba725b0c",
"build/web/index.html": "c5fccfed62c26d7369a990bccf663e99",
"build/web/main.dart.js": "0e1d73b81e35e3b985dc699cecf45c45",
"build/web/flutter.js": "0b19a3d1d54c58174c41cd35acdd9388",
"build/web/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"build/web/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"build/web/icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"build/web/icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"build/web/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"build/web/manifest.json": "724c741db600ffd934aa57a07d788aa5",
"build/web/assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
"build/web/assets/NOTICES": "f79e755e9f0a75ad402a8d3104d4b199",
"build/web/assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"build/web/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"build/web/assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"build/web/assets/AssetManifest.bin": "693635b5258fe5f1cda720cf224f158c",
"build/web/assets/fonts/MaterialIcons-Regular.otf": "65e21b5db78a7c132bbb04776ec9c399",
"build/web/canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"build/web/canvaskit/skwasm.wasm": "c3803dbb1ac015d00c055bea11adb934",
"build/web/canvaskit/chromium/canvaskit.js": "2236901a15edcdf16e2eaf18ea7a7415",
"build/web/canvaskit/chromium/canvaskit.wasm": "addd330d70d04918ab2059efeba5105f",
"build/web/canvaskit/canvaskit.js": "7c4a2df28f03b428a63fb10250463cf5",
"build/web/canvaskit/canvaskit.wasm": "f93cce574798cbc3f46e44765b523058",
"build/web/canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
".dart_tool/package_config.json": "9660c9dbd5d69440eb593ca4dd9292e1",
".dart_tool/flutter_build/eb7e40dd4a074cdbd647ab2d7457b7d8/web_service_worker.stamp": "77de1207ae07544c415e5f0e30cebb4a",
".dart_tool/flutter_build/eb7e40dd4a074cdbd647ab2d7457b7d8/dart2js.d": "2042a80f356fbe92aa71e98819577073",
".dart_tool/flutter_build/eb7e40dd4a074cdbd647ab2d7457b7d8/gen_localizations.stamp": "436d2f2faeb7041740ee3f49a985d62a",
".dart_tool/flutter_build/eb7e40dd4a074cdbd647ab2d7457b7d8/web_static_assets.stamp": "77a69e5dbfb5f8391385a63b89cbaef8",
".dart_tool/flutter_build/eb7e40dd4a074cdbd647ab2d7457b7d8/main.dart.js.deps": "eb9f520a1c9f9446cac469e870b5affc",
".dart_tool/flutter_build/eb7e40dd4a074cdbd647ab2d7457b7d8/main.dart.js": "0e1d73b81e35e3b985dc699cecf45c45",
".dart_tool/flutter_build/eb7e40dd4a074cdbd647ab2d7457b7d8/app.dill": "e479b7f467f3d239d7744c7ca71b23b2",
".dart_tool/flutter_build/eb7e40dd4a074cdbd647ab2d7457b7d8/outputs.json": "4aaadd9d986e60b91803fff619f15af6",
".dart_tool/flutter_build/eb7e40dd4a074cdbd647ab2d7457b7d8/web_release_bundle.stamp": "8828fc4087227b07dc2d094eddc62782",
".dart_tool/flutter_build/eb7e40dd4a074cdbd647ab2d7457b7d8/flutter_assets.d": "0c5dad5a9123352370c880c4f05914e3",
".dart_tool/flutter_build/eb7e40dd4a074cdbd647ab2d7457b7d8/main.dart": "d3bc3d960a182e747a78f360d48a94f2",
".dart_tool/flutter_build/eb7e40dd4a074cdbd647ab2d7457b7d8/dart2js.stamp": "e15bc537e1bbdf6978183a9a43ceaaaf",
".dart_tool/flutter_build/eb7e40dd4a074cdbd647ab2d7457b7d8/service_worker.d": "a6e6910be821767ed77e35658bbe6e8b",
".dart_tool/flutter_build/eb7e40dd4a074cdbd647ab2d7457b7d8/web_resources.d": "3ccc205b0bb927059d1ca8fc59037586",
".dart_tool/flutter_build/eb7e40dd4a074cdbd647ab2d7457b7d8/web_plugin_registrant.dart": "7ed35bc85b7658d113371ffc24d07117",
".dart_tool/flutter_build/eb7e40dd4a074cdbd647ab2d7457b7d8/app.dill.deps": "84ea0f0406df7b349af323b2eb918f37",
".dart_tool/flutter_build/eb7e40dd4a074cdbd647ab2d7457b7d8/web_entrypoint.stamp": "5320c4ab66f1b34dbeba008b64068731",
".dart_tool/dartpad/web_plugin_registrant.dart": "7ed35bc85b7658d113371ffc24d07117",
".dart_tool/package_config_subset": "6468f04d7e217e29ece4caacd8a32e23",
".dart_tool/version": "4aac408e583ab62dd9c535089a15ec3a",
"assets/AssetManifest.json": "4d2bff701e36a389f4a614b363452ad4",
"assets/NOTICES": "c34ee0303d88aa0b801f8dcf0d5b7a68",
"assets/FontManifest.json": "9c57c8d4985e9ecebb5e8cfe006fa4de",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "267b7f3737f16cf7a1438ac546b8a0e2",
"assets/fonts/MaterialIcons-Regular.otf": "dad2f8baf1afd859f8707fdddc6a2e83",
"assets/assets/puzzle/I.png": "698054266e3c0bf9af48421b84aefc1c",
"assets/assets/puzzle/L.png": "db8ad87db29957829c1099bfc5cb0c7f",
"assets/assets/puzzle/A.png": "3e3a1b39f2409872157b6ea0a1839101",
"assets/assets/puzzle/W.png": "da7317535fd73e6018f278de14ca5ae5",
"assets/assets/puzzle/E.png": "7b488b5e3e0790cf3a3834c9cc8dcd24",
"assets/assets/images/splash.png": "d843ffa42cf659689f823f35b301cd98",
"assets/assets/generate-pdf/resume.svg": "46677fc92c26b05ef05f6f57ee6cbf2f",
"assets/assets/generate-pdf/swirls1.svg": "7b2b0976d9656ce4badcb72c1d1eb9a2",
"assets/assets/generate-pdf/app-logo.svg": "b0ce2ba920596a3a8e506d5a27b63cb7",
"assets/assets/generate-pdf/swirls3.svg": "0691e7353e1767ce6b2f8ca43a80fec9",
"assets/assets/generate-pdf/swirls2.svg": "5b91d6eef2a3c06a44b2ffe870538535",
"assets/assets/generate-pdf/document.svg": "c0d272e3925fb4d1e2fa5828863da184",
"assets/assets/generate-pdf/medail.svg": "bb392b5d8b6f0881891c5fcb1efd56db",
"assets/assets/generate-pdf/garland.svg": "6e75c8b61d9ab548483d72a5a4a0560a",
"assets/assets/generate-pdf/profile.jpg": "1e4cf308782c44346db361e95c003a6c",
"assets/assets/generate-pdf/calendar.svg": "44dc5e7c4290b9312b91f0cb3377bd2d",
"assets/assets/generate-pdf/invoice.svg": "ed6bd474d30a8d750aa924a78918b1ac",
"assets/assets/generate-pdf/swirls.svg": "ebd60d6baf67414628147028ea5382d0",
"assets/assets/generate-pdf/logo.svg": "50ac89287e374ce31bacbc5baede9bb3",
"assets/assets/fonts/Oswald/Oswald-Medium.ttf": "14cf874b374ca47427bbceb4b2373c3a",
"assets/assets/fonts/Oswald/Oswald-VariableFont_wght.ttf": "ca399fd2286e6d1e50bd65bd950b33ef",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "c3803dbb1ac015d00c055bea11adb934",
"canvaskit/chromium/canvaskit.js": "2236901a15edcdf16e2eaf18ea7a7415",
"canvaskit/chromium/canvaskit.wasm": "addd330d70d04918ab2059efeba5105f",
"canvaskit/canvaskit.js": "7c4a2df28f03b428a63fb10250463cf5",
"canvaskit/canvaskit.wasm": "f93cce574798cbc3f46e44765b523058",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
".idea/runConfigurations/main_dart.xml": "2b82ac5d547e7256de51268edfd10dc3",
".idea/libraries/Dart_SDK.xml": "04e1f02e86b7e472810b417c9ac89f85",
".idea/libraries/KotlinJavaRuntime.xml": "4b0df607078b06360237b0a81046129d",
".idea/workspace.xml": "cc5f609be0f96835c87839f62217d14b",
".idea/modules.xml": "6e1348e02027d969724b2b953dc4bfa8"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
