import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final ValueNotifier<bool> isLightTheme = ValueNotifier(true);

  void setTheme(bool isLightTheme) {
    this.isLightTheme.value = isLightTheme;
  }

  @override
  void dispose() {
    isLightTheme.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final elements = [MyClass('1')];

    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: elements.length,
          itemBuilder: (_, index) {
            final item = elements[index];

            return MyListTile(
              key: ValueKey(item.uid),
              title: 'any title',
              child: item,
            );
          },
        ),
      ),
    );
  }
}

class MyListTile extends StatefulWidget {
  final String title;
  final MyClass child;

  const MyListTile({required this.title, required this.child, super.key});

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  late final MyClass myClass;

  @override
  void initState() {
    super.initState();

    myClass = widget.child;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(widget.title));
  }
}

class MyClass {
  final String uid;

  MyClass(this.uid);
  // Várias props
}
