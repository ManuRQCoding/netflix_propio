import 'package:flutter/material.dart';

Row mainInfoRow(String t1, String t2, String t3, String t4, String t5) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        t1,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.5,
        ),
      ),
      Icon(
        Icons.fiber_manual_record,
        color: Colors.white,
        size: 5.0,
      ),
      Text(
        t2,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.5,
        ),
      ),
      Icon(
        Icons.fiber_manual_record,
        color: Colors.white,
        size: 5.0,
      ),
      Text(
        t3,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.5,
        ),
      ),
      Icon(
        Icons.fiber_manual_record,
        color: Colors.white,
        size: 5.0,
      ),
      Text(
        t4,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.5,
        ),
      ),
      Icon(
        Icons.fiber_manual_record,
        color: Colors.white,
        size: 5.0,
      ),
      Text(
        t5,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.5,
        ),
      ),
    ],
  );
}
