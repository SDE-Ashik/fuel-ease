import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fuelease/firebase_options.dart';
import 'package:fuelease/map.dart';
import 'package:fuelease/src/home/views/home_views.dart';
import 'package:fuelease/src/login/controllers/auth_controller.dart';
import 'package:fuelease/src/login/view/login_page.dart';
import 'package:fuelease/src/login/view/signup_view.dart';
import 'package:fuelease/src/login/view/welcome_page.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => AuthServiceProvider())],
  child: const MyApp(),
  
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FuelEase",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFEF6969),
      ),
      initialRoute: "/home",
      routes: {
        "/": (context) => const MySplashScreen(),
        "/login": (context) => const LoginView(),
        "/signup": (context) => const SignUpView(),
        "/home": (context) => const HomeView(),
      },
    );
  }
}

// // import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:geolocator/geolocator.dart';

// // void main() => runApp(MyApp());

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Google Maps in Flutter',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: GoogleMapScreen(),
// //     );
// //   }
// // }

// // class GoogleMapScreen extends StatefulWidget {
// //   @override
// //   _GoogleMapScreenState createState() => _GoogleMapScreenState();
// // }

// // class _GoogleMapScreenState extends State<GoogleMapScreen> {
// //   late GoogleMapController _mapController;
// //   LatLng _initialLocation =
// //       LatLng(37.7749, -122.4194); // Default location (San Francisco)
// //   late Position _currentPosition;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _getCurrentLocation();
// //   }

// //   // Fetch Current Location
// //   Future<void> _getCurrentLocation() async {
// //     Position position = await Geolocator.getCurrentPosition(
// //         desiredAccuracy: LocationAccuracy.high);

// //     setState(() {
// //       _currentPosition = position;
// //       _initialLocation = LatLng(position.latitude, position.longitude);
// //     });

// //     // Move the map to the current location
// //     _mapController.animateCamera(CameraUpdate.newLatLng(_initialLocation));
// //   }

// //   // Handle map creation
// //   void _onMapCreated(GoogleMapController controller) {
// //     _mapController = controller;
// //   }

// //   // Change location when the user taps on the map
// //   void _onMapTapped(LatLng newPosition) {
// //     setState(() {
// //       _initialLocation = newPosition;
// //     });
// //     _mapController.animateCamera(CameraUpdate.newLatLng(newPosition));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Google Maps in Flutter'),
// //       ),
// //       body: GoogleMap(
// //         onMapCreated: _onMapCreated,
// //         initialCameraPosition: CameraPosition(
// //           target: _initialLocation,
// //           zoom: 14,
// //         ),
// //         myLocationEnabled: true,
// //         myLocationButtonEnabled: true,
// //         onTap: _onMapTapped, // Change location on tap
// //       ),
// //     );
// //   }
// // }




// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:location/location.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Google Maps with Search',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: GoogleMapScreen(),
//     );
//   }
// }

// class GoogleMapScreen extends StatefulWidget {
//   @override
//   _GoogleMapScreenState createState() => _GoogleMapScreenState();
// }

// class _GoogleMapScreenState extends State<GoogleMapScreen> {
//   late GoogleMapController _mapController;
//   LatLng _initialLocation =
//       LatLng(37.7749, -122.4194); // Default location (San Francisco)
//   late Position _currentPosition;
//   TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   // Fetch Current Location
//   Future<void> _getCurrentLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//       // ignore: deprecated_member_use
//       desiredAccuracy: LocationAccuracy.high,
//     );

//     setState(() {
//       _currentPosition = position;
//       _initialLocation = LatLng(position.latitude, position.longitude);
//     });

//     // Move the map to the current location
//     _mapController.animateCamera(CameraUpdate.newLatLng(_initialLocation));
//   }

//   // Handle map creation
//   void _onMapCreated(GoogleMapController controller) {
//     _mapController = controller;
//   }

//   // Change location when the user taps on the map
//   void _onMapTapped(LatLng newPosition) {
//     setState(() {
//       _initialLocation = newPosition;
//     });
//     _mapController.animateCamera(CameraUpdate.newLatLng(newPosition));
//   }

//   // Search for a new location based on the query
//   void _searchLocation() async {
//     // Here you can implement location search logic (e.g., using an API)
//     String query = _searchController.text;

//     // This is just an example. You would need to convert the query to a LatLng
//     // For this example, let's set a new location manually
//     if (query.isNotEmpty) {
//       // Example coordinates for New York City (change this to a proper search)
//       LatLng newLocation = LatLng(40.7128, -74.0060);

//       setState(() {
//         _initialLocation = newLocation;
//       });

//       _mapController.animateCamera(CameraUpdate.newLatLng(newLocation));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Maps with Search'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 labelText: 'Search Location',
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.search),
//                   onPressed: _searchLocation,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: GoogleMap(
//               onMapCreated: _onMapCreated,
//               initialCameraPosition: CameraPosition(
//                 target: _initialLocation,
//                 zoom: 14,
//               ),
//               myLocationEnabled: true,
//               myLocationButtonEnabled: true,
//               onTap: _onMapTapped, // Change location on tap
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }








// // import 'package:flutter/material.dart';

// // class CarDetailsPage extends StatelessWidget {
// //   final Map<String, String> car; // Car details will be passed in this map

