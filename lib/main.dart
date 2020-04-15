import 'package:flutter/material.dart';
import 'package:quizzler/views/home_page.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: HomePage(),
          ),
        ),
      ),
    ));
