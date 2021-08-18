import 'package:flutter/material.dart';

class DataWidget extends StatelessWidget {
  final String label;
  final num value;
  final Function add;
  final Function remove;
  const DataWidget(this.label, this.value, this.add, this.remove, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).accentColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '$value',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () {
                  remove();
                },
                child: Icon(Icons.remove),
                mini: true,
              ),
              FloatingActionButton(
                onPressed: () {
                  add();
                },
                backgroundColor: Colors.blue,
                child: Icon(Icons.add),
                mini: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
