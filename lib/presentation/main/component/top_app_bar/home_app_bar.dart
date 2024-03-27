import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/constant/app_icons.dart';
import '../../../../core/theme/custom/custom_theme.dart';
import '../../cubit/mall_type_cubit.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return BlocBuilder<MallTypeCubit, MallType>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          color: (state.isMarket) ? theme.primary : theme.background,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: DefaultTabController(
                length: MallType.values.length,
                child: TabBar(
                  onTap: (index) =>
                      context.read<MallTypeCubit>().changeIndex(index),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  tabs: List.generate(
                    MallType.values.length,
                    (index) => Tab(
                      text: MallType.values[index].toName,
                    ),
                  ),
                ),
              ),
              leadingWidth: 86,
              leading: Padding(
                padding: EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  AppIcons.mainLogo,
                  colorFilter: ColorFilter.mode(
                      state.isMarket ? theme.onPrimary : theme.primary,
                      BlendMode.srcIn),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    AppIcons.location,
                    colorFilter: ColorFilter.mode(
                        state.isMarket
                            ? theme.background
                            : theme.contentPrimary,
                        BlendMode.srcIn),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    AppIcons.cart,
                    colorFilter: ColorFilter.mode(
                        state.isMarket
                            ? theme.background
                            : theme.contentPrimary,
                        BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
