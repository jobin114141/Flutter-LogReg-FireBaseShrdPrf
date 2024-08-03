import 'package:flutter/material.dart';
import 'package:flutter_application_1/Provider/ShrdPrfns.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    var temp = Provider.of<ShrdPrfns>(context).logedOrNot;

    return Scaffold(
      body: Column(
        children: [
          Center(child: (Text("Home PAge"))),
          ElevatedButton(
              onPressed: () {
                Provider.of<ShrdPrfns>(context, listen: false)
                    .chnageValue(true);
              },
              child: Text("make true"))
        ],
      ),
    );
  }
}
