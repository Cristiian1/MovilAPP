import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String? label;
  final String? hint;
  final Icon? icono;
  final TextInputType? keyboard;
  final bool? obscure;
  final void Function(String data)? onChanged;
  final String? Function(String?)? validate;

  const InputText({
    Key? key,
    this.label ='',
    this.hint ='',
    this.icono,
    this.keyboard = TextInputType.text,
    this.obscure = false,
    this.onChanged,
    this.validate,
  })
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        keyboardType: keyboard,
        obscureText: obscure ?? false,
        onChanged: onChanged,
        validator: validate,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          labelStyle: TextStyle(
            color: const Color.fromARGB(255, 237, 236, 234),
            fontSize: 23.0,
          ),
          suffixIcon: this.icono,
          border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
          )
        ),
      ),
    );
  }
}
