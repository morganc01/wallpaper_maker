
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

Color primary = Color(0xffffc93c);
Color primaryDark = Color(0xff07689f);
Color accent = Color(0xff40a8c4);
Color accentLight = Color(0xffa2d5f2);
double leftMargin = 30;
double centralBoxSize;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  AnimationController _controllerBody;
  Animation<double> _animationBody;

  AnimationController _controllerBulb;
  Animation<double> _animationBulb;

  @override
  void dispose() {
    _controllerBody.dispose();
    _controllerBulb.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controllerBody = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _animationBody = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controllerBody,
      curve: Curves.easeOut,
    ));

    _controllerBulb = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _animationBulb = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controllerBulb,
      curve: Curves.easeInOutQuint,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    _controllerBody.forward();
    _controllerBulb.forward();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (BuildContext context) {
          centralBoxSize ??= MediaQuery.of(context).size.height / 6;
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: primary,
              leading: Container(
                margin: EdgeInsets.only(left: 30, bottom:0, top:0),

              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    top: 0,
                    bottom:0,
                  ),

                  child: Text(
                    'Aesthetic Wallpapers',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),

                  ),
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                            )),
                        margin: EdgeInsets.only(top: 25),
                      ),
                      FadeTransition(
                        opacity: _animationBody,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 1),
                            end: Offset(0, 0),
                          ).animate(_animationBody),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[


                              //PALETTES
                              Container(
                                height: centralBoxSize,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top:5, bottom:0),
                                padding: EdgeInsets.only(bottom:0),
                                child: Text(
                                  'Color Palettes',
                                  style: TextStyle(
                                      color: primaryDark,
                                      fontSize: 35,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold),
                                ),

                              ),
                              Container(
                                height:350,

                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top:0, bottom:20),
                                child: ListView(
                                  padding: const EdgeInsets.all(8),
                                  children: <Widget>[
                                   Container(
                                      height: 100,
                                      color: primary,
                                      child: Row(

                                      )
                                   ),
                                    Container(
                                      height: 100,
                                      color: primaryDark,
                                      child: Row(

                                        children: <Widget>[
                                          Container(

                                            color: Colors.teal,

                                          ),
                                          Container(

                                            color: Colors.red,

                                          ),
                                          Container(

                                          ),
                                          Container(

                                          ),


                                        ],

                                      ),
                                    ),
                                    Container(
                                      height: 100,
                                      color: accent,
                                      child: Row(

                                      ),
                                    ),
                                    Container(
                                      height: 100,
                                      color: accentLight,
                                      child: Row(

                                      ),
                                    ),
                                  ],
                                ),
                              ),



                              //THE BOTTOM BAR
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                height: 100,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => MyApp()),
                                        );
                                      },
                                      child: Icon(
                                        Icons.create,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => SecondRoute()),
                                        );
                                      },
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                        size: 40,
                                      ),

                                    ),


                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: accent,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.elliptical(90, 100),
                                      bottomLeft: Radius.circular(50),
                                      bottomRight: Radius.circular(50),
                                    )),
                              )
                            ],

                          ),
                        ),
                      ),
                      FadeTransition(
                        opacity: _animationBulb,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 1),
                            end: Offset(0, 0),
                          ).animate(_animationBulb),
                          child: Align(
                            alignment: Alignment.topRight,
                            //THE BULB
                            child: Stack(
                              children: <Widget>[

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            backgroundColor: primary,
          );
        },
      ),
    );
  }
}












class SecondRoute extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      elevation: 0,
      backgroundColor: primary,
      leading: Container(
        margin: EdgeInsets.only(left: 30, bottom:0, top:0),

      ),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            top: 0,
            bottom:0,
          ),

          child: Text(
            'Aesthetic Wallpapers',
            style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),

          ),
        ),
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                    )),
                margin: EdgeInsets.only(top: 25),
              ),


               Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[


                      //PALETTES
                      Container(
                        height: centralBoxSize,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top:5, bottom:0),
                        padding: EdgeInsets.only(bottom:0),
                        child: Text(
                          'My Favorites',
                          style: TextStyle(
                              color: primaryDark,
                              fontSize: 35,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold),
                        ),

                      ),
                      Container(
                        height:350,

                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top:0, bottom:20),
                        child: ListView(
                          padding: const EdgeInsets.all(8),
                          children: <Widget>[
                            Container(
                              height: 100,
                              color: primary,
                              child: const Center(child: Text('section')),
                            ),

                          ],
                        ),
                      ),



                      //THE BOTTOM BAR
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height: 100,
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyApp()),
                                );
                              },
                              child: Icon(
                                Icons.create,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SecondRoute()),
                                );
                              },
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 40,
                              ),

                            ),


                          ],
                        ),
                        decoration: BoxDecoration(
                            color: accent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.elliptical(90, 100),
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            )),
                      )
                    ],

                  ),


            ],
          ),
        )
      ],
    ),
    backgroundColor: primary,
  );
}
}
