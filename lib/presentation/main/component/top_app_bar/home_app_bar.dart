import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/constant/app_icons.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      color: theme.primary,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'tabBar',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          leadingWidth: 86,
          leading: Padding(
            padding: EdgeInsets.all(8.0),
            child: SvgPicture.asset(AppIcons.mainLogo),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(4.0),
              child: SvgPicture.asset(
                AppIcons.location,
                colorFilter:
                    ColorFilter.mode(theme.background, BlendMode.srcIn),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: SvgPicture.asset(
                AppIcons.cart,
                colorFilter:
                    ColorFilter.mode(theme.background, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
