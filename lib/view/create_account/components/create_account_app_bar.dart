import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/consts/app_icons.dart';
import '../../../core/extensions/build_context_ext.dart';
import '../../components/ep_icon.dart';

import '../../../core/consts/app_images.dart';
import '../../../services/navigator_service.dart';

class CreateAccountAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  const CreateAccountAppBar({super.key});

  @override
  State<CreateAccountAppBar> createState() => _CreateAccountAppBarState();

  @override
  Size get preferredSize => const Size(double.maxFinite, 220);
}

class _CreateAccountAppBarState extends State<CreateAccountAppBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topLeft,
              radius: 3,
              colors: [
                Color(0xff81451C),
                Color(0xff50280C),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(NavigatorService.context).padding.top,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    OutlinedButton.icon(
                      onPressed: () => context.pop(),
                      icon: EPIcon(
                        context.icon(OutlineIcons.chevronLeft),
                      ),
                      label: const Text('Voltar'),
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        'Criar sua conta',
                        style: Theme.of(NavigatorService.context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Falta pouco para você alcançar os seus objetivos profissionais e financeiros',
                      style: Theme.of(NavigatorService.context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                            color: Colors.white,
                            height: 1.6,
                          ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              )
            ],
          ),
        ),
        Align(
          widthFactor: 1,
          heightFactor: 0.1,
          child: Image.asset(
            AppImages.breads,
            scale: .2,
          ),
        ),
      ],
    );
  }
}
