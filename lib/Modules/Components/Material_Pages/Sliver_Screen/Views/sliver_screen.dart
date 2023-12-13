import 'package:flutter/material.dart';

class SliverScreen extends StatelessWidget {
  const SliverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            stretch: true,
            pinned: false,
            snap: true,
            floating: true,
            expandedHeight: 200,
            collapsedHeight: 80,
            // title: Text("Sliver App Bar"),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
                StretchMode.blurBackground,
              ],
              background: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://cdn.dribbble.com/users/1161517/screenshots/7896076/media/24ae74ddb6c9eb7789ae3a189a6b30ae.gif"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: const Text(
                "Sliver Screen",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: 200,
                color: Colors.red,
              ),
              Container(
                height: 200,
                color: Colors.blue,
              ),
              Container(
                height: 200,
                color: Colors.purple,
              ),
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(childCount: 17, (ctx, i) {
              return Container(
                margin: EdgeInsets.all(10),
                height: 100,
                color: Colors.primaries[i],
              );
            }),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 300,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5),
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.purple,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.purple,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.purple,
              ),
              Container(
                color: Colors.black,
              ),
            ]),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 100,
            ),
            delegate: SliverChildBuilderDelegate(childCount: 17, (ctx, i) {
              return Container(
                margin: const EdgeInsets.all(10),
                height: 100,
                color: Colors.primaries[i],
              );
            }),
          ),
        ],
      ),
    );
  }
}
