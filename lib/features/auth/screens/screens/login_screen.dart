import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/core/core/depindance_injection/locator_service.dart';
import 'package:mystore/features/auth/domain/entities/login_form_entitiy.dart';
import 'package:mystore/features/auth/screens/cubit/auth_cubit.dart';

import '../../../store_main/presentation/screens/screens/widgets/custom_form_widgets.dart';
import '../cubit/auth_state.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login-screen';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});
  final LoginFormEntity loginFormEntity = LoginFormEntity();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    border: Border(
                        bottom: BorderSide(
                            color: const Color(0x29000000), width: 1)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 21,
                      ),
                      InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.clear,
                            color: const Color(0xFF000000),
                          )),
                      const SizedBox(
                        height: 29,
                      ),
                      Text(
                        'login Or Signup',
                        style: TextStyle(
                          fontSize: 24,
                          color: const Color(0xFF037979),
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Playfair',
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Form(
                  key: _formKey,
                  child: MyCustomInput(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    placeholder: "Phone Number or Email",
                    textInputAction: TextInputAction.done,
                    onChanged: (val) {
                      loginFormEntity.value = val.toString();
                      loginFormEntity.type = 'email';
                    },
                    onFieldSubmitted: (_) {},
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Send You AnActivation Code',
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: .4,
                      color: const Color(0x99000000),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
//

                ///
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is CheckUserError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                    } else if (state is CheckUserLoaded) {
                      print('User successfully checked!');
                      // Example navigation:
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                    }
                  },
                  builder: (context, state) {
                    if (state is CheckUserLoading) {
                      print('CheckUserLoading');
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }

                    if (state is CheckUserLoaded) {
                      print('CheckUserLoaded');
                      return _buildContinueButton(context, loginFormEntity);
                    }

                    return _buildContinueButton(context, loginFormEntity);
                  },
                ),

                ////

                const SizedBox(
                  height: 24,
                ),
                //  if (Provider.of<Auth>(context, listen: false).socialActive == 1)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        '${Localizations.localeOf(context).languageCode == 'en' ? 'Or' : 'أو'}',
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: .25,
                          color: const Color(0xDE000000),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildContinueButton(
    BuildContext context, LoginFormEntity loginFormEntity) {
  return InkWell(
    onTap: () {
      LocatorService.authCubit.checkUser(loginFormEntity);
    },
    child: Container(
      height: 48,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF037979),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: const Text(
        'Continue Word',
        style: TextStyle(
          fontSize: 14,
          letterSpacing: .42,
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontFamily: 'Nunito',
        ),
      ),
    ),
  );
}
