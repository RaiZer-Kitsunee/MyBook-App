// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MemorieWidget extends StatelessWidget {
  const MemorieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.black,
            width: 0.2,
          ),
        ),
      ),
      child: Row(
        children: [
          //* date and number
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: SizedBox(
              height: 55,
              width: 55,
              child: Center(
                child: Column(
                  children: [
                    //* day
                    Text(
                      "SAT",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    //* day in number
                    Text(
                      "17",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //* Memorie Part
          Container(
            width: MediaQuery.sizeOf(context).width / 1.31,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //* title and note
                Text(
                  "Title",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Note like a sub note but grey and cool thing if you tell me i want a red clows with a hummers and then the imposible happens",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                //* time
                Text(
                  "21:29",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
