import 'package:flutter/material.dart';

import 'TicTac.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Tic Tac Toe",
    home: TicTac(),
  ));
}
