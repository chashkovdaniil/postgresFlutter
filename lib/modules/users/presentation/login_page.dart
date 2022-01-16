import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/users/domain/entities/auth_user.dart';
import 'package:postgresUn/modules/users/domain/user_manager.dart';
import 'package:postgresUn/modules/users/presentation/register_page.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const route = 'login';

  @override
  Widget build(context, ref) {
    final userManager = ref.watch(UserProvider.userManager);
    final loginFormKey = GlobalKey<FormState>();
    final emailEditingController = useTextEditingController();
    final passwordEditingController = useTextEditingController();
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          height: 400,
          child: Form(
            key: loginFormKey,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                mainAxisExtent: 50,
              ),
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Fill field';
                    }
                  },
                  controller: emailEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Fill field';
                    }
                  },
                  controller: passwordEditingController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (loginFormKey.currentState?.validate() == true) {
                      try {
                        await userManager.login(
                          AuthUser(
                            email: emailEditingController.text,
                            password: passwordEditingController.text,
                          ),
                        );
                      } catch (err) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(err.toString()),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, RegisterPage.route);
                  },
                  child: const Text('Create profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
