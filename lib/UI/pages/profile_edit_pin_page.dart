import 'package:ewallet_app/blocs/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/shared_methods.dart';
import '../../shared/theme.dart';
import '../widgets/buttons.dart';
import '../widgets/forms.dart';

class ProfileEditPinPage extends StatefulWidget {
  const ProfileEditPinPage({super.key});

  @override
  State<ProfileEditPinPage> createState() => _ProfileEditPinPageState();
}

class _ProfileEditPinPageState extends State<ProfileEditPinPage> {
  final TextEditingController oldPinController =
      TextEditingController(text: '');
  final TextEditingController newPinController =
      TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit PIN")),
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

          if( state is AuthLoading){
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
                          title: "Old Pin",
                          controller: oldPinController,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomFormField(
                          title: "New PIN",
                          controller: newPinController,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomFilledButton(
                          title: "Update Now",
                          onPressed: () {
                            context.read<AuthBloc>().add(AuthUpdatePin(
                                oldPinController.text,
                                newPinController.text));
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
