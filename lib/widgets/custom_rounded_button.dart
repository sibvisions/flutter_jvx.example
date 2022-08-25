import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Icon icon;

  const CustomRoundedButton({
    required this.text,
    required this.icon,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(shape: BoxShape.circle),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          splashColor: Colors.orange,
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
