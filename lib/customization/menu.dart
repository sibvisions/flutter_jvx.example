import 'package:flutter/material.dart';
import 'package:flutter_jvx/flutter_jvx.dart';

class ExampleMenu extends StatelessWidget {
  final MenuModel menuModel;
  final MenuItemCallback onClick;
  final bool grouped;
  final bool sticky;
  final bool groupOnlyOnMultiple;

  const ExampleMenu(
    this.menuModel,
    this.onClick,
    this.grouped,
    this.sticky,
    this.groupOnlyOnMultiple, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Theme.of(context).colorScheme.inversePrimary),
        GridMenu(
          menuModel: menuModel,
          onClick: onClick,
          grouped: grouped,
          sticky: sticky,
          groupOnlyOnMultiple: groupOnlyOnMultiple,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
      ],
    );
  }
}
