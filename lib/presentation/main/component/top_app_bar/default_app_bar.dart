import 'package:flutter/material.dart';

import '../../cubit/bottom_nav_cubit.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({super.key, required this.bottomNav});

  final BottomNav bottomNav;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return PreferredSize(
      preferredSize: Size.fromHeight(44),
      child: Container(
        color: theme.primary,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              bottomNav.toName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
