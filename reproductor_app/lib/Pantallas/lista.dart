import 'package:flutter/material.dart';

class Radios extends StatefulWidget {
  Radios({Key? key}) : super(key: key);

  @override
  _RadiosState createState() => _RadiosState();
}

class _RadiosState extends State<Radios> {
   double opacityLevel = 0.0;
  bool _value = false;
  bool _value1 = false;
  @override
  Widget build(BuildContext context) {
    return Center(
          child: InkWell(
        onTap: () {
          setState(() {
            _value = !_value;
            _value1 = !_value1;
          });
        },
        child:Column(
          children: [
            Row(
          children: [
            Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red.shade200),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: _value
                ? Icon(
                    Icons.check,
                    size: 30.0,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.check_box_outline_blank,
                    size: 30.0,
                    color: Colors.red.shade200,
                  ),
          ),
        ),
        Text('   Juan Jose Flores ',style: TextStyle(fontSize: 30))

          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red.shade200),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: _value1
                ? Icon(
                    Icons.check,
                    size: 30.0,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.check_box_outline_blank,
                    size: 30.0,
                    color: Colors.red.shade200,
                  ),
          ),
        ),
        Text('    Hugo Enrique Martinez ',style: TextStyle(fontSize: 30))

          ],
        ),
         SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red.shade200),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: _value1
                ? Icon(
                    Icons.check,
                    size: 30.0,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.check_box_outline_blank,
                    size: 30.0,
                    color: Colors.red.shade200,
                  ),
          ),
        ),
        Text('    Jairo Ezequiel Pineda ',style: TextStyle(fontSize: 30))

          ],
        ),
         SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red.shade200),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: _value1
                ? Icon(
                    Icons.check,
                    size: 30.0,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.check_box_outline_blank,
                    size: 30.0,
                    color: Colors.red.shade200,
                  ),
          ),
        ),
        Text('    Juan Francisco Flores ',style: TextStyle(fontSize: 30)),
        AnimatedOpacity(
                      duration: Duration(seconds: 3),
                      opacity: opacityLevel,
                      child: Column(
                        children: <Widget>[
                           Container(
                              child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                          ),
                          color: Colors.white,
                          child: Center(
                             child: Icon(
                        Icons.skip_next_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                          ),
                        ),
                     ),
                    
                        ],
                      ),
                    ),

          ],
        ),
          ],
        ),
         
      ),
    );
  }
}