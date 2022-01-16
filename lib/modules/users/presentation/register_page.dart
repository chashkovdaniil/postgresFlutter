import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/users/domain/entities/auth_user.dart';
import 'package:postgresUn/modules/users/domain/entities/register_user.dart';
import 'package:postgresUn/modules/users/domain/user_manager.dart';
import 'package:postgresUn/modules/users/presentation/login_page.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static const route = 'register';

  @override
  Widget build(context, ref) {
    final userManager = ref.watch(UserProvider.userManager);
    final registerFormKey = GlobalKey<FormState>();
    final emailEditingController = useTextEditingController();
    final passwordEditingController = useTextEditingController();
    final nameEditingController = useTextEditingController();
    final lastNameEditingController = useTextEditingController();
    final patronymicEditingController = useTextEditingController();
    final phoneEditingController = useTextEditingController();
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          height: 400,
          child: Form(
            key: registerFormKey,
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
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Fill field';
                    }
                  },
                  controller: nameEditingController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Fill field';
                    }
                  },
                  controller: lastNameEditingController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    labelText: 'Last name',
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Fill field';
                    }
                  },
                  controller: patronymicEditingController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    labelText: 'Patronymic',
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Fill field';
                    }
                  },
                  controller: phoneEditingController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (registerFormKey.currentState?.validate() == true) {
                      try {
                        await userManager.register(
                          RegisterUser(
                            email: emailEditingController.text,
                            password: passwordEditingController.text,
                            lastName: lastNameEditingController.text,
                            name: nameEditingController.text,
                            patronymic: patronymicEditingController.text,
                            phone: 99,
                            photo: 'none',
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
                  child: const Text('Register'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, LoginPage.route);
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
