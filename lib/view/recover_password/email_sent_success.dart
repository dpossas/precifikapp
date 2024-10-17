import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/consts/app_colors.dart';
import '../../core/consts/app_icons.dart';
import '../../core/extensions/build_context_ext.dart';
import '../../services/navigator_service.dart';
import '../components/ep_icon.dart';

class EmailSentSuccess extends StatelessWidget {
  const EmailSentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: 350,
      child: Column(
        children: [
          EPIcon(
            context.icon(OutlineIcons.badgeCheck),
            width: 58,
            height: 58,
          ),
          verticalDivider12,
          verticalDivider12,
          Text(
            'E-mail de recuperação enviado com suscesso!',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppColors.c23262F,
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.center,
          ),
          verticalDivider12,
          Text(
            'Acesse seu e-mail e clique no link que foi enviado para redefinir sua senha.',
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
                context.pop(NavigatorService.context);
              },
              child: const Text('Ok'),
            ),
          ),
        ],
      ),
    );
  }

  final verticalDivider12 = const SizedBox(height: 12);
}
