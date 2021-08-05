import 'package:code_magic_ex/utilities/enums.dart';
import 'package:flutter/material.dart';

class CounterView extends StatelessWidget {
  const CounterView({
    required this.quantity,
    required this.itemCode,
    required this.onPress,
  }) : super();
  final int quantity;
  final String itemCode;
  final Function(CartUpdate, String) onPress;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
          FloatingActionButton(
            onPressed: () => onPress(CartUpdate.decreament, itemCode),
            mini: true,
            heroTag: "${itemCode}_minus",
            backgroundColor: Colors.white,
            child: const Text("-",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800)),
          ),
          Text('$quantity', style: const TextStyle(fontSize: 18.0)),
          FloatingActionButton(
            onPressed: () => onPress(CartUpdate.increament, itemCode),
            mini: true,
            heroTag: "${itemCode}_plus",
            backgroundColor: Colors.white,
            child: const Text("+",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800)),
          ),
        ]));
  }
}
