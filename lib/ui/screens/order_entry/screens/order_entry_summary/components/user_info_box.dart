import 'package:flutter/material.dart';

class UserInfoBox extends StatelessWidget {
  const UserInfoBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(20),
      color: const Color(0xff76e5de),
      child: Row(
        children: const [
          TitleBox(title: "108357166"),
          SizedBox(width: 10),
          Expanded(child: TitleBox(title: "Patthiraya sdfsdfsdfsdfsdfsdf")),
        ],
      ),
    );
  }
}

class TitleBox extends StatelessWidget {
  const TitleBox({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: const Color(0xfff5f5f5),
      ),
      child: Text(
        title,
        overflow: TextOverflow.fade,
        softWrap: false,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: const Color(0xFF505050)),
      ),
    );
  }
}
