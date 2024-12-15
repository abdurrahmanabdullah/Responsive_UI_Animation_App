import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ml_flutter_project/app/model/course_model.dart';

class Vcard extends StatefulWidget {
  const Vcard({super.key, required this.course});

  final CourseModel course;

  @override
  State<Vcard> createState() => _VcardState();
}

class _VcardState extends State<Vcard> {
  List<String> logo = ["apple", "email", "google"];

  @override
  void initState() {
    // TODO: implement initState
    logo.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 345, maxWidth: 260),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [widget.course.color, widget.course.color.withOpacity(1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: widget.course.color.withOpacity(0.4),
                  offset: const Offset(0, 12),
                  blurRadius: 8)
            ]),
        child: Stack(children: [
          Positioned(
              right: 0,
              child: Image.asset(
                'assets/rive_app/images/icon_email.png',
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.course.title,
                style: const TextStyle(
                    fontSize: 24, fontFamily: "poppins", color: Colors.white),
              ),
              const SizedBox(
                height: 8,
              ),

              /// In model class I write it  String? subtitle; that's why need  here !  widget.course.subtitle!,
              Text(
                widget.course.subtitle!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: false,
                style: TextStyle(
                    fontFamily: "inter",
                    color: CupertinoColors.white.withOpacity(1),
                    fontSize: 12),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.course.caption.toUpperCase()!,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Inter",
                    fontSize: 13),
              ),
              const SizedBox(height: 40,),
              Wrap(

                  ///Wrap automatically moves items to the next line or column.This is particularly useful for responsive designs.
                  spacing: 7,
                  children: List.generate(3, (index) {
                    return Transform.translate(
                      offset: Offset(index * -20, 0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Image.asset(
                            'assets/rive_app/images/logo_${logo[index]}.png',
                            // 'assets/rive_app/images/logo_apple.png',
                            width: 44,
                            height: 44,
                          )),
                    );
                  }))
            ],
          ),
        ]),
      ),
    );
  }
}