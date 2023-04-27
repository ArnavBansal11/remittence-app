import 'package:flutter/material.dart';

class LongButton extends StatefulWidget {
  final void Function() onPressed;
  final String text;

  const LongButton({super.key, required this.onPressed, required this.text});

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
        onPressed: widget.onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            backgroundColor:
                MaterialStateProperty.all(const Color(0xff0a6cff))),
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

