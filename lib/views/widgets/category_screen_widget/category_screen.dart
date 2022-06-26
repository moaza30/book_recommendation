import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Text("sss");
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
