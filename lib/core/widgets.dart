import 'package:flutter/material.dart';

///COMPONENT
class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    this.hintText,
    this.onChanged,
    this.label,
    this.validator,
    this.prefix,
    this.isPassword = false,
    required this.controller,
  });

  final String? hintText;
  final String? label;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final IconData? prefix;
  final bool isPassword;
  final TextEditingController controller;



  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    final defaultPadding = EdgeInsets.symmetric(
      horizontal: screenWidth * 0.01,
    );

    return Padding(
      padding: defaultPadding,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _isObscured : false,
        validator: widget.validator,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade500),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          prefixIcon: widget.prefix != null ? Icon(widget.prefix) : null,
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
              _isObscured ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured;
              });
            },
          ) : null,
          prefixIconColor: Colors.grey[400],
          suffixIconColor: Colors.blue,
          hintText: widget.hintText,
          labelText: widget.label,
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.grey[100],
        ),
      ),
    );
  }
}
