import 'package:flutter/material.dart';

class Sliver_Screen extends StatelessWidget {
  const Sliver_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Sliver Screen"),
            centerTitle: true,
          ),
        ],
      ),
    );
  }
}
