import 'package:akary/constants/theme.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_picker/map_picker.dart';
import 'package:geocoding/geocoding.dart';
import '../auth/authbutton.dart';

class AkarLocation extends StatelessWidget {
  AkarLocation({Key? key}) : super(key: key);

  final _controller = Completer<GoogleMapController>();
  MapPickerController mapPickerController = MapPickerController();

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(29.378586, 47.990341),
    zoom: 14.0,
  );
  var locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GetStorage storage = GetStorage();
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            MapPicker(
              // pass icon widget
              iconWidget: Image.asset(
                "assets/logo.png",
                height: 30,
              ),
              //add map picker controller
              mapPickerController: mapPickerController,
              child: GoogleMap(
                myLocationEnabled: true,
                zoomControlsEnabled: true,
                // hide location button
                myLocationButtonEnabled: true,
                mapType: MapType.normal,
                //  camera position
                initialCameraPosition: cameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onCameraMoveStarted: () {
                  // notify map is moving
                  mapPickerController.mapMoving!();
                  locationController.text = "MAP ADDRESS CHECKING";
                },
                onCameraMove: (cameraPosition) {
                  this.cameraPosition = cameraPosition;
                },
                onCameraIdle: () async {
                  // notify map stopped moving
                  mapPickerController.mapFinishedMoving!();
                  //get address name from camera position
                  List<Placemark> placemarks = await placemarkFromCoordinates(
                    cameraPosition.target.latitude,
                    cameraPosition.target.longitude,
                  );

                  // update the ui with the address
                  locationController.text =
                      '${placemarks.first.name}, ${placemarks.first.administrativeArea}, ${placemarks.first.country}';
                },
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: GetStorage().read('isDarkTheme') == true
                        ? Colors.black87
                        : Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: GetStorage().read('isDarkTheme') == true
                              ? Colors.white
                              : mainColor,
                        ),
                        alignment: Alignment.centerRight),
                  )),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 4,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        readOnly: true,
                        style: const TextStyle(color: mainColor),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                        ),
                        controller: locationController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: defaultButton(
                          onpress: () {
                            print(
                                "Location ${cameraPosition.target.latitude} ${cameraPosition.target.longitude}");
                            print("Address: ${locationController.text}");
                            Get.back();
                            storage.write("Address", locationController.text);
                            storage.write("latitude",
                                cameraPosition.target.latitude.toString());
                            storage.write("longitude",
                                cameraPosition.target.longitude.toString());
                          },
                          text: "Confirm Location",
                          background: GetStorage().read('isDarkTheme') == true
                              ? Colors.black87
                              : mainColor,
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
    );
  }
}
