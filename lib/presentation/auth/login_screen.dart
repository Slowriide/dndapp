import 'package:dnd_app/common/widgets/general/my_button_large.dart';

import 'package:dnd_app/common/widgets/general/background.dart';
import 'package:dnd_app/data/models/auth/signing_user_req.dart';
import 'package:dnd_app/domain/usercases/auth/signin.dart';

import 'package:dnd_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/widgets/general/text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Background(
          image: 'assets/images/other-background.png',
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: IconButton(
                    onPressed: () {
                      if (!context.canPop()) return;
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),

                ///* Title
                SizedBox(height: size.height * 0.177),
                Center(
                  child: Image.asset(
                    'assets/images/dnd-logo-white.png',
                    fit: BoxFit.cover,
                    height: 80,
                  ),
                ),

                ///*
                const _LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: size.height * 0.25),
          Text('Login', style: textStyles.titleLarge),
          const SizedBox(height: 30),
          CustomTextFormField(
            label: 'Correo',
            keyboardType: TextInputType.emailAddress,
            controller: _email,
          ),
          const SizedBox(height: 35),
          CustomTextFormField(
            label: 'Contraseña',
            keyboardType: TextInputType.emailAddress,
            controller: _password,
          ),
          const SizedBox(height: 35),
          MyButtonLarge(
            color: const Color.fromARGB(255, 202, 45, 34),
            text: 'Login',
            height: 50,
            onTap: () async {
              var result = await sl<SigninUseCase>().call(
                params: SigningUserReq(
                  email: _email.text,
                  password: _password.text,
                ),
              );

              result.fold(
                (l) {
                  var snackBar = SnackBar(content: Text(l));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                (r) {
                  context.go('/home/0');
                },
              );
            },
          ),

          ///*
          const SizedBox(
            height: 35,
          ),
          const Divider(endIndent: 0),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¿No tienes cuenta?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(fontSize: 15),
                ),
                TextButton(
                  onPressed: () => context.push('/register'),
                  child: Text(
                    'Crea una aquí',
                    style: GoogleFonts.roboto(fontSize: 15),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
