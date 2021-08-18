import 'package:flutter/material.dart';

// Widget
import './gender_widget.dart';
import './data_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  double height = 120;
  bool isMale = true;
  int age = 25;
  double weight = 80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: GenderWidget(
                        icon: Icons.male,
                        label: 'MALE',
                        color: isMale
                            ? Colors.blue
                            : Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: GenderWidget(
                          icon: Icons.female,
                          label: 'FEMLAE',
                          color: !isMale
                              ? Colors.blue
                              : Theme.of(context).accentColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('${height.round()}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          )),
                      Text('CM',
                          style: TextStyle(
                            color: Colors.grey,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Slider(
                    value: height,
                    onChanged: (val) {
                      setState(() {
                        height = val;
                      });
                      print(val);
                    },
                    min: 80,
                    max: 210,
                  ),
                ],
              ),
            ),
          )),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: DataWidget('Weight', weight, () {
                      setState(() {
                        weight++;
                      });
                    }, () {
                      setState(() {
                        weight--;
                      });
                    }),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: DataWidget('Age', age, () {
                      setState(() {
                        age++;
                      });
                    }, () {
                      setState(() {
                        age--;
                      });
                    }),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: MaterialButton(
              height: 50,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: Container(
                          width: double.infinity,
                          height: 50,
                          child: Center(child: Text('CALCULATION')),
                          color: Colors.blue,
                        ),
                        titlePadding: EdgeInsets.all(0),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(isMale ? 'Gender: Male' : 'Gender: Female'),
                            Text('Height: ${height.round()}'),
                            Text('Weight: $weight'),
                            Text('Age: $age'),
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Ok')),
                        ],
                      );
                    });
              },
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
