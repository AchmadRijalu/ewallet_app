import 'package:ewallet_app/blocs/bloc/auth_bloc.dart';
import 'package:ewallet_app/models/user_edit_form_model.dart';
import 'package:ewallet_app/shared/shared_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/theme.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final TextEditingController userNameController =
      TextEditingController(text: '');
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      userNameController.text = authState.user.username!;
      nameController.text = authState.user.name!;
      emailController.text = authState.user.email!;
      passwordController.text = authState.user.password!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile")),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AuthFailed) {
            showCustomSnacKbar(context, state.e.toString());
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/profile-edit-success', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFormField(
                          title: "Username",
                          controller: userNameController,
                        ),

                        SizedBox(
                          height: 16,
                        ),

                        CustomFormField(
                          title: "Full name",
                          controller: nameController,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        //NOTE: EMAIL INPUT
                        CustomFormField(
                          title: "Email Address",
                          controller: emailController,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomFormField(
                          title: "Password",
                          controller: passwordController,
                          obscureText: true,
                        ),

                        SizedBox(
                          height: 30,
                        ),

                        CustomFilledButton(
                          title: "Update Now",
                          onPressed: () {
                            context.read<AuthBloc>().add(AuthUpdateUser(
                                UserEditFormModel(
                                    name: nameController.text,
                                    username: userNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text)));
                          },
                        ),
                      ],
                    )),
              ]);
        },
      ),
    );
  }
}
