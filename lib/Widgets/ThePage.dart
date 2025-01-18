// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';

class Pages extends StatelessWidget {
  const Pages({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey flipController = GlobalKey<PageFlipWidgetState>();
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(50),
            left: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 25, bottom: 25, right: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(50),
              ),
              color: Colors.grey.shade400,
            ),
            child: PageFlipWidget(
              key: flipController,
              backgroundColor: Colors.white,
              // isRightSwipe: true,
              lastPage: Container(
                color: Colors.white,
                child: const Center(
                  child: Text('Last Page!'),
                ),
              ),
              children: <Widget>[
                for (var i = 0; i < 10; i++)
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Column(
                        children: [
                          //* day num - month - time -------------- day
                          Padding(
                            padding: const EdgeInsets.only(right: 40, top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("13th,July'19"),
                                Text("Friday"),
                              ],
                            ),
                          ),

                          //* divider
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 0.9,
                            margin: EdgeInsets.only(right: 35, top: 15),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(right: 20, top: 10),
                            width: MediaQuery.sizeOf(context).width,
                            height: 540,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //* page
                                Text(
                                  "Hello",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Note like a sub note but grey and cool thing if you tell me i want a red clows with a hummers and then the imposible happens",
                                ),
                              ],
                            ),
                          ),

                          //* page number
                          Text(i.toString()),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
