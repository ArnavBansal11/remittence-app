import 'package:flutter/material.dart';

class LongButton extends StatefulWidget {
  final void Function() onPressed;
  final String text;
  final bool? disabled;

  const LongButton(
      {super.key, required this.onPressed, required this.text, this.disabled});

  @override
  State<LongButton> createState() => _LongButtonState();
}

class _LongButtonState extends State<LongButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: TextButton(
        onPressed: widget.disabled == true ? () {} : widget.onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            backgroundColor: widget.disabled == true
                ? MaterialStateProperty.all(Colors.grey.shade400)
                : MaterialStateProperty.all(const Color(0xff0a6cff)),
            splashFactory: widget.disabled == true
                ? NoSplash.splashFactory
                : InkSplash.splashFactory),
        child: Text(widget.text,
            style: const TextStyle(
              fontSize: 16.5,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            )),
      ),
    );
  }
}
