import 'package:flash_chat/ultilities/constrains.dart';
import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  const MyBtn({
    Key? key,
    required this.title,
    required this.borderRad,
    this.onPress,
  }) : super(key: key);

  final String title;
  final double borderRad;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRad),
        gradient: kGradientColor,
        boxShadow: const [kShadow],
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRad),
        ),
        height: 50,
        onPressed: onPress,
        child: Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
