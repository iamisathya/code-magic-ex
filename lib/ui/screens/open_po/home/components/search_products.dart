import 'package:dsc_tools/ui/screens/open_po/controller/openpo.search.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchProducts extends StatefulWidget {
  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchProducts> {
  OpenPoSearchController controller = Get.put(OpenPoSearchController());

  Widget appBarTitle = const Text("AppBar Title");
  Icon actionIcon = const Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false, title: appBarTitle, actions: <Widget>[
        IconButton(
          icon: actionIcon,
          onPressed: () {
            setState(() {
              if (actionIcon.icon == Icons.search) {
                actionIcon = const Icon(Icons.close);
                appBarTitle = Transform(
                    transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                    child: TextField(
                      controller: controller.searchTextController,
                      style: const TextStyle(
                          color: Color(0xFF9EA9B9), fontSize: 14),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9EA9B9)),
                          ),
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Find Products...",
                          suffixIcon: GestureDetector(
                            onTap: () => controller.addSearchItem(
                                controller.searchTextController.text),
                            child: const Icon(Icons.search),
                          ),
                          hintStyle: const TextStyle(
                              color: Color(0xFF9EA9B9), fontSize: 14)),
                    ));
              } else {
                actionIcon = const Icon(Icons.search);
                appBarTitle = const Text("AppBar Title");
              }
            });
          },
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              color: const Color(0xFFF5F5F5),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Search History",
                      style: TextStyle(fontSize: 14, color: Color(0xFF000000)),
                    ),
                    GestureDetector(
                      onTap: () => controller.clearHistory(),
                      child: const Text(
                        "Clear all",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFFFE5D7C)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Obx(() => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.searchHistory.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: GestureDetector(
                      onTap: () => controller.searchOrder(controller.searchHistory[index]),
                      child: Text(controller.searchHistory[index],
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: const Color(0xFF606975))),
                    ),
                  );
                })),
          ],
        ),
      ),
    );
  }
}
