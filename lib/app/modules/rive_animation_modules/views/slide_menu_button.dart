// SafeArea(
// child: GestureDetector(
// onTap: onMenuPress,
// child: Container(
// width: 44,
// height: 44,
// margin: const EdgeInsets.all(16),
// decoration: BoxDecoration(boxShadow: [
// BoxShadow(
// color: RiverAppTheme.shadow.withOpacity(0.2),
// blurRadius: 5,
// offset: const Offset(0, 5))
// ]),
// child: RiveAnimation.asset(
// 'assets/rive_app/rive/menu_button.riv',
// stateMachines: const ["State Machine"],
// animations: const ["open", "close"],
// onInit: _onMenuIconInit,
// ),
// // child: RiveAnimation.asset(
// //   'assets/rive_app/rive/menu_button.riv',
// //   stateMachines: const ["State Machine"], // Ensure the name matches in Rive
// //   onInit: (artboard) {
// //     final controller = StateMachineController.fromArtboard(
// //         artboard, "State Machine");
// //     if (controller == null) {
// //       debugPrint("State Machine not found in Rive asset.");
// //       return;
// //     }
// //     artboard.addController(controller);
// //
// //     // Find and initialize the "isOpen" input
// //     _menuBtn = controller.findInput<bool>("isOpen") as SMIBool?;
// //     if (_menuBtn == null) {
// //       debugPrint("SMIBool 'isOpen' not found.");
// //     } else {
// //       _menuBtn?.value = true; // Initial state
// //     }
// //   },
// // ),
//
// ),
// ),
// ),

/// Initialize the Rive menu animation
// void _onMenuIconInit(Artboard artboard) {
//   final controller = StateMachineController.fromArtboard(
//       artboard, "State Machine");
//   if (controller == null) {
//     print("Error: State machine not found in the Rive asset.");
//     return;
//   }
//   artboard.addController(controller);
//   _menuBtn = controller.findInput<bool>("isOpen") as SMIBool?;
//   if (_menuBtn != null) {
//     _menuBtn?.value = true; // Default state
//   }
// }