///----manually ui change  structure
library;
// import 'package:camera/camera.dart';
// import 'package:get/get.dart';
//
// class HomeController extends GetxController {
// bool isWorking=false;
// String result="";
// CameraController? cameraController;
//
//
// CameraImage? imgCamera;
//
//
// RxBool isCameraInitialized = false.obs; // Reactive boolean to track camera status
//
//
// Future<void> startCamera() async {
//   try {
//     // Get the list of available cameras
//     final cameras = await availableCameras();
//
//     // Initialize the camera with the first camera and a resolution preset
//     cameraController = CameraController(
//       cameras[0], // Use the back camera
//       ResolutionPreset.high, // Ensure you use 'ResolutionPreset'
//     );
//
//     // Initialize the controller
//     await cameraController!.initialize();
//
//     // Notify listeners (if needed)
//     update();
//   } catch (e) {
//     print("Error initializing camera: $e");
//   }
// }
//
// // Stop the camera
//   void stopCamera() {
//     if (cameraController != null) {
//       cameraController!.dispose();
//       cameraController = null;
//
//       // Notify listeners (if needed)
//       update();
//     }
//   }
//   final count = 0.obs;
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
// cameraController?.dispose();
//     super.onClose();
//   }
//
//   void increment() => count.value++;
// }

import 'package:get/get.dart';
import 'package:ml_flutter_project/app/data/place.dart';
import 'package:ml_flutter_project/app/data/places_data.dart';



class HomeController extends GetxController {
  // Reactive state for the selected place
  var selectedPlace = Places().getPlaces()[0].obs;

  // Method to handle place changes
  void handlePlaceChanged(Place newPlace) {
    selectedPlace.value = newPlace;
  }
  @override
  void onInit() {
    // loadModel();
    super.onInit();
  }



  @override
  void onClose() {


    super.onClose();
  }
}
