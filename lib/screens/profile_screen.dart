import 'package:flutter/material.dart';
import 'package:chuzzlez/providers/user_provider.dart';
import '../models/user.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 25,
          ),
          Row(children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.pushNamed(context, '/friends',
                      //     arguments: {'choice': 'viewFriends'});
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      side: BorderSide(color: Colors.black),
                    ),
                  )),
            )
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height / 25,
          ),
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [Colors.teal.shade400, Colors.teal.shade600])),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://i.pinimg.com/736x/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg",
                        ),
                        radius: MediaQuery.of(context).size.height / 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
                      ),
                      Text(
                        Provider.of<UserProvider>(context, listen: false)
                            .getUser
                            .firstName,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 13,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 30,
                          vertical: MediaQuery.of(context).size.height / 70,
                        ),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.teal.shade200,
                        elevation: MediaQuery.of(context).size.height / 50,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 10,
                            vertical: MediaQuery.of(context).size.height / 30,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "Level",
                                      style: TextStyle(
                                        color: Colors.teal.shade400,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              100,
                                    ),
                                    Text(
                                      Provider.of<UserProvider>(context,
                                              listen: false)
                                          .getUser
                                          .currentLevel
                                          .toString(),
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                25,
                                        color: Colors.teal.shade400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "Won",
                                      style: TextStyle(
                                        color: Colors.teal.shade400,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              100,
                                    ),
                                    Text(
                                      "${Provider.of<UserProvider>(context, listen: false).getUser.completedLevels.length}",
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                25,
                                        color: Colors.teal.shade400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "Games",
                                      style: TextStyle(
                                        color: Colors.teal.shade400,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              100,
                                    ),
                                    Text(
                                      "NA",
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                25,
                                        color: Colors.teal.shade400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          SizedBox(height: MediaQuery.of(context).size.height / 30),
          Container(
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            height: 20.0,
          ),

          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/friends', arguments: {
                'friends': Provider.of<UserProvider>(context, listen: false)
                    .getUser
                    .friends,
                'choice': 'viewFriends'
              });
            },
            child: Column(children: [
              Text('My Friends',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ]),
            style: OutlinedButton.styleFrom(
              shape: StadiumBorder(),
              side: BorderSide(color: Colors.black),
            ),
          ),

          RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              elevation: 0.0,
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [Colors.teal.shade400, Colors.teal.shade600]),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width,
                      minHeight: MediaQuery.of(context).size.height / 10),
                  alignment: Alignment.center,
                  child: Text(
                    "Settings",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height / 20,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
