import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../constrants.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final Completer<GoogleMapController> _ctrl = Completer();
  Marker? _pickedMarker;
  String? _pickedAddress;
  String? _currentAddress;
  CameraPosition? _initialCamera;
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _setupLocation();
  }

  Future<void> _setupLocation() async {
    try{
      final pos = await getPermissions();
      _currentPosition = pos;
      _initialCamera = CameraPosition(
        target: LatLng(pos.latitude, pos.longitude),
        zoom: 10.0,
      );

      final placemarks = await placemarkFromCoordinates(
        _currentPosition!.latitude, 
        _currentPosition!.longitude,
      );

      final p = placemarks.first;
      _currentAddress = '${p.name},${p.locality},${p.country}';

      setState(() {});
    }catch(e){
      _initialCamera = const CameraPosition(target: LatLng(0, 0), zoom: 20);
      setState(() {});
      print(e);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<Position> getPermissions() async{
    if (!await Geolocator.isLocationServiceEnabled()){
      throw'Location service belum aktif';
    }
    LocationPermission perm = await Geolocator.checkPermission();
    if(perm == LocationPermission.denied){
      perm = await Geolocator.requestPermission();
      if(perm == LocationPermission.denied){
        throw'izin lokasi ditolak';
      }
    }
    if (perm == LocationPermission.deniedForever){
      throw'Izin lokasi ditolak permanen';
    }

    return Geolocator.getCurrentPosition();
  }

  Future<void> _onTap(LatLng Latlng)async{
    final placemarks = await placemarkFromCoordinates(
      Latlng.latitude,
      Latlng.longitude,
    );

    final p = placemarks.first;
    setState(() {
      _pickedMarker = Marker(
        markerId: const MarkerId('picked'),
        position: Latlng,
        infoWindow: InfoWindow(
          title: p.name?.isNotEmpty == true ? p.name : 'Lokasi Dipilih',
          snippet: '${p.street},${p.locality}',
        ),
      );
    });
    final ctrl = await _ctrl.future;
    await ctrl.animateCamera(CameraUpdate.newLatLngZoom(Latlng, 16));

    setState(() {
      _pickedAddress = 
        '${p.name},${p.street},${p.locality},${p.country},${p.postalCode}';
    });
  }

  void _confirmSelection(){
    showDialog(
      context: context, 
      builder: 
      (_) => AlertDialog(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.white,
        title: const Text(
            'Konfirmasi Alamat',
            style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
            fontSize: 20,
          ),
        ),
        content: Text(_pickedAddress ?? '',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.redAccent,
            ),
            onPressed: () => Navigator.pop(context), 
            child: const Text('Batal',
              style: TextStyle(fontSize: 16),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: (){
              Navigator.pop(context);
              Navigator.pop(context, _pickedAddress);
            }, 
            child: const Text('Pilih',
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_initialCamera == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pilih Alamat',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 6,
        backgroundColor: kPrimaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location, color: Colors.white),
            onPressed: () async {
              if (_currentPosition != null) {
                final controller = await _ctrl.future;
                controller.animateCamera(
                  CameraUpdate.newLatLngZoom(
                    LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
                    16,
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _initialCamera!,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              mapType: MapType.normal,
              onMapCreated: (controller) => _ctrl.complete(controller),
              markers: _pickedMarker != null ? {_pickedMarker!} : {},
              onTap: _onTap,
            ),

            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.place, color: Colors.redAccent),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _currentAddress ?? 'Lokasi tidak ditemukan',
                        style: const TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            if (_pickedAddress != null)
              Positioned(
                bottom: 120,
                left: 16,
                right: 16,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle_outline, color: Colors.green),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            _pickedAddress!,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (_pickedAddress != null) ...[
            FloatingActionButton.extended(
              onPressed: _confirmSelection,
              heroTag: 'confirm',
              backgroundColor: kPrimaryColor,
              icon: const Icon(
                Icons.check,
                color: Colors.white,),
              label: const Text('Pilih Alamat',
                style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 10),
            FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  _pickedMarker = null;
                  _pickedAddress = null;
                });
              },
              heroTag: 'clear',
              backgroundColor: const Color.fromARGB(255, 201, 54, 54),
              icon: const Icon(
                Icons.delete,
                color: Colors.white,),
              label: const Text('Hapus',
                style: TextStyle(color: Colors.white)),
            ),
          ]
        ],
      ),
    );
  }
}