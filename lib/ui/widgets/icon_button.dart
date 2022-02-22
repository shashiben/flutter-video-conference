// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:video_conference/app/colors.dart';

class IconScreen extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color color;

  const IconScreen(
      {Key? key,
      required this.iconData,
      required this.text,
      required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(15)),
              child: Icon(
                iconData,
                color: Colors.white,
                size: 40,
              )),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(
                color: textPrimaryColor,
                fontFamily: "Gilroy",
                fontSize: 12,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
