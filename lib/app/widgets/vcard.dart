import 'package:flutter/cupertino.dart';
import 'package:ml_flutter_project/app/model/course_model.dart';

class Vcard extends StatefulWidget {
  const Vcard({super.key, required this.course});

  final CourseModel course;

  @override
  State<Vcard> createState() => _VcardState();
}

class _VcardState extends State<Vcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        widget.course.color,
        widget.course.color.withOpacity(0.5)
      ], begin: Alignment.topLeft, end: Alignment.bottomRight),borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Text(
            widget.course.title,
            style: const TextStyle(fontSize: 24, fontFamily: "poppins"),
          ),

          /// In model class I write it  String? subtitle; that's why need  here !  widget.course.subtitle!,
          Text(
            widget.course.subtitle!,
            maxLines: 2,
            softWrap: false,

          style: TextStyle(color:CupertinoColors.white.withOpacity(0.7),fontSize: 15),),
        ],
      ),
    );
  }
}
