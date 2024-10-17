import 'package:flutter/material.dart';

import '../../services/navigator_service.dart';
import 'components/create_account_app_bar.dart';
import 'pages/create_account_individual_page.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CreateAccountAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              verticalDivider12,
              verticalDivider12,
              const CreateAccountIndividualPage(),
              // const CreateAccountCompanyPage(),
              SizedBox(
                height: MediaQuery.of(NavigatorService.context).padding.bottom,
              ),
            ],
          ),
        ),
      ),
    );
  }

  final verticalDivider12 = const SizedBox(height: 12);
}
