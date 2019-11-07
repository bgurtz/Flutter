import 'package:flutter/material.dart';

void main() => runApp(ListDemo());

class ListDemo extends StatelessWidget {
  const ListDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("List View and Grid Items"),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Vertical',
                  ),
                Tab(
                  text: 'Horizontal',
                  ),
                Tab(
                  text: 'Grid',
                  ),
                Tab(
                  text: 'Mix View',
                  ),
              ],
            ),
          ),

          body: TabBarView(
            children: <Widget>[
              // Center(
              //   child: Text("Vertical"),
              //   ),
              ListVertical(),

              // Center(
              //   child: Text("Horizontal"),
              //   ),
              HorizontalListView(),

              // Center(
              //   child: Text("Grid"),
              //   ),
              GridWidget(),

              // Center(
              //   child: Text("Mix view"),
              //   ),
              MixList(items: getListItems (20)),

            ],
          ),

        ),
      ),
    );
  }
}

class ListVertical extends StatelessWidget {
  const ListVertical({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // for (int i = 0; i < 50; ++i) 
        // ListTile(
        //   leading: Icon(Icons.map),
        //   title: Text("Map $i"),
        //   onTap: () {
        //     print("On Tap Map");
        //   }
        // ),

        ListTile(
          leading: Icon(Icons.map),
          title: Text("Map"),
          onTap: () {
            print("On Tap Map");
          }
        ),

        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.pink,),
          title: Text("Album"),
          subtitle: Text("Music"),
          onTap: () {
            print("On Tap Album");
          }
        ),


      GestureDetector(
        onTap: () {
          print("Hello Container tap");
        },
        child: Container(
          height: 40,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.green,
          ),
          child: Center(
            child: Text("Hello Container", style: TextStyle(
              fontFamily: 'Pacifico', fontSize: 20.0,
              color: Colors. white, letterSpacing: 5.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 200.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            color: Colors.green,
            height: 200.0,
            width: 200,
          ),
          Container(
            color: Colors.red,
            height: 200.0,
            width: 200,
          ),
          Container(
            color: Colors.blue,
            height: 200.0,
            width: 200,
          ),
        ],
      ),
    );
  }
}

class GridWidget extends StatelessWidget {
  const GridWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 2,
    scrollDirection: Axis.vertical,
    
    // The List Generate makes as many as we want.
      children: List.generate(30, (index){
        return Center(
          child: Container(
            height: 150,
            width: 150,
            color: Colors.grey[200],
            child: Text('Item: $index'),
          ),
        );
      }),

      // The code below is how to manually make grid items

    //  children: <Widget>[
      // Container(
      //   color: Colors.green,
      //   height: 100,
      //   width: 100,
      //   margin: EdgeInsets.all(10.0),
      // ),
      // Container(
      //   color: Colors.red,
      //   height: 100,
      //   width: 100,
      //   margin: EdgeInsets.all(10.0),
      // ),
      // Container(
      //   color: Colors.orange,
      //   height: 100,
      //   width: 100,
      //   margin: EdgeInsets.all(10.0),
      // ),
      // Container(
      //   color: Colors.blue,
      //   height: 100,
      //   width: 100,
      //   margin: EdgeInsets.all(10.0),
      // ), 
    //  ],
    );
  }
}

abstract class ListItem {}

class HeadingItem extends ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem extends ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}

List<ListItem> getListItems(int length) {
  return List<ListItem>.generate(length, (i) {
    return i % 6 == 0 
      ? HeadingItem('Heading $i') 
      : MessageItem('sender $i', 'Message Body $i');
  });
}

class MixList extends StatelessWidget {
  final List<ListItem> items;

  MixList({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        if (item is HeadingItem) {
          return ListTile(
            title: Text(
              item.heading,
              style: Theme.of(context).textTheme.headline,
            ),
          );
        } else if (item is MessageItem) {
          return ListTile(
            title: Text(item.sender),
            subtitle: Text(item.body),
          );
        }
        return Container();
      },
    );
  }
}