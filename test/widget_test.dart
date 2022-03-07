// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dsc_tools/di.dart';
import 'package:dsc_tools/modules/login/login_home/controller/login.controller.dart';
import 'package:dsc_tools/modules/login/login_home/login_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockGetStorage extends Mock implements GetStorage {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GetStorage g;

  const channel = MethodChannel('plugins.flutter.io/path_provider');
  void setUpMockChannels(MethodChannel channel) {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getApplicationDocumentsDirectory') {
        return '.';
      }
    });
  }

  setUpAll(() async {
    setUpMockChannels(channel);
  });

  setUp(() async {
    await GetStorage.init();
    g = GetStorage();
    await g.erase();
  });
  
  // await GetStorage.init();
  Widget makeTestableWidget({required Widget child}) {
    return GetMaterialApp(
      home: child,
    );
  }

  final LoginController _loginController = LoginController();
  final MockBuildContext _mockContext = MockBuildContext();

  testWidgets("email password is empty, don't signIn",
      (WidgetTester tester) async {
    // await DenpendencyInjection().dependencies();
    const bool didSignIn = false;

    final LoginScreen loginScreen = LoginScreen();

    await tester.pumpWidget(makeTestableWidget(child: loginScreen));
    await tester.tap(find.byKey(const Key("login_button_key")));

    verifyNever(_loginController.onPressContinue(_mockContext));
    expect(didSignIn, false);
  });
}
