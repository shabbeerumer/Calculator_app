import 'package:flutter/material.dart';

class MyButtons extends StatefulWidget {
  final String title;
  final Color color;
  final VoidCallback onpress;
  const MyButtons(
      {Key? key,
      required this.title,
      this.color = const Color(0XFFa5a5a5),
      required this.onpress})
      : super(key: key);

  @override
  State<MyButtons> createState() => _MyButtonsState();
}

class _MyButtonsState extends State<MyButtons> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: widget.onpress,
          child: Container(
            height: 70,
            decoration:
                BoxDecoration(color: widget.color, shape: BoxShape.circle),
            child: Center(
                child: Text(
              widget.title,
              style: TextStyle(color: Colors.white, fontSize: 30),
            )),
          ),
        ),
      ),
    );
  }
}
