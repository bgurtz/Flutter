import 'package:flutter/material.dart';

void main() => runApp(TabsApp());

class TabsApp extends StatelessWidget {
  const TabsApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4, 
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tabs Example"),
            bottom: TabBar(
              tabs: <Widget>[
                Tab (child: Icon(Icons.home)),
                Tab (child: Icon(Icons.photo)),
                Tab (child: Icon(Icons.account_circle)),
                Tab (child: Text("Finish")),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: Text("A for Apple"),
              ),
              Center(
                child: Text("B for Book"),
              ),
              Center(
                child: Text("C for Count"),
              ),
              // Center(
              //   child: Text("Finished"),
              // ),

              FinishedView(),

            ],
          ),
        ),
      ),
    );
  }
}

class FinishedView extends StatelessWidget {
  const FinishedView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Hello World", 
        style: TextStyle(
          fontFamily: 'Pacifico',
          fontSize: 30.0,
          color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}