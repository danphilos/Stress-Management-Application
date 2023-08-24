import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomButton({Key? key, required this.onTap,
    required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        padding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
        decoration: BoxDecoration(
          color: const Color(0xffe99600),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(text,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white),),
    ),
  );
  }
}