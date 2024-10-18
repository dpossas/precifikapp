import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/consts/app_colors.dart';
import '../../../core/consts/app_icons.dart';
import '../../../core/extensions/build_context_ext.dart';
import '../../../core/routes/auth/routes.dart';
import '../../../core/validators/password_validator.dart';
import '../../components/ep_icon.dart';
import '../../components/ep_label.dart';
import '../../components/password_form.dart';
import '../components/policy_terms.dart';

class CreateAccountCompanyPage extends StatefulWidget {
  const CreateAccountCompanyPage({super.key});

  @override
  State<CreateAccountCompanyPage> createState() =>
      _CreateAccountCompanyPageState();
}

class _CreateAccountCompanyPageState extends State<CreateAccountCompanyPage> {
  final _companyName = TextEditingController();
  final _documentController = TextEditingController();
  final _addressController = TextEditingController();
  final _zipcodeController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _siteController = TextEditingController();
  final _socialController = TextEditingController();

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
                    'Adicionar imagem do logotipo',
                    style: TextStyle(color: AppColors.c5961FF),
                  ),
                )
              ],
            ),
          ),
          verticalDivider12,
          const EPLabel('Nome da enoresa'),
          TextFormField(
            controller: _companyName,
            decoration: const InputDecoration(
              hintText: 'Ex: Confeitaria doce sonho',
            ),
          ),
          verticalDivider12,
          const EPLabel('CNPJ'),
          TextFormField(
            controller: _documentController,
            decoration: const InputDecoration(
              hintText: 'Ex: 99.999.999.9999/99',
            ),
          ),
          verticalDivider12,
          const EPLabel('Endereço'),
          TextFormField(
            controller: _addressController,
            decoration: const InputDecoration(
              hintText: 'Ex: Rua, número, bairro, cidade, estado',
            ),
          ),
          verticalDivider12,
          const EPLabel('CEP'),
          TextFormField(
            controller: _zipcodeController,
            decoration: const InputDecoration(
              hintText: 'Insira o CEP',
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
          const EPLabel('E-mail'),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: 'EX: confeitariadocesonho@gmail.com',
            ),
          ),
          verticalDivider12,
          const EPLabel('Website'),
          TextFormField(
            controller: _siteController,
            decoration: const InputDecoration(
              hintText: 'Ex: Confeiteira',
            ),
          ),
          verticalDivider12,
          const EPLabel('Redes sociais'),
          TextFormField(
            controller: _socialController,
            decoration: const InputDecoration(
              hintText: 'Ex: @Confeiteiradocesonho',
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
          PolicyTerms(
            selected: false,
            onChanged: (_) {},
          ),
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
