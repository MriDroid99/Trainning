import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  const GenderWidget(
      {required this.icon, required this.label, required this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 100,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            label,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
