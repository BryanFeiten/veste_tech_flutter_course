import 'package:flutter/material.dart';

class LoadingStateLayerWidget extends StatelessWidget {
  const LoadingStateLayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: .max,
        mainAxisAlignment: .center,
        children: [Center(child: CircularProgressIndicator())],
      ),
    );
  }
}
