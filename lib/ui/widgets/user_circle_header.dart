// Flutter imports:
import 'package:flutter/material.dart';

class UserCircleHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => showModalBottomSheet(
      //   isScrollControlled: true,
      //   context: context,
      //   builder: (context) => UserDetailsContainer(),
      // ),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                "Shashi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.green),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
