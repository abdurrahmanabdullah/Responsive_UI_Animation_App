
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),

    );
  }
}
///---------------manually ui change structure
// class HomeView extends GetView<HomeController> {
//    HomeView({super.key});
//   final HomeController homeController = Get.put(HomeController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('HomeView'),
//         centerTitle: true,
//       ),
//       body: GetBuilder<HomeController> (builder: (controller){return Column( children: [
//         Expanded(
//           child: controller.cameraController != null &&
//               controller.cameraController!.value.isInitialized
//               ? CameraPreview(homeController.cameraController!)
//               : const Center(
//             child: Text(
//               'Camera is not active',
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//         ),
//         IconButton(
//           icon: Icon(
//             homeController.cameraController == null
//                 ? Icons.camera_alt
//                 : Icons.videocam_off, // Camera is on
//             size: 40,
//           ),
//           onPressed: () {
//             if (homeController.cameraController == null) {
//               homeController.startCamera();
//             } else {
//               homeController.stopCamera();
//             }
//           },
//         ),
//       ],
//       );
//       },
//       ),
//     );
//   }
// }