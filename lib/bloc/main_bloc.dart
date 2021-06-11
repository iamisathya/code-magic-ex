import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MainStreamBuilder extends StatelessWidget {
  @override
  const MainStreamBuilder(
      {required this.themeBloc,
      required this.translationBloc,
      required this.builder});

  final Stream themeBloc;
  final Stream translationBloc;
  final Widget Function(BuildContext) builder;

  @override
  Widget build(BuildContext context) => StreamBuilder(
      stream: Rx.combineLatest2(
          themeBloc, translationBloc, (b1, b2) => b1 != null || b2 != null),
      builder: (context, snapshot) => builder(context));
}
