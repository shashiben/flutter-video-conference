// Flutter imports:
import 'package:flutter/material.dart';

class CircleCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Color? activeColor;
  final Color? checkColor;
  final bool tristate;
  final MaterialTapTargetSize? materialTapTargetSize;

  CircleCheckbox({
    Key? key,
    required this.value,
    this.tristate = false,
    required this.onChanged,
    this.activeColor,
    this.checkColor,
    this.materialTapTargetSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          ClipOval(
            child: SizedBox(
              width: Checkbox.width,
              height: Checkbox.width,
              child: Container(
                decoration: new BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).unselectedWidgetColor),
                  borderRadius: new BorderRadius.circular(100),
                ),
                child: Checkbox(
                  value: value,
                  tristate: tristate,
                  onChanged: onChanged,
                  activeColor: activeColor,
                  checkColor: checkColor,
                  materialTapTargetSize: materialTapTargetSize,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Save account",
            style: TextStyle(
                fontFamily: "Gilroy",
                fontSize: 15,
                fontWeight: FontWeight.w200,
                color: Colors.black),
          )
        ],
      ),
    );
  }
}
