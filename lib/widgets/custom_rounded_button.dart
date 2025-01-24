import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  final Function()? onTap;
  final Icon icon;
  final Widget text;
  final Color? color;

  const CustomRoundedButton({
    super.key,
    this.onTap,
    this.color,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(shape: BoxShape.circle),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: onTap != null ? (color ?? Theme.of(context).colorScheme.primary) : Colors.grey.shade300,
        child: InkWell(
          onTap: onTap,
          child: IconTheme(
            data: IconTheme.of(context).copyWith(
              color: onTap != null ? Theme.of(context).colorScheme.onPrimary : Colors.grey.shade500,
            ),
            child: DefaultTextStyle(
              style: TextStyle(color: onTap != null ? Theme.of(context).colorScheme.onPrimary : Colors.grey.shade500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  text,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
