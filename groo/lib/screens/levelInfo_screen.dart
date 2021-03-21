import 'package:flutter/material.dart';
import 'attend_screen.dart';
import 'const.dart';

class LevelInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          leading: TextButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Color(0xFF2EB402))),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
            ),
          ),
          title: Text(
            "Level Information",
            style: titleTextStyle,
          ),
          backgroundColor: Color(0xFF2EB402)),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LevelContainer(
                      path: 'images/sprout.png',
                      label: 'level1',
                    ),
                    LevelContainer(path: 'images/sprout2.png', label: 'level2'),
                    LevelContainer(path: 'images/pot.png', label: 'level3'),
                    LevelContainer(path: 'images/tulip.png', label: 'level4')
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'level1',
                        style: attendTextStyle,
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'This is the first week of the challenge.\n We support your challenge.',
                        textAlign: TextAlign.center,
                        style: labelTextStyle,
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        'level2',
                        style: attendTextStyle,
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Achieve half of all challenges.\nYou will get a badge.',
                        textAlign: TextAlign.center,
                        style: labelTextStyle,
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        'level3',
                        style: attendTextStyle,
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Achieve three-quarters of the total challenge. You are a really great person.',
                        textAlign: TextAlign.center,
                        style: labelTextStyle,
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        'level4',
                        style: attendTextStyle,
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'You opened a nice single flower. Congratulations!',
                        textAlign: TextAlign.center,
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RaisedButton(
                    color: Colors.green[200],
                    elevation: 5.0,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                    child: Text('Go to Attendance',
                        style: TextStyle(
                          fontFamily: 'Inconsolata',
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                        )),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(7.0)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AttendScreen(),
                          ));
                    },
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class LevelContainer extends StatelessWidget {
  const LevelContainer({@required this.path, @required this.label});

  final String path;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      child: Column(children: [
        Image.asset(path),
        Text(
          label,
          style: labelTextStyle,
        ),
      ]),
    );
  }
}