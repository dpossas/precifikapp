import 'package:flutter/material.dart';

import '../../../core/consts/app_images.dart';
import '../../../services/navigator_service.dart';

class EpAppBar extends StatelessWidget implements PreferredSize {
  const EpAppBar({super.key});

  @override
  Widget build(BuildContext context) => child;

  @override
  Widget get child => Stack(
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
                      const SizedBox(height: 24),
                      Text(
                        'Olá! 👋',
                        style: Theme.of(NavigatorService.context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Dê um passo adiante na sua jornada!\nEntre e acesse a sua conta :)',
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

  @override
  Size get preferredSize => const Size(double.maxFinite, 160);
}
