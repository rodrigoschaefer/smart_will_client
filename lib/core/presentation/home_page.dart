import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_will_client/core/util/size_utils.dart';
import 'package:smart_will_client/core/widgets/rounded_button.dart';
import 'package:web3dart/web3dart.dart';

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
                  text: 'acc1',
                  backgroundColor: Colors.amber,
                  borderRadius: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedButton(
                  text: 'acc2',
                  backgroundColor: Colors.amber,
                  borderRadius: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedButton(
                  text: 'acc3',
                  backgroundColor: Colors.amber,
                  borderRadius: 10,
                )
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var rng = Random.secure();
          Credentials random = EthPrivateKey.createRandom(rng);
          var address = await random.extractAddress();
          // ignore: avoid_print
          print(address.hex);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
