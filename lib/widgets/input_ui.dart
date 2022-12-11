import 'package:flutter/material.dart';

class UIConfig {
InputDecoration inputDecoration(
    String hintText, String labelText,
    IconData? prefixIcon, IconData? suffixIcon, void Function()? onTap){
  return InputDecoration(
    isDense: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color.fromRGBO(242, 242, 242, 1)),

    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color.fromRGBO(242, 242, 242, 1),
      )),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.red,)),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(

        color: Colors.red,)),

    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    fillColor: const Color(0xffF4F5F7),
    hintText: hintText,
    labelText: labelText,
    prefixIcon: Icon(prefixIcon),
    suffixIcon: InkWell(onTap: onTap, child: Icon(suffixIcon),)
  );
}
}