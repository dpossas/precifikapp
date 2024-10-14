import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:precificapp/core/consts/app_icons.dart';
import 'package:precificapp/core/extensions/build_context_ext.dart';
import 'package:precificapp/core/validators/password_validator.dart';
import 'package:precificapp/view/components/ep_icon.dart';
import 'package:precificapp/view/components/ep_label.dart';
import 'package:precificapp/view/components/password_form.dart';
import 'package:precificapp/view/create_account/components/policy_terms.dart';

import '../../../core/consts/app_colors.dart';
import '../../../core/routes/auth/routes.dart';

class CreateAccountIndividualPage extends StatefulWidget {
  const CreateAccountIndividualPage({super.key});

  @override
  State<CreateAccountIndividualPage> createState() =>
      _CreateAccountIndividualPageState();
}

class _CreateAccountIndividualPageState
    extends State<CreateAccountIndividualPage> {
  final _fullnameController = TextEditingController();
  final _documentController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _sectorController = TextEditingController();

  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  final _passwordValidator = PasswordValidator();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(
                  width: 110,
                  height: 110,
                  child: CircleAvatar(),
                ),
                verticalDivider12,
                TextButton.icon(
                  icon: EPIcon(
                    context.icon(OutlineIcons.pencilAlt),
                    color: AppColors.c5961FF,
                  ),
                  onPressed: () {},
                  label: const Text(
                    'Adicionar foto',
                    style: TextStyle(color: AppColors.c5961FF),
                  ),
                )
              ],
            ),
          ),
          verticalDivider12,
          const EPLabel('Nome completo'),
          TextFormField(
            controller: _fullnameController,
            decoration: const InputDecoration(
              hintText: 'Seu nome completo',
            ),
          ),
          verticalDivider12,
          const EPLabel('CPF'),
          TextFormField(
            controller: _documentController,
            decoration: const InputDecoration(
              hintText: 'Seu CPF',
            ),
          ),
          verticalDivider12,
          const EPLabel('E-mail'),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: 'exemplo@gmail.com',
            ),
          ),
          verticalDivider12,
          const EPLabel('Telefone'),
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(
              hintText: 'Seu telefone com DDD',
            ),
          ),
          verticalDivider12,
          const EPLabel('Ramo'),
          TextFormField(
            controller: _sectorController,
            decoration: const InputDecoration(
              hintText: 'Ex: Confeiteira',
            ),
          ),
          verticalDivider12,
          PasswordForm(
            passwordController: _passwordController,
            passwordConfirmationController: _passwordConfirmationController,
            passwordValidator: _passwordValidator,
            onValidate: () {
              setState(() {});
            },
          ),
          verticalDivider12,
          const PolicyTerms(),
          verticalDivider40,
          SizedBox(
            width: double.maxFinite,
            height: 58,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Cadastrar'),
            ),
          ),
          verticalDivider12,
          SizedBox(
            width: double.maxFinite,
            height: 58,
            child: ElevatedButton.icon(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Colors.white,
                ),
              ),
              onPressed: () {
                context.push(AuthRoutes.auth);
              },
              icon: EPIcon(
                context.icon(OutlineIcons.logout),
                color: AppColors.primary250,
                quarterTurns: 2,
              ),
              label: const Text(
                'Fazer login',
                style: TextStyle(
                  color: AppColors.primary250,
                ),
              ),
              iconAlignment: IconAlignment.end,
            ),
          )
        ],
      ),
    );
  }

  final verticalDivider12 = const SizedBox(height: 12);
  final verticalDivider40 = const SizedBox(height: 40);
}
