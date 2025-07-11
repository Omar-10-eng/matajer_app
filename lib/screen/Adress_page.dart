import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:matajer_app/screen/home_page.dart';

class AdressPage extends StatefulWidget {
  const AdressPage({Key? key}) : super(key: key);

  @override
  State<AdressPage> createState() => _AdressPageState();
}

class _AdressPageState extends State<AdressPage> {
  late GoogleMapController mapController;
  bool _locationSelected = false;

  Set<Marker> _markers = {};
  final LatLng _initialPosition = const LatLng(30.0444, 31.2357);
  final LatLng _targetLocation = const LatLng(
    31.203013075854702,
    29.88152693303535,
  ); // الأهرامات

  String selectedAddress = 'Location'; // العنوان الابتدائي

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _goToLocation(LatLng target, String newAddress) async {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(target: target, zoom: 18)),
    );

    setState(() {
      selectedAddress = newAddress;
       _locationSelected = true;

      // إضافة ماركر للموقع الجديد
      _markers = {
        Marker(
          markerId: MarkerId("targetLocation"),
          position: target,
          infoWindow: InfoWindow(title: newAddress),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueAzure,
          ), // يمكنك تخصيص اللون
        ),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // الخريطة
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 12,
            ),
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            markers: _markers, // ← هنا
          ),

          // كونتينر العنوان
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(64),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Color(0xff2B70B1)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      selectedAddress,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // زر "Locate Me" في وسط الشاشة فوق زر استمرار
          // زر "حدد موقعي"
          Positioned(
            bottom: 100,
            right: 16,
            child: GestureDetector(
              onTap: () {
                _goToLocation(
                  _targetLocation,
                  '5-17 al gazaeli - Qesm Al Gomrok',
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(64),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.my_location, color: Color(0xff2B70B1)),
                    SizedBox(width: 8),
                    Text(
                      "Locate Me",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // زر الاستمرار
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(64),
                ),
                backgroundColor: _locationSelected
                    ? const Color(0xff2B70B1) // اللون الأزرق
                    : Colors.grey.shade400, // اللون الرمادي
                // ↓↓↓ هذا مهم جدًا لإجبار الزر يظهر باللون حتى لما يكون معطّل
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey.shade400,
                disabledForegroundColor: Colors.white,
              ),
              onPressed: _locationSelected
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    }
                  : null, // غير نشط إلا بعد تحديد الموقع
              child: const Text('Continue', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}
