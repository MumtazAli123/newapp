import 'package:flutter/material.dart';

class CustomButtonScreen extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;
  final IconData icon;
  const CustomButtonScreen({Key? key, required this.buttonText, required this.onPressed, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 300,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),

        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white,),
            const SizedBox(width: 20,),
            Text(buttonText, style: const TextStyle(color: Colors.white),),
          ],
        ),
      ),

    );
  }
}