// //   CarDetailsPage({super.key, required this.car});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(car['name'] ?? 'Car Details'),
// //         backgroundColor: Color.fromARGB(255, 102, 114, 193),
// //       ),
// //       body: Stack(
// //         children: [
// //           // Background color to match the splash screen
// //           Container(
// //             color: Color.fromARGB(255, 102, 114, 193).withOpacity(0.8), // Slightly darker for contrast
// //           ),
// //           // Dark overlay to improve text visibility
// //           Container(
// //             color: Colors.black.withOpacity(0.4),
// //             child: Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: SingleChildScrollView(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     // Car Image with Hero Animation
// //                     Hero(
// //                       tag: car['image']!,
// //                       child: ClipRRect(
// //                         borderRadius: BorderRadius.circular(15),
// //                         child: Image.asset(
// //                           car['image'] ?? 'assets/images/default_car.jpg', // Fallback image
// //                           fit: BoxFit.cover,
// //                           height: 300, // Increased height for a more dramatic effect
// //                           width: double.infinity,
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(height: 16.0),

// //                     // Car Information
// //                     Text(
// //                       car['name'] ?? 'Car Name',
// //                       style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
// //                     ),
// //                     SizedBox(height: 8.0),
// //                     Text(
// //                       'Location: ${car['location'] ?? 'Unknown'}',
// //                       style: TextStyle(fontSize: 20, color: Colors.white70),
// //                     ),
// //                     SizedBox(height: 8.0),
// //                     Text(
// //                       'Rating: ${car['rating'] ?? 'N/A'}',
// //                       style: TextStyle(fontSize: 20, color: Colors.amberAccent),
// //                     ),
// //                     SizedBox(height: 16.0),

// //                     // Description
// //                     Text(
// //                       'Description:',
// //                       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
// //                     ),
// //                     SizedBox(height: 8.0),
// //                     Text(
// //                       'This is a beautiful ${car['name'] ?? 'car'} that provides comfort and style. Perfect for all your driving needs, whether it’s a weekend getaway or a business trip.',
// //                       style: TextStyle(fontSize: 18, color: Colors.white70),
// //                     ),
// //                     SizedBox(height: 24.0),

// //                     // Booking Button
// //                     Center(
// //                       child: ElevatedButton(
// //                         onPressed: () {
// //                           // Navigate to booking logic or page
// //                         },
// //                         child: Text('Book Now'),
// //                         style: ElevatedButton.styleFrom(
// //                           backgroundColor: Color.fromARGB(255, 102, 114, 193),
// //                           padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
// //                           textStyle: TextStyle(fontSize: 20),
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(10),
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }







// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';

// class CarDetailsPage extends StatelessWidget {
//   final Map<String, String> car; // Car details will be passed in this map

//   CarDetailsPage({super.key, required this.car});

//   @override
//   Widget build(BuildContext context) {
//     double latitude = double.tryParse(car['latitude'] ?? '0') ?? 0.0;
//     double longitude = double.tryParse(car['longitude'] ?? '0') ?? 0.0;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(car['name'] ?? 'Car Details'),
//         backgroundColor: Color.fromARGB(255, 102, 114, 193),
//       ),
//       body: Stack(
//         children: [
//           Container(
//             color: Color.fromARGB(255, 102, 114, 193).withOpacity(0.8),
//           ),
//           Container(
//             color: Colors.black.withOpacity(0.4),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Hero(
//                       tag: car['image']!,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(15),
//                         child: Image.asset(
//                           car['image'] ?? 'assets/images/default_car.jpg',
//                           fit: BoxFit.cover,
//                           height: 300,
//                           width: double.infinity,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 16.0),

//                     Text(
//                       car['name'] ?? 'Car Name',
//                       style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
//                     ),
//                     SizedBox(height: 8.0),
//                     GestureDetector(
//                       onTap: () => _openMap(latitude, longitude),
//                       child: Text(
//                         'Location: ${car['location'] ?? 'Unknown'}',
//                         style: TextStyle(fontSize: 20, color: Colors.white70, decoration: TextDecoration.underline),
//                       ),
//                     ),
//                     SizedBox(height: 8.0),
//                     Text(
//                       'Rating: ${car['rating'] ?? 'N/A'}',
//                       style: TextStyle(fontSize: 20, color: Colors.amberAccent),
//                     ),
//                     SizedBox(height: 16.0),

//                     SizedBox(
//                       height: 200,
//                       child: GoogleMap(
//                         initialCameraPosition: CameraPosition(
//                           target: LatLng(latitude, longitude),
//                           zoom: 14,
//                         ),
//                         markers: {
//                           Marker(
//                             markerId: MarkerId(car['name'] ?? 'Car'),
//                             position: LatLng(latitude, longitude),
//                           ),
//                         },
//                       ),
//                     ),

//                     SizedBox(height: 16.0),
//                     Text(
//                       'Description:',
//                       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
//                     ),
//                     SizedBox(height: 8.0),
//                     Text(
//                       'This is a beautiful ${car['name'] ?? 'car'} that provides comfort and style. Perfect for all your driving needs, whether it’s a weekend getaway or a business trip.',
//                       style: TextStyle(fontSize: 18, color: Colors.white70),
//                     ),
//                     SizedBox(height: 24.0),

//                     Center(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Navigate to booking logic or page
//                         },
//                         child: Text('Book Now'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color.fromARGB(255, 102, 114, 193),
//                           padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
//                           textStyle: TextStyle(fontSize: 20),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _openMap(double latitude, double longitude) async {
//     final Uri launchUri = Uri(
//       scheme: 'https',
//       host: 'www.google.com',
//       path: 'maps/@$latitude,$longitude,15z',
//     );

//     // Use launchUrl instead of launch
//     if (await canLaunchUrl(launchUri)) {
//       await launchUrl(launchUri);
//     } else {
//       throw 'Could not launch $launchUri';
//     }
//   }
// }












