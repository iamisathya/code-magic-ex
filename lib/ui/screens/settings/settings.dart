import 'package:code_magic_ex/ui/global/widgets/transparent_app_bar.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = '/settings';

  String dropdownValue = 'One';

  List<String> spinnerItems = ['One', 'Two', 'Three', 'Four', 'Five'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteSmokeColor,
        appBar: const TransAppBar(
          title: "Settings",
          
        ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: const Text(
                "Dark Mode",
              ),
              subtitle: const Text(
                "Enable dark mode",
              ),
              trailing: CupertinoSwitch(
                value: true,
                onChanged: (value) {
                  print(value);
                },
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                "Current Language",
              ),
              subtitle: const Text(
                "App language - TH",
              ),
              trailing: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 36,
                elevation: 16,
                underline: Container(
                  height: 0,
                ),
                onChanged: (value) {
                  // setState(() {
                  //   dropdownValue = value!;
                  // });
                },
                items:
                    spinnerItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
