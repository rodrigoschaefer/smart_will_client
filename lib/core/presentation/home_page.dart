import 'package:flutter/material.dart';
import 'package:smart_will_client/core/util/size_utils.dart';
import 'package:smart_will_client/core/widgets/rounded_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    SizeUtils.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundedButton(
                  text: 'Owned Wills',
                  backgroundColor: Colors.amber,
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedButton(
                  text: 'Recipient Wills',
                  backgroundColor: Colors.amber,
                )
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
