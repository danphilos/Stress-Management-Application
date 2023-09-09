import 'package:flutter/material.dart';
import 'package:stress_management_app/utils/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomButton({Key? key, required this.onTap,
    required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: onTap,
      highlightColor: kYellowHighlight,
      child: Ink(
        height: 50,
        width: MediaQuery.of(context).size.width,
        padding:
            const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: kYellow,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0x05e99600),
              offset: Offset(0, 10),
              blurRadius: 20,
            ),
          ],
        ),
        child: Center(
          child: Text(text,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),),
        ),
    ),
  );
  }
}

class SmallButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const SmallButton({Key? key, required this.onTap,
    required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: onTap,
      highlightColor: kYellowHighlight,
      child: Ink(
        height: 50,
        width: 150,
        padding:
            const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: kYellow,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0x05e99600),
              offset: Offset(0, 10),
              blurRadius: 20,
            ),
          ],
        ),
        child: Center(
          child: Text(text,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),),
        ),
    ),
  );
  }
}

class OutlineButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const OutlineButton({Key? key, required this.onTap,
    required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: onTap,
      child: Ink(
        height: 50,
        width: 150,
        padding:
            const EdgeInsets.symmetric(horizontal: 24,),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white54),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0x05e99600),
              offset: Offset(0, 10),
              blurRadius: 20,
            ),
          ],
        ),
        child: Center(
          child: Text(text,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),),
        ),
    ),
  );
  }
}