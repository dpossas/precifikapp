import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/consts/app_colors.dart';
import '../../core/consts/app_icons.dart';
import '../../core/consts/app_images.dart';
import '../../core/extensions/build_context_ext.dart';
import '../../core/routes/auth/routes.dart';
import '../components/app_button.dart';
import 'components/indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  double _currentPage = 0;
  final _pageController = PageController();

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  void toLogin() => Navigator.pushNamedAndRemoveUntil(
        context,
        AuthRoutes.auth,
        (route) => false,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.zero,
            child: PageView(
              onPageChanged: (page) => setState(() {
                _currentPage = page.toDouble();
              }),
              controller: _pageController,
              children: [
                _firstPage(context),
                _midlePage(context),
                _lastPage(context),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height > 800 ? 60 : 30.0,
                  right: 24.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: Colors.transparent,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  foregroundColor: Colors.transparent,
                ),
                onPressed: () {
                  toLogin();
                },
                child: SizedBox(
                  width: 60,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Pular',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: 0.02,
                          color: AppColors.c23262F,
                          fontFamily: 'PlusJakartaSans',
                        ),
                      ),
                      const SizedBox(width: 8),
                      SvgPicture.asset(
                        context.icon(
                          OutlineIcons.chevronRight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40, left: 24, right: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Indicator(isCurrent: _currentPage == 0),
                        Indicator(isCurrent: _currentPage == 1),
                        Indicator(isCurrent: _currentPage == 2),
                      ],
                    ),
                  ),
                  AppButton(
                    suffixIcon: _currentPage == 2
                        ? SolidIcons.play
                        : SolidIcons.arrowSmRight,
                    labelText: _currentPage < 2 ? 'Próximo' : 'Iniciar',
                    onPressed: _currentPage < 2
                        ? () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          }
                        : _currentPage == 2
                            ? () {
                                toLogin();
                              }
                            : null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _firstPage(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Adjustments for smaller screens
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        final smallFontSize = width < 380 ? 12.0 : 14.0;
        const logoHeight = 50.0;
        final EdgeInsets padding = width < 380
            ? const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0)
            : const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 32.0);

        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(-0.20, -0.8),
                    colors: [
                      Color.fromRGBO(255, 138, 148, 1.0),
                      AppColors.primary250
                    ],
                    radius: 0.6,
                  ),
                ),
                child: Padding(
                  padding: padding,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  ),
                ),
              ),
              Positioned.fill(
                top: MediaQuery.of(context).size.height * 0.23,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: Colors.white,
                        ),
                        child: const SizedBox(width: double.infinity),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    const Spacer(),
                    SvgPicture.asset(
                      context.icon(
                        AppIcons.iconOnboarding1,
                        uniqueInTheme: true,
                      ),
                      height: logoHeight,
                    ),
                    SizedBox(height: width < 380 ? 22.0 : 32.0),
                    Text(
                      'Aumente\nSeus Ganhos',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: AppColors.c23262F,
                                letterSpacing: -0.3,
                                fontFamily: 'WorkSans',
                              ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                      child: Text(
                        'Ao precificar seus produtos de forma eficaz,\nvocê estará um passo mais perto de definir e\nalcançar sua meta mensal e mudar de vida.',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: smallFontSize,
                              fontWeight: FontWeight.w400,
                              color: AppColors.c4F5159,
                              letterSpacing: -0.2,
                              fontFamily: 'WorkSans',
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    _bottomSpacer(context),
                  ],
                ),
              ),
              Positioned(
                top: height < 670 ? 35 : height / 9,
                left: width < 395
                    ? MediaQuery.of(context).size.width * 0.1
                    : MediaQuery.of(context).size.width * 0.155,
                child: Image(
                  image: AssetImage(AppImages.onboarding1),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _midlePage(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Adjustments for smaller screens
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        final smallFontSize = width < 380 ? 12.0 : 14.0;
        const iconSize = 32.0;

        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image(
                  image: AssetImage(AppImages.onboarding2),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Positioned.fill(
                top: height * 0.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: Colors.white,
                        ),
                        child: const SizedBox(width: double.infinity),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: height * 0.50,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      context.icon(OutlineIcons.sparkles),
                      width: iconSize,
                      height: iconSize,
                    ),
                    SizedBox(height: width < 380 ? 22.0 : 32.0),
                    Text(
                      'Facilidade\nde Uso',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: AppColors.c23262F,
                                letterSpacing: -0.3,
                                fontFamily: 'WorkSans',
                              ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                      child: Text(
                        'Nossa interface simples e intuitiva torna o\nprocesso de precificação tão fácil quanto\nassar um bolo 😋',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: smallFontSize,
                              fontWeight: FontWeight.w400,
                              color: AppColors.c4F5159,
                              letterSpacing: -0.2,
                              fontFamily: 'WorkSans',
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.20428,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _lastPage(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Adjustments for smaller screens
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        final smallFontSize = width < 380 ? 12.0 : 14.0;
        const iconSize = 32.0;

        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image(
                  image: AssetImage(AppImages.onboarding3),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Positioned.fill(
                top: height * 0.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: Colors.white,
                        ),
                        child: const SizedBox(width: double.infinity),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: height * 0.50,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      context.icon(OutlineIcons.currencyDollar),
                      width: iconSize,
                      height: iconSize,
                    ),
                    SizedBox(height: width < 380 ? 22.0 : 32.0),
                    Text(
                      'Transparência\nFinanceira',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: AppColors.c23262F,
                                letterSpacing: -0.3,
                                fontFamily: 'WorkSans',
                              ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                      child: Text(
                        'Com a Precifika, você terá total clareza sobre\nseus custos e lucros, permitindo que você\ntome decisões financeiras mais assertivas.',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: smallFontSize,
                              fontWeight: FontWeight.w400,
                              color: AppColors.c4F5159,
                              letterSpacing: -0.2,
                              fontFamily: 'WorkSans',
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.20428,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _bottomSpacer(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.24428,
      );
}
