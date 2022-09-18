import 'dart:async';

import 'package:duuchin_flutter/root_page.dart';
import 'package:flutter/material.dart';

class TransitPage extends StatefulWidget {
  const TransitPage({super.key});

  @override
  State<TransitPage> createState() => _TransitPageState();
}

class _TransitPageState extends State<TransitPage> {

  late Timer _time;
  int _currentTime = 6;

  @override
  void initState() {
    super.initState();
    _time = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        _currentTime --;
      });
      if (_currentTime <= 0) {
        _jumpRootPage();
      }
    });
  }

  void _jumpRootPage() {
    _time.cancel();
    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(
        builder: (BuildContext context) => const RootPage(),
      ), 
      (route) => false
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/common/page.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 10,
            child: InkWell(
              child: _clipButton(),
              onTap: _jumpRootPage,
            )
          )
        ],
      ),
    );
  }
  
  Widget _clipButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 50,
        height: 50,
        color: Colors.black.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("跳过", style: TextStyle(color: Colors.white, fontSize: 12)),
            Text("$_currentTime", style: const TextStyle(color: Colors.white, fontSize: 12),)
         ]
        ),
      ),
    );
  }
}