import 'dart:async';
import 'package:checklst/utilities/location_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var latitude;
var longitude;

class MapContainer extends StatefulWidget {
  final double width;

  MapContainer({this.width});

  @override
  _MapContainerState createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {
  Future getLocationData() async {
    LocationService locationService = LocationService();

    //Fetching _userLocation
    latitude = await locationService.getLat();
    longitude = await locationService.getLat();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(latitude);
    ScreenUtil.init(context,
        designSize: Size(432.0, 816.0), allowFontScaling: true);

    return Container(
      width: widget.width.w,
      //TODO: Remove hardcoded height and put expanded or something
      height: 271.0.h,
      margin: EdgeInsets.only(top: 5.0.h),
      child: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
