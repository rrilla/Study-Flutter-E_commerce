import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/custom/custom_theme.dart';
import '../../cubit/bottom_nav_cubit.dart';
import '../../cubit/mall_type_cubit.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({super.key, required this.bottomNav});

  final BottomNav bottomNav;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return BlocBuilder<MallTypeCubit, MallType>(
      builder: (context, state) {
        return PreferredSize(
          preferredSize: Size.fromHeight(44),
          child: Container(
            color: state.isMarket? theme.primary : theme.background,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: AppBar(
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: Text(
                  bottomNav.toName,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: state.isMarket? theme.background : theme.contentPrimary,
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
