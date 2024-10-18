import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/consts/app_colors.dart';
import '../../../core/consts/app_icons.dart';
import '../../../core/extensions/build_context_ext.dart';
import '../../../services/navigator_service.dart';
import '../../components/ep_icon.dart';

class CreateAccountErrorModal extends StatelessWidget {
  const CreateAccountErrorModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: 340,
      child: Column(
        children: [
          EPIcon(
            context.icon(SolidIcons.shieldExclamation),
            width: 58,
            height: 58,
            color: AppColors.cF12838,
          ),
          verticalDivider12,
          verticalDivider12,
          Text(
            'Ocorreu um erro!',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppColors.c23262F,
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.center,
          ),
          verticalDivider12,
          Text(
            'Não foi possível criar sua conta no momento. Tente novamente mais tarde ou entre em contato com o suporte.',
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
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Colors.white,
                ),
              ),
              onPressed: () {
                context.pop(NavigatorService.context);
              },
              child: const Text(
                'Voltar',
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
