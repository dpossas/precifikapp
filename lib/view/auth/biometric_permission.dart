import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:precificapp/core/routes/auth/routes.dart';

import '../../core/consts/app_colors.dart';
import '../../core/consts/app_icons.dart';
import '../../core/extensions/build_context_ext.dart';
import '../../services/navigator_service.dart';
import 'components/ep_icon.dart';

class BiometricPermission extends StatelessWidget {
  const BiometricPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: 380,
      child: Column(
        children: [
          EPIcon(
            context.icon(OutlineIcons.faceId),
            width: 58,
            height: 58,
            color: AppColors.c979797,
          ),
          verticalDivider12,
          verticalDivider12,
          Text(
            'Ativar biometria?',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppColors.c23262F,
                  fontWeight: FontWeight.w600,
                ),
          ),
          verticalDivider12,
          Text(
            'Deseja ativar a biometria nos próximos acessos em sua conta?',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.c4F5159,
                  fontWeight: FontWeight.normal,
                  height: 1.6,
                ),
            textAlign: TextAlign.center,
          ),
          verticalDivider12,
          verticalDivider12,
          verticalDivider12,
          SizedBox(
            width: double.maxFinite,
            height: 58,
            child: ElevatedButton(
              onPressed: () {
                context.go(AuthRoutes.loggedAccountChoose);
              },
              child: const Text('Ativar biometria'),
            ),
          ),
          verticalDivider12,
          SizedBox(
            width: double.maxFinite,
            height: 58,
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Colors.white,
                ),
              ),
              onPressed: () {
                context.pop(NavigatorService.context);
              },
              child: const Text(
                'Não ativar',
                style: TextStyle(
                  color: AppColors.primary250,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final verticalDivider12 = const SizedBox(height: 12);
}
