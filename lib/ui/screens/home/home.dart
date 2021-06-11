import 'package:code_magic_ex/ui/global/navigation_drawer.dart';
import 'package:code_magic_ex/ui/global/theme/bloc.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class MainHomeScreen extends StatefulWidget {
  static const String routeName = '/mainHomePage';

  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 100, 0, 100),
      items: [
        const PopupMenuItem<Widget>(
          child: ListTile(
            leading: IconButton(
              onPressed: null,
              icon: Icon(Icons.language_outlined),
            ),
            title: Text("English"),
            // onTap: showPopup,
          ),
        ),
        const PopupMenuItem<Widget>(
          child: ListTile(
            leading: IconButton(
              onPressed: null,
              icon: Icon(Icons.language_outlined),
            ),
            title: Text("Thai"),
            // onTap: showPopup,
          ),
        )
      ],
      elevation: 8.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tile = new ListTile(
      title: new Text('Doge or lion?'),
      trailing: GestureDetector(
        onTapDown: (TapDownDetails details) {
          _showPopupMenu(context);
        },
        child: Container(child: Text("Press Me")),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.mode_night_outlined,
              ),
              tooltip: 'Theme selector',
              onPressed: () => themeBloc.toggleThemeMode,
            ),
            IconButton(
              icon: const Icon(
                Icons.translate_outlined,
              ),
              tooltip: 'Theme selector',
              onPressed: () => _showPopupMenu(context),
            ),
          ],
        ),
        drawer: NavigationDrawer(),
        body: Center());
  }
}
