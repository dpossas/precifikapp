import 'package:flutter/material.dart';

import '../../core/injections/injections.dart';
import '../../flavors.dart';
import '../../models/user.dart';
import '../../services/secure_storage_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;
  final localStorage = di.get<ISecureStorageService>();

  bool loading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<void> loadData() async {
    user = await localStorage.getLoggedUser();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              leading: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: CircleAvatar(
                    radius: 18,
                    foregroundImage: NetworkImage(
                      user?.avatar != null
                          ? '${F.baseUrl}${user?.avatar?.substring(1)}'
                          : 'https://yt3.googleusercontent.com/jarJThMuH7UxfKq67Q1LWFgpkrGbXmWTNsxAsprV-8YGHQUsNqiBPBD3WpmirLkWbi_BbwkDuA=s900-c-k-c0x00ffffff-no-rj',
                    ),
                  ),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                  ),
                ),
              ],
              title: Text(user?.customerName ?? 'Olá'),
            ),
            body: const Placeholder(),
          );
  }
}
