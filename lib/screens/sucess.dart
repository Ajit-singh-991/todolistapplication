import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Sucess extends StatefulWidget {
  const Sucess({super.key});

  @override
  State<Sucess> createState() => _SucessState();
}

class _SucessState extends State<Sucess> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
    );
  }
}