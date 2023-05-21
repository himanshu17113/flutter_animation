import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> radiuscontroller;
  late Animation<double> rotationcontroller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..forward();

    rotationcontroller = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    radiuscontroller = Tween(begin: 360.0, end: 10.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    controller.addListener(() {
      setState(() {});
    });

    controller.addStatusListener((status) {
      if (controller.isCompleted) {
        controller.reverse();
      } else if (controller.isDismissed) {
        controller.forward();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Container(
      color: Color.fromARGB(250, 30, 30, 30),
      //Color.fromARGB(250, 24, 18, 43),
      // const Color(0x0009b451),
      child: SafeArea(
        child: Center(
          child: Stack(alignment: Alignment.center, children: <Widget>[
            Transform.rotate(
              angle: rotationcontroller.value,
              alignment: Alignment.center,
              child: Container(
                width: width / 2,
                height: width / 2,
                decoration: BoxDecoration(
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 25.0,
                        offset: Offset(0.0, 1))
                  ],
                  borderRadius: BorderRadius.circular(radiuscontroller.value),
                  color: Color.fromARGB(255, 91, 40, 131),

                  // Colors.pinkAccent,
                ),
                child: Transform.rotate(
                  angle: rotationcontroller.value,
                  child: Container(
                    margin: EdgeInsets.all(33),
                    // padding: EdgeInsets.all(150),
                    // width: width / 2,
                    // height: width / 2,
                    decoration: BoxDecoration(
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 25.0,
                            offset: Offset(0.0, 1))
                      ],
                      borderRadius:
                          BorderRadius.circular(radiuscontroller.value),
                      color:
                          // Color.fromARGB(255, 91, 40, 131)
                          Colors.purple[300],
                    ),
                    //child: ,
                  ),
                ),
              ),
            ),
            Transform.rotate(
              angle: rotationcontroller.value,
              child: Container(
                margin: EdgeInsets.all(33),
                // padding: EdgeInsets.all(150),
                width: width / 4,
                height: width / 4,
                decoration: BoxDecoration(
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 25.0,
                        offset: Offset(0.0, 1))
                  ],
                  borderRadius: BorderRadius.circular(radiuscontroller.value),
                  color:
                      // Color.fromARGB(255, 91, 40, 131)
                      Colors.pinkAccent,
                ),
                //child: ,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
