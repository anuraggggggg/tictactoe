import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List ofXO = List.generate(9, (index) => "");
  String value = "";
  bool turn = true;
  bool win = false;
  String winner = "";
  int xwin = 0;
  int ywin = 0;
 var pref = SharedPreferences.getInstance();
 var KEYNAME = "";
 int tap = 0;




 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          "Tic Tac Toe",
          style: TextStyle(color: Colors.blue, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                        color: turn ? Colors.black : Colors.blue,
                        // Condition Using Colors
                        width: 5)),
                child: Center(
                    child: Text(
                  "X",
                  style: TextStyle(fontSize: 50, color: Colors.blue),
                )),
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: turn ? 0 : 5, // Condition Using width
                  ),
                  // shape: BoxShape.circle,
                  color: Colors.white,

                ),
                child: Center(
                    child: Text(
                  "0",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.blue,
                  ),
                )),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                children: [
                  for (int i = 0; i < ofXO.length; i++) ...[
                    GestureDetector(
                      onTap: () {
                        setState(() {});
                        if (ofXO[i] == "") {
                          if (turn) {
                            ofXO[i] = "X";
                            turn = false;
                            win = true;
                          } else {
                            ofXO[i] = "O";
                            turn = true;
                            win = true;
                          }
                        }
                        // For Horizontal
                        if (ofXO[0] == "X" &&
                            ofXO[1] == "X" &&
                            ofXO[2] == "X") {
                          print("X Won");
                          ofXO.clear();
                          ofXO = List.generate(9, (index) => "");
                          xwin++;
                          setState(() {});
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Game Over"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("try Again")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                  ],
                                );
                              });

                          win = true;
                        } else if (ofXO[3] == "X" &&
                            ofXO[4] == "X" &&
                            ofXO[5] == "X") {
                          print("X Won");
                          ofXO.clear();
                          ofXO = List.generate(9, (index) => "");
                          xwin++;
                          setState(() {});
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Game Over"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("try Again")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                  ],
                                );
                              });

                          win = true;
                          ofXO.clear();
                          ofXO = List.generate(9, (index) => "");

                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Game Over"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("try Again")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                  ],
                                );
                              });
                        } else if (ofXO[6] == "X" &&
                            ofXO[7] == "X" &&
                            ofXO[8] == "X") {
                          print("X Won");
                          ofXO.clear();
                          ofXO = List.generate(9, (index) => "");
                          xwin++;
                          setState(() {

                          });
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Game Over"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("try Again")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                  ],
                                );
                              });
                        } else if (ofXO[0] == "O" &&
                            ofXO[1] == "O" &&
                            ofXO[2] == "O") {
                          print("Y Won");
                          ofXO.clear();
                          ofXO = List.generate(9, (index) => "");
                          ywin++;
                          setState(() async{
var pref = await SharedPreferences.getInstance();
pref.setInt(KEYNAME, ywin);
pref.get(value);
                          });
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Game Over"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("try Again")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                  ],
                                );
                              });
                        } else if (ofXO[3] == "O" &&
                            ofXO[4] == "O" &&
                            ofXO[5] == "O") {
                          ofXO.clear();
                          ywin++;
                          setState(() {

                          });
                          ofXO = List.generate(9, (index) => "");
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Game Over"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("try Again")),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text("Cancel")),
                                  ],
                                );
                              });
                        } else if (ofXO[6] == "O" &&
                            ofXO[7] == "O" &&
                            ofXO[8] == "O") {
                          print("Y Won");
                          ofXO.clear();
                          ofXO = List.generate(9, (index) => "");
                          ywin++;
                          setState(() {

                          });
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Game Over"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("try Again")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                  ],
                                );
                              });
                        }
                        // For Vertical
                        else if (ofXO[0] == "X" &&
                            ofXO[3] == "X" &&
                            ofXO[6] == "X") {
                          print("X Won");
                          ofXO.clear();
                          ofXO = List.generate(9, (index) => "");
                          ywin++;
                          setState(() {

                          });
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Game Over"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("try Again")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                  ],
                                );
                              });
                        } else if (ofXO[1] == "X" &&
                            ofXO[4] == "X" &&
                            ofXO[7] == "X") {
                          print("Y Won");
                          ofXO.clear();
                          ofXO = List.generate(9, (index) => "");
                          ywin++;
                          setState(() {

                          });
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Game Over"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("try Again")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                  ],
                                );
                              });
                        } else if (ofXO[2] == "X" &&
                            ofXO[5] == "X" &&
                            ofXO[8] == "X") {
                          print("X Won");
                          ofXO.clear();
                          ofXO = List.generate(9, (index) => "");
                          ywin++;
                          setState(() {

                          });
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Game Over"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("try Again")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                  ],
                                );
                              });
                        } else if (ofXO[0] == "O" &&
                            ofXO[3] == "O" &&
                            ofXO[6] == "O") {
                          print("O Won");
                          ofXO.clear();
                          ofXO = List.generate(9, (index) => "");
                          ywin++;

                          setState(() {

                          });
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Game Over"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("try Again")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                  ],
                                );
                              });
                        } else if (ofXO[1] == "O" &&
                            ofXO[4] == "O" &&
                            ofXO[7] == "O") {
                          print("O Won");
                          ofXO.clear();
                          ofXO = List.generate(9, (index) => "");
                          ywin++;
                          setState(() {

                          });
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Game Over"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("try Again")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                  ],
                                );
                              });
                        } else if (ofXO[2] == "O" &&
                            ofXO[5] == "O" &&
                            ofXO[8] == "O") {
                          ofXO.clear();
                          ofXO = List.generate(9, (index) => "");
                          ywin++;
                          setState(() {

                          });
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Game Over"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("try Again")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                  ],
                                );
                              });
                        }
                        // For Diagonal
                        else if (ofXO[0] == "X" &&
                            ofXO[4] == "X" &&
                            ofXO[8] == "X") {
                          print("X Won");
                          ofXO.clear();
                          ofXO = List.generate(9, (index) => "");
                          xwin++;
                          setState(() {

                          });
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Game Over"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("try Again")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                  ],
                                );
                              });
                        } else if (ofXO[2] == "X" &&
                            ofXO[4] == "X" &&
                            ofXO[6] == "X") {
                          print("X Won");
                          ofXO.clear();
                          ofXO = List.generate(9, (index) => "");
                          xwin++;
                          setState(() {

                          });
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Game Over"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("try Again")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                  ],
                                );
                              });
                        } else if (ofXO[0] == "O" &&
                            ofXO[4] == "O" &&
                            ofXO[8] == "O") {
                          print("O Won");
                          ofXO.clear();
                          ofXO = List.generate(9, (index) => "");
                          xwin++;
                          setState(() {

                          });
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Game Over"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("try Again")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                  ],
                                );
                              });
                        } else if (ofXO[2] == "O" &&
                            ofXO[4] == "O" &&
                            ofXO[6] == "O") {
                          print("O Won");
                          ofXO.clear();
                          ofXO = List.generate(9, (index) => "");
                          xwin++;
                          setState(() {

                          });
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Game Over"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("try Again")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },

                                        child: Text("Cancel")),
                                  ],
                                );
                              });
                        }
                        else if(
                        // ofXO[0]  && ofXO[1] && ofXO[2] && ofXO[3]&& ofXO[4] && ofXO[5]&& ofXO[6]&& ofXO[7] && ofXO[8] != null )
                        ofXO[0].isNotEmpty && ofXO[1].isNotEmpty && ofXO[2].isNotEmpty &&
                            ofXO[3].isNotEmpty && ofXO[4].isNotEmpty && ofXO[5].isNotEmpty &&
                            ofXO[6].isNotEmpty && ofXO[7].isNotEmpty && ofXO[8].isNotEmpty
                        )
                        {

                          setState(() {
                            ofXO.clear();
                            ofXO = List.generate(9, (index) => "");
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Game Over ,Match Draw"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("try Again")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },

                                          child: Text("Cancel")),
                                    ],
                                  );
                                });
                          });



                        }

                      }

           ,


                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Center(
                            child: Text(
                          ofXO[i],
                          style: TextStyle(
                            fontSize: 60,
                          ),
                        )),
                      ),
                    )
                  ]
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "PLayer X : $xwin ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 100,
              ),
              Container(
                child: Text(
                  "PLayer O : $ywin",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void getValue() async{
   var pref = await SharedPreferences.getInstance();
   KEYNAME = ywin.toString();


  }
}
