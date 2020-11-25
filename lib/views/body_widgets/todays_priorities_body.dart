import 'package:flutter/material.dart';

class TodaysPrioritiesBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550.0,
      margin: EdgeInsets.only(right: 20.0),
      child: GridView.count(
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        shrinkWrap: true,
        children: List.generate(3, (index) {
          return Container(
            width: 70.0,
            height: 50.0,
            margin: EdgeInsets.only(top: 25.0, left: 25.0),
            padding: EdgeInsets.only(
              top: 20.0,
              left: 20.0,
              bottom: 20.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300], width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('data'),
                    Container(
                      width: 28.0,
                      height: 5.0,
                      decoration: BoxDecorationg(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0))),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('data'),
                      Icon(Icons.alarm),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
