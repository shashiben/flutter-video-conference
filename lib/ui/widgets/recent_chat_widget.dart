import 'package:flutter/material.dart';
import 'package:video_conference/model/recent_chat.dart';

import '../../app/colors.dart';

class RecentChatWidget extends StatelessWidget {
  final RecentChat data;

  const RecentChatWidget({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: surfaceColor,
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: NetworkImage(data.image))),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    data.lastMessage,
                    style: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 15,
                        color: Colors.white.withOpacity(0.6),
                        fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
            Container(
              width: 80,
              child: Text(
                data.timeStamp,
                style: TextStyle(
                    fontFamily: "Gilroy",
                    fontSize: 15,
                    fontWeight: FontWeight.w100),
              ),
            )
          ],
        ),
      ),
    );
  }
}
