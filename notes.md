Get.offUntil(GetPageRoute(page: () => D()), (route) => (route as GetPageRoute).routeName == B.routeName);

Get.close(2);

Navigator.pushAndRemoveUntil(context, D.routeName, (route) => false)(
    context,
    MaterialPageRoute(
       settings: RouteSettings(name: "/a"),
       builder: (BuildContext context) => D()),
    );

final selectedSearchIndex = Rxn<int>();