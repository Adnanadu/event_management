import 'package:flutter/material.dart';

class FestivalDetailsPage extends StatelessWidget {
  const FestivalDetailsPage({super.key, required String festivalId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Festival Description Page'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Image(image: AssetImage("assets/images/user.jpg")),
            ),
            Text("Festival Name"),
            Text("Description"),
          ],
        ),
      ),
    );
  }
}
