import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  final void Function(String?)? onSave;
  final String? Function(String?) validate;
  final String label;
  final TextInputType? textInputType;
  const InputTextField(
      {super.key,
      required this.label,
      required this.onSave,
      required this.validate,
      this.textInputType});

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
          onSaved: widget.onSave,
          validator: widget.validate,
          keyboardType: widget.textInputType ?? TextInputType.text,
          cursorColor: const Color(0xff0A6CFF),
          decoration: InputDecoration(
            labelStyle: const TextStyle(color: Color(0xff7B8794)),
            errorStyle: const TextStyle(fontSize: 16),
            hintStyle: const TextStyle(fontSize: 16, color: Color(0xff0A6CFF)),
            labelText: widget.label,
            fillColor: const Color(0xffF5F7FA),
            filled: true,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Color(0xff0A6CFF)),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                    const BorderSide(width: 2, color: Color(0xffE4E7EB))),
          )),
    );
  }
}
