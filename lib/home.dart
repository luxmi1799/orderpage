import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order/radio.dart';
import 'package:timelines/timelines.dart';
import 'biezer.dart';


const kTileHeight = 50.0;
const double _shadowHeight = 4;
double _position = 4;
const completeColor = Colors.grey;
const inProgressColor = Color(0xffFFCD2C);
const todoColor = Color(0xffd1d2d7);

final _processes = [
  'Prospect',
  'Tour',
  'Offer',
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int counter = 0;
  String? _selectedUser = null ;
  int _processIndex = 0;
  var orderidtype ;
  var mymodel = ["29/10/2022" ," 30/10/2022"] ;
  int _value = 1;
  final double _height = 55 - _shadowHeight;
  List story_teamlist = ["Hindustan factory", " Preetham’s Home"];
  List poc_list = ["Preetham ", "Pradeep Kumar"];
  List poc_list_d = [" Site manager at Hitech City,Mobile: 77788 99456 Email: preetham@scube.me ", "Manager at Kukatpally,Mobile : 9896549874 Email ID : Pradeep123@gmail.com"];
  List address = ["Plot No 4, HMDA Maitrivanam, Satyam Theatre Rd, beside Blue Fox Hotel, Kumar Basti, Srinivasa Nagar, Ameerpet, Hyderabad, Telangana 500038","Plot No 4, HMDA Maitrivanam, Sa..."];

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xfff5f5f7),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(85.0), // here the desired height
          child: AppBar(
            backgroundColor: Color(0xff0B1A33),
            leading: Icon(Icons.menu,color: Color(0xffFFCD2C),),
            actions: <Widget>[
              // Using Stack to show Notification Badge
              new Stack(
                children: <Widget>[
                  new IconButton(
                      icon: Icon(
                          Icons.notifications_outlined,size: 32,color: Colors.white,), onPressed: () {
                    setState(() {
                      counter = 0;
                    });
                  }),
                  counter != 1 ? new Positioned(
                    right: 11,
                    top: 11,
                    child: new Container(
                      padding: EdgeInsets.all(2),
                      decoration: new BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 14,
                        minHeight: 14,
                      ),
                      child: Text(
                        '$counter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ) : new Container()
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset("assets/img.png", width: 40,height: 40,),
                ),
              )

            ],
            // ...
          )
      ),
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 40),
                child: Container(
                  width: 120,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Color(0xffE0F0FF),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text("Your Orders",style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200
                    ),),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 0),
                child: Text("Create New Order",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black
                ),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 0),
                child: Text("Enter the details.",style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),),
              ),

              Container(
               height: 100,
                child: Timeline.tileBuilder(
                  theme: TimelineThemeData(
                    direction: Axis.horizontal,
                    connectorTheme: ConnectorThemeData(
                      space: 30.0,
                      thickness: 3.0,
                    ),
                  ),
                  builder: TimelineTileBuilder.connected(
                    connectionDirection: ConnectionDirection.before,
                    itemExtentBuilder: (_, __) =>
                    MediaQuery.of(context).size.width / _processes.length,
                    /*contentsBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          _processes[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: getColor(index),
                          ),
                        ),
                      );
                    },*/
                    indicatorBuilder: (_, index) {
                      var color;
                      var child;
                      if (index == _processIndex) {
                        color = inProgressColor;
                        child = Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:Icon(
                            Icons.water_drop,
                            color: Colors.black,
                            size: 15.0,
                          )
                        );
                      } else if (index < _processIndex) {
                        color = completeColor;
                        child = Icon(
                          Icons.water_drop,
                          color: Colors.black,
                          size: 15.0,
                        );
                      } else {
                        color = todoColor;
                      }

                      if (index <= _processIndex) {
                        return Stack(
                          children: [
                            CustomPaint(
                              size: Size(30.0, 30.0),
                              painter: _BezierPainter(
                                color: color,
                                drawStart: index > 0,
                                drawEnd: index < _processIndex,
                              ),
                            ),
                            DotIndicator(
                              size: 30.0,
                              color: color,
                              child: child,
                            ),
                          ],
                        );
                      } else {
                        return Stack(
                          children: [
                            CustomPaint(
                              size: Size(15.0, 15.0),
                              painter: _BezierPainter(
                                color: color,
                                drawEnd: index < _processes.length - 1,
                              ),
                            ),
                            OutlinedDotIndicator(
                              borderWidth: 4.0,
                              color: color,
                            ),
                          ],
                        );
                      }
                    },
                    connectorBuilder: (_, index, type) {
                      if (index >= 0) {
                        if (index == _processIndex) {
                          final prevColor = getColor(index - 1);
                          final color = getColor(index);
                          List<Color> gradientColors;
                          if (type == ConnectorType.start) {
                            gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
                          } else {
                            gradientColors = [
                              prevColor,
                              Color.lerp(prevColor, color, 0.5)!
                            ];
                          }
                          return DecoratedLineConnector(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: gradientColors,
                              ),
                            ),
                          );
                        } else {
                          return SolidLineConnector(
                            color: getColor(index),
                          );
                        }
                      } else {
                        return null;
                      }
                    },
                    itemCount: _processes.length,
                  ),
                 ),
                ),

              Card(
                margin: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Order Details",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black
                          ),),

                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width*0.9,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Color(0xfff6f6f6),
                          border: Border(
                            bottom: BorderSide(width: 2.0, color: Color(0xffFFCD2C)),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Order id",style: TextStyle(
                                fontSize: 10
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0,bottom: 5),
                              child: Text("4387",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 5,
                      ),

                      Container(
                        margin: EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width*0.9,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Color(0xfff6f6f6),
                          border: Border(
                            bottom: BorderSide(width: 2.0, color: Color(0xffFFCD2C)),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Select Order Type",style: TextStyle(
                                fontSize: 10
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0,bottom: 5),
                              child: Text("Normal Delivery",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 5,
                      ),

                      Container(
                        margin: EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width*0.9,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Color(0xfff6f6f6),
                          border: Border(
                            bottom: BorderSide(width: 2.0, color: Color(0xffFFCD2C)),
                          ),
                        ),
                        child:DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            itemHeight: 50,
                            isExpanded: true,
                            hint: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text("Select Delivery Date ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color:  Colors.black,
                                ),),
                            ),
                            icon: Icon(                // Add this
                              Icons.keyboard_arrow_down_sharp,  // Add this
                              color: Colors.black,
                              size: 30,// Add this
                            ),
                            value: _selectedUser,
                            isDense: true,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedUser = newValue;
                              });
                            },
                            items: mymodel.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(value,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),


                      SizedBox(
                        height: 5,
                      ),

                      Container(
                        margin: EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width*0.9,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Color(0xfff6f6f6),
                          border: Border(
                            bottom: BorderSide(width: 2.0, color: Color(0xffFFCD2C)),
                          ),
                        ),
                        child:DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            itemHeight: 50,
                            isExpanded: true,
                            hint: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text("Select Delivery Time",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color:  Colors.black,
                                ),),
                            ),
                            icon: Icon(                // Add this
                              Icons.keyboard_arrow_down_sharp,  // Add this
                              color: Colors.black,
                              size: 30,// Add this
                            ),
                            value: _selectedUser,
                            isDense: true,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedUser = newValue;
                              });
                            },
                            items: mymodel.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(value,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 5,
                      ),

                      Container(
                        margin: EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width*0.9,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Color(0xfff6f6f6),
                          border: Border(
                            bottom: BorderSide(width: 2.0, color: Color(0xffFFCD2C)),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0,bottom: 5),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter Fuel Qty ( in Lts)",
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black
                                  ),
                                ),
                                 style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Present Fuel Price ( 95 /- Rs)",style: TextStyle(
                            fontSize: 12
                          ),),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Card(
                margin: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Choose Delivery Location",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black
                          ),),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(),
                      ),


                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(5),
                          dashPattern: [5, 5],
                          color: Color(0xffFFCD2C),
                          strokeWidth: 1.5,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: Text("+ Add new address",style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "poppins",
                                      ),)),
                                ],
                            ),
                          ),

                        ),
                      ),

                      ListView.builder(
                        itemCount:story_teamlist.length,
                        shrinkWrap: true,
                        physics:ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context,index){
                          return  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.8,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffE5EDFC)),
                                color: Color(0xffFBFCFF),
                              ),
                              child: Column(
                                children: [
                                  MyRadioListTile<int>(
                                    value: index,
                                    groupValue: _value,
                                    leading: '',
                                    title:Text(
                                      story_teamlist[index],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),
                                    ),
                                    trailing: Icon(Icons.edit_note,color: Color(0xff21AE2F),),
                                    onChanged: (value) => setState(() {
                                      _value = value!;
                                    }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13.0,bottom: 10),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width*.7,
                                      child: Text(
                                       address[index],
                                       textAlign: TextAlign.justify,
                                        style: TextStyle(
                                        fontWeight:FontWeight.w400,
                                        fontSize: 14
                                      ),),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),

              Card(
                margin: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("POC Details",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black
                          ),),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(),
                      ),


                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(5),
                          dashPattern: [5, 5],
                          color: Color(0xffFFCD2C),
                          strokeWidth: 1.5,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Text("+ Add new POC",style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "poppins",
                                    ),)),
                              ],
                            ),
                          ),

                        ),
                      ),

                      ListView.builder(
                        itemCount:poc_list.length,
                        shrinkWrap: true,
                        physics:ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context,index){
                          return  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.8,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffE5EDFC)),
                                color: Color(0xffFBFCFF),
                              ),
                              child: Column(
                                children: [
                                  MyRadioListTile<int>(
                                    value: index,
                                    groupValue: _value,
                                    leading: '',
                                    title:Text(
                                      poc_list[index],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),
                                    ),
                                    trailing: Icon(Icons.edit_note,color: Color(0xff21AE2F),),
                                    onChanged: (value) => setState(() {
                                      _value = value!;
                                    }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 13.0,bottom: 10),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width*.7,
                                      child: Text(
                                        poc_list_d[index],
                                        //textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            fontWeight:FontWeight.w400,
                                            fontSize: 14
                                        ),),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Go Back",style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),

                    Container(
                      height: _height + _shadowHeight,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: _height,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                color: Color(0xffFFCD2C).withOpacity(0.5),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            curve: Curves.easeIn,
                            bottom: _position,
                            duration: Duration(milliseconds: 70),
                            child: Container(
                              height: _height,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                color: Color(0xffFFCD2C),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Confirm',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'lato',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
    );
  }
}


class _BezierPainter extends CustomPainter {
  const _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    var angle;
    var offset1;
    var offset2;

    var path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius,
            radius) // TODO connector start & gradient
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(size.width, size.height / 2, size.width + radius,
            radius) // TODO connector end & gradient
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}