import 'package:flutter/material.dart';

class LoginwithEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Column(
          children: [
            Image.asset('assets/6343845.jpg'),
            Text(
              'welcome back to medicode',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
