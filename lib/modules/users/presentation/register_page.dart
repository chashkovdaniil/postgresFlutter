import 'dart:io';
import 'dart:convert' show ascii, latin1, utf8;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:postgres/postgres.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/core/services/photo_service.dart';
import 'package:postgresUn/main.dart';
import 'package:postgresUn/modules/users/domain/entities/register_user.dart';
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
    final avatarFile = useState<File?>(null);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          height: 400,
          child: Form(
            key: registerFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FormField<File>(
                    initialValue: avatarFile.value,
                    validator: (val) {
                      if (val == null) {
                        return 'Заполните поле!';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      avatarFile.value = val;
                    },
                    builder: (state) {
                      return Column(
                        children: [
                          CircleAvatar(
                            foregroundImage: avatarFile.value == null
                                ? null
                                : Image.file(
                                    avatarFile.value!,
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.fill,
                                  ).image,
                            child: const Icon(Icons.photo),
                          ),
                          if (state.hasError) Text("Выберите фотографию!"),
                          TextButton(
                            onPressed: () async {
                              final result =
                                  await FilePicker.platform.pickFiles(
                                dialogTitle: 'Выберите фото',
                                allowedExtensions: ['jpg', 'png', 'jpeg'],
                                type: FileType.image,
                              );
                              if (result != null) {
                                for (final element in result.files) {
                                  final photo =
                                      File.fromUri(Uri(path: element.path));
                                  state
                                    ..didChange(photo)
                                    ..save();
                                }
                              }
                            },
                            child: const Text('Выберите фото'),
                          ),
                        ],
                      );
                    },
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Заполните поле!';
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
                        return 'Заполните поле!';
                      }
                    },
                    controller: passwordEditingController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: 'Пароль',
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Заполните поле!';
                      }
                    },
                    controller: nameEditingController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: 'Имя',
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Заполните поле!';
                      }
                    },
                    controller: lastNameEditingController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: 'Фамилия',
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Заполните поле!';
                      }
                    },
                    controller: patronymicEditingController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: 'Отчество',
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Заполните поле!';
                      }
                    },
                    controller: phoneEditingController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Номер телефона',
                      hintText: '89080003428',
                    ),
                    maxLength: 11,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]*'))
                    ],
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        if (registerFormKey.currentState?.validate() == true) {
                          final photo =
                              await PhotoService().savePhoto(avatarFile.value!);
                          await userManager.register(
                            RegisterUser(
                              email: emailEditingController.text,
                              password: passwordEditingController.text,
                              lastName: lastNameEditingController.text,
                              name: nameEditingController.text,
                              patronymic: patronymicEditingController.text,
                              phone: int.parse(phoneEditingController.text),
                              photo: photo,
                            ),
                          );

                          Navigator.pushReplacementNamed(
                            context,
                            MainPage.route,
                          );
                        }
                      } on PostgreSQLException catch (err) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: SelectableText(
                              utf8.decode(
                                latin1.encode(
                                  err.message ?? 'Error',
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text('Создать'),
                  ),
                  // ElevatedButton(
                  //   child: Text('Generate user'),
                  //   onPressed: () async {
                  //     for (int i = 0; i < 10; i++) {
                  //       var email = generateEmail();
                  //       var lastName = generateWord(10);
                  //       var name = generateWord(10);
                  //       var patronymic = generateWord(10);
                  //       var phone = 99;
                  //       var password = generateWord(12);
                  //       var photo = File.fromUri(
                  //         Uri(
                  //           path:
                  //               '/home/daniil/.local/share/postgres/photos/325159056-2022-01-26 10:43:08.673600.png',
                  //         ),
                  //       );
                  //       var user = RegisterUser(
                  //         email: email,
                  //         password: password,
                  //         lastName: lastName,
                  //         name: name,
                  //         patronymic: patronymic,
                  //         phone: phone,
                  //         photo: photo,
                  //       );
                  //       await userManager.register(user);
                  //     }
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(
                  //         content: Text('Done'),
                  //       ),
                  //     );
                  //   },
                  // ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, LoginPage.route);
                    },
                    child: const Text('Войти'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
