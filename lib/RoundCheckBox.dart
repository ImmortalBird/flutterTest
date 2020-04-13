import 'package:flutter/material.dart';

class RoundCheckBox extends StatefulWidget {
   bool value;

  final double size;
  final Color colorCheck;
  final Color colorUncheck;

  final Function(bool) onChanged;

  RoundCheckBox(
      {Key key,
      @required this.value,
      this.onChanged,
      this.colorUncheck = Colors.grey,
      this.colorCheck = Colors.blue,
      this.size = 25.0})
      : super(key: key);

  @override
  _RoundCheckBoxState createState() => _RoundCheckBoxState();
}

class _RoundCheckBoxState extends State<RoundCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          onTap: () {
            widget.value = !widget.value;
            widget.onChanged(widget.value);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: widget.value
                ? Icon(
                    Icons.check_circle,
                    size: widget.size,
                    color: widget.colorCheck,
                  )
                : Icon(
                    Icons.panorama_fish_eye,
                    size: widget.size,
                    color: widget.colorUncheck,
                  ),
          )),
    );
  }
}
