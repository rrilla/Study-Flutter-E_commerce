import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/constant/app_icons.dart';
import '../../../../core/theme/custom/custom_app_bar.dart';
import '../../../../core/theme/custom/custom_font_weight.dart';
import '../../cubit/mall_type_cubit.dart';
import 'widgets/svg_icon_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          color: state.theme.backgroundColor,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        (Radius.circular(CustomAppBarTheme.tabBarRadius))),
                    color: state.theme.containerColor),
                child: SizedBox(
                  height: 28,
                  child: DefaultTabController(
                    length: MallType.values.length,
                    child: TabBar(
                      onTap: (index) =>
                          context.read<MallTypeCubit>().changeIndex(index),
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(CustomAppBarTheme.tabBarRadius)),
                          color: state.theme.indicatorColor),
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: state.theme.labelColor,
                      labelStyle: Theme.of(context).textTheme.labelLarge.bold,
                      labelPadding: EdgeInsets.symmetric(horizontal: 12),
                      dividerColor: Colors.transparent,
                      unselectedLabelColor: state.theme.unselectedLabelColor,
                      unselectedLabelStyle:
                          Theme.of(context).textTheme.labelLarge,
                      splashBorderRadius: BorderRadius.all(
                          Radius.circular(CustomAppBarTheme.tabBarRadius)),
                      tabs: List.generate(
                        MallType.values.length,
                        (index) => Tab(
                          text: MallType.values[index].toName,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              leadingWidth: 86,
              leading: SvgIconButton(
                  icon: AppIcons.mainLogo,
                  padding: 8,
                  color: state.theme.logoColor),
              actions: [
                SvgIconButton(
                    icon: AppIcons.location,
                    color: state.theme.iconColor),
                SvgIconButton(
                    icon: AppIcons.cart,
                    color: state.theme.iconColor),
              ],
            ),
          ),
        );
      },
    );
  }
}
