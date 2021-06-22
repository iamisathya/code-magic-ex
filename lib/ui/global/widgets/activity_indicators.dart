import 'package:flutter/material.dart';

class ActivityIndicator extends StatelessWidget {
  final Stream<bool> loadingStream;
  final bool showBackDrop;

  const ActivityIndicator(
      {required this.loadingStream, this.showBackDrop = false});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: loadingStream,
      builder: (context, snapshot) {
        final bool? isLoading = snapshot.hasData ? snapshot.data : false;
        if (isLoading == false) return Container();

        return AbsorbPointer(
          child: Container(
            color: showBackDrop ? Colors.black38 : Colors.transparent,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              color: Colors.blueAccent,
            ),
          ),
        );
      },
    );
  }
}
