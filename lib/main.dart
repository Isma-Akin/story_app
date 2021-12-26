import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story_app/CustomIcons.dart';
import 'data.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 12;

class _MyHomePageState extends State<MyHomePage> {

  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page
      });
    })
    return Scaffold(
        backgroundColor: Color(0xFF2d3447),
        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12.0, top: 30.0,
                      bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CustomIcons.menu,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(
                    horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Trending",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 46.0,
                      fontFamily: "Callibre-Semibold",
                      letterSpacing: 1.0,
                    )),
                    IconButton(onPressed: () {},
                        icon: Icon(
                          CustomIcons.option,
                          size: 12.0,
                          color: Colors.white,
                        ),
                    )
                  ],
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFff6e6e),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 22.0,
                            vertical: 6.0),
                            child: Text("Animated",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,),
                      Text("25+ Stories",
                        style: TextStyle(
                          color: Colors.blueAccent
                        ),

                      )
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                  CardScrollWidget(currentPage),

                    Positioned.fill(
                      child: PageView.builder(
                          itemCount: images.length,
                          controller: controller,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return Container();
                          },),
                    )
                  ],
                )
              ],
            )
        )
    );
  }}

class CardScrollWidget extends StatelessWidget {

  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(aspectRatio: widgetAspectRatio,
    child: LayoutBuilder(
      builder: (context,constraints) {
        var width = constraints.maxWidth;
        var height = constraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;


        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta,0.0),

              textDirection: textDirection, child: child)
        }
      },
    ),);
  }
}
