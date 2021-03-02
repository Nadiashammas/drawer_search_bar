import 'package:flutter/material.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Search App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
      drawer: MultiLevelDrawer(
        backgroundColor: Colors.white,
        rippleColor: Colors.white,
        subMenuBackgroundColor: Colors.grey.shade100,
        header: Container(
          // Header for Drawer
          height: size.height * 0.25,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                "https://www.pngitem.com/pimgs/m/115-1151650_happy-icon-happyface-face-emoji-smile-sonrisa-feliz.png",
                width: 100,
                height: 100,
              ),
              SizedBox(
                height: 10,
              ),
              Text("Nadia Shammas")
            ],
          )),
        ),
        children: [
          // Child Elements for Each Drawer Item
          MLMenuItem(
              leading: Icon(Icons.person),
              trailing: Icon(Icons.arrow_right),
              content: Text(
                "My Profile",
              ),
              subMenuItems: [
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 2")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 3")),
              ],
              onClick: () {}),
          MLMenuItem(
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.arrow_right),
              content: Text("Settings"),
              onClick: () {},
              subMenuItems: [
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 2"))
              ]),
          MLMenuItem(
            leading: Icon(Icons.notifications),
            content: Text("Notifications"),
            onClick: () {},
          ),
          MLMenuItem(
              leading: Icon(Icons.payment),
              trailing: Icon(Icons.arrow_right),
              content: Text(
                "Payments",
              ),
              subMenuItems: [
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 2")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 3")),
                MLSubmenu(onClick: () {}, submenuContent: Text("Option 4")),
              ],
              onClick: () {}),
        ],
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //
              //   // colors: [
              //   //   Color.fromRGBO(0, 65, 108, 1.0),
              //   //   Color.fromRGBO(255, 150, 255, 1.0),
              //   // ]
              // ),
              ),
          child: Container(
            width: 247,
            height: 74,
            decoration: BoxDecoration(
              color: const Color(0xff1a21e1),
              border: Border.all(
                width: 1,
                color: const Color(0xff707070),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 3),
                  blurRadius: 6,
                  color: const Color(0xff000000).withOpacity(0.46),
                )
              ],
            ),
          )),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final things = [
    "perfume",
    "sketch pad",
    "CD",
    "watch",
    "helmet",
    "soda can",
    "monitor",
    "ring",
    "pencil",
    "money",
    "tree",
    "fork",
    "playing card",
    "rug",
    "fridge",
    "blouse",
    "water bottle",
    "picture frame",
    "tissue box",
    "spoon",
    "photo album",
    "leg warmers",
    "cat",
    "thermostat",
    "ipod",
    "cinder block",
    "coasters",
    "fake flowers",
    "window",
    "shoe lace",
    "cup",
    "mp3 player",
    "pen",
    "headphones",
    "spring",
    "sun glasses",
    "camera",
    "washing machine",
    "wagon",
    "street lights",
    "soy sauce packet",
    "chalk",
    "cell phone",
    "chapter book",
    "tv",
    "milk",
    "shovel",
    "brocolli",
    "bookmark",
    "glow stick",
  ];

  final thingsBuy = [
    "chapter book",
    "tv",
    "milk",
    "cell phone",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = " ";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.blue,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? thingsBuy
        : things.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          onTap: () {
            showResults(context);
          },
          leading: Icon(Icons.category),
          title: RichText(
              text: TextSpan(
                  text: suggestionList[index].substring(0, query.length),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(
                      color: Colors.grey,
                    ))
              ]))),
      itemCount: suggestionList.length,
    );
  }
}
