import 'package:flutter/material.dart';
import 'package:precificapp/core/extensions/build_context_ext.dart';
import 'package:precificapp/view/components/ep_icon.dart';

import '../../../core/consts/app_colors.dart';
import '../../../core/consts/app_icons.dart';
import '../../../services/navigator_service.dart';

class LoggedAccountComponent extends StatelessWidget {
  const LoggedAccountComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.cE9E9EA,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: const CircleAvatar(),
        title: Text(
          'Eduardo',
          style:
              Theme.of(NavigatorService.context).textTheme.titleSmall?.copyWith(
                    color: AppColors.secondary500,
                    fontWeight: FontWeight.w600,
                  ),
        ),
        subtitle: Text(
          'eduardo@orbi.design',
          style:
              Theme.of(NavigatorService.context).textTheme.bodySmall?.copyWith(
                    color: AppColors.c4F5159,
                  ),
        ),
        trailing: EPIcon(
          context.icon(OutlineIcons.faceId),
          color: Colors.black,
        ),
      ),
    );
  }

  final verticalDivider12 = const SizedBox(height: 12);
}
