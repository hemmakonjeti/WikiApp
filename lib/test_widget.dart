import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.width * 0.30,
          width: 100,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.green,
          ),
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            fit: StackFit.expand,
            children: [

              Positioned(
                child: Container(
                  /*width: 50,
                  height: 50,*/
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                    // image: DecorationImage(image: NetworkImage('https://image.shutterstock.com/image-photo/young-man-sportswear-running-on-260nw-428663329.jpg',), fit: BoxFit.cover)
                  ),
                   child: Image.network('https://image.shutterstock.com/image-photo/young-man-sportswear-running-on-260nw-428663329.jpg',
                                  fit: BoxFit.cover,
                                ),
                ),
              ),

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                    color: Colors.grey,
                  ),
                  child: Text(
                    'Oct 25 - Dec 5',
                    style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
