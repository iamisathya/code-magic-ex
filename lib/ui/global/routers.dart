import 'package:code_magic_ex/ui/screens/enroll/enroll.dart';
import 'package:code_magic_ex/ui/screens/enroll/screens/enroll_confirmation/home.dart';
import 'package:code_magic_ex/ui/screens/enroll/screens/order_complete/enroll_complete.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routers = [
  GetPage(
      name: '/enrollHome',
      page: () => EnrollHomeScreen(),
      transition: Transition.cupertino),
  GetPage(
      name: '/enrollConfirmation',
      page: () => EnrollConfirmation(),
      transition: Transition.cupertino),
  GetPage(
      name: '/enrollComplete',
      page: () => EnrollComplete(),
      transition: Transition.cupertino),
];
