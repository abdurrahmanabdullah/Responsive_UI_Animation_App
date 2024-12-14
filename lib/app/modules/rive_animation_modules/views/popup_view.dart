import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ml_flutter_project/app/share/theme.dart';

class PopUpView extends StatefulWidget {
  const PopUpView({super.key, this.closeModel});
final Function ?closeModel;
  @override
  State<PopUpView> createState() => _PopUpViewState();
}

class _PopUpViewState extends State<PopUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Stack(children: [
                Container(
                  margin: const EdgeInsets.all(26),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(color: RiverAppTheme.shadow.withOpacity(0.3),
                        offset: const Offset(0, 3),
                        blurRadius: 5
                    ),
                    BoxShadow(color: RiverAppTheme.shadow.withOpacity(0.3),
                        offset: const Offset(0, 3),
                        blurRadius: 5
                    )
                  ]),


                  child: Container(

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: CupertinoColors.secondarySystemBackground),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Hey How are you",
                            style: TextStyle(
                                fontFamily: "poppins", fontSize: 20),
                          ),
                          const Text(
                            " Believe in yourself, and you are halfway there and be patient",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "poppins", fontSize: 20,),
                          ),
                          const SizedBox(height: 120,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                  'assets/rive_app/images/logo_email.png'),
                              Image.asset(
                                  'assets/rive_app/images/logo_apple.png'),
                              Image.asset(
                                  'assets/rive_app/images/logo_google.png')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CupertinoButton(
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(color: Colors.white,
                          borderRadius: BorderRadius.circular(36 / 2),
                          boxShadow: [BoxShadow(color: RiverAppTheme.shadow
                              .withOpacity(0.3),
                              blurRadius: 5,
                              offset: const Offset(0, 3))]),

                          child: const Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                         widget.closeModel!();
                      },))
              ]
              ),
            ),
          )),
    );
  }
}
