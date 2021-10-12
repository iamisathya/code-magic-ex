import 'package:flutter/material.dart';

class ShareButton extends StatefulWidget {
  final VoidCallback onPress;

  const ShareButton({Key? key, required this.onPress}) : super(key: key);

  @override
  _ShareButtonState createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  bool isOpen = false;

  void _toggleShare() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.fastOutSlowIn,
          width: isOpen ? 144 : 40,
          height: 40,
          decoration: const ShapeDecoration(
            color: Color(0xFFFFBF3A),
            shape: StadiumBorder(),
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Color(0xFFFFBF3A),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _toggleShare(),
          ),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 450),
          opacity: isOpen ? 1 : 0,
          child: Container(
              width: 144,
              height: 40,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 25),
              child: GestureDetector(
                onTap: () => widget.onPress(),
                child: Text("Add New PO",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: const Color(0xFF000000))),
              )),
        ),
      ],
    );
  }
}
