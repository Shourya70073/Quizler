import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quiz",
      home: Homepage(),
    ));
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> sck = [];
  List<String> q = [
    "Colour of the blood is red.",
    "2 plus 5 equals to 7.",
    "In a year there is 345 days.",
    "QUIZ OVER!!"
  ];
  List<String> ans = ["True", "True", "false"];
  int count = 0;
  void play(String i) {
    if (count >= q.length - 2) {
      showDialog(
          context: context,
          builder: (context) {
            return (AlertDialog(
                title: Text("QUIZ OVER"),
                content: Text("You have completed the quiz succesfully."),
                actions: [
                  MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          count = 0;
                          sck = [];
                        });
                      },
                      child: Text("Reset"))
                ]));
          });
    }
    if (ans[count] == i) {
      setState(() {
        sck.add(Icon(Icons.check));
      });
    } else {
      setState(() {
        sck.add(Icon(Icons.close));
      });
    }
    count++;
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("QUIZ"),
        backgroundColor: Colors.pink,
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         
          Expanded(
            child: Icon(Icons.quiz,
            size: 150,
            ),
          ),
         
          Expanded(
            child: Container(
              height: 200,
              width: 500,
              child: Center(
                  child: Text(
                q[count],
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              )),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(children: [
                GestureDetector(
                  onTap: () {
                    play("True");
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 25),
                    height: 50,
                    width: 200,
                    child: Center(
                        child: Text(
                      "TRUE",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    )),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    play("false");
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 25, bottom: 15),
                    height: 50,
                    width: 200,
                    child: Center(
                        child: Text(
                      "FALSE",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    )),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: sck,
                )
              ]),
            ),
          )
        ],
      ),
    ));
  }
}
