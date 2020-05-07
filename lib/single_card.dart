import 'package:flutter/material.dart';

class SingleCard extends StatelessWidget {
  final Color color;
  final Widget carChild;
  final Function onPress;
  SingleCard({@required this.color, this.carChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: carChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
