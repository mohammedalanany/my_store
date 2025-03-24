import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/core/core/depindance_injection/locator_service.dart';
import 'package:mystore/features/auth/screens/cubit/auth_cubit.dart';

import '../../../store_main/presentation/screens/screens/widgets/custom_form_widgets.dart';
import '../cubit/auth_state.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login-screen';

  LoginScreen({super.key});

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
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is CheckUserError) {
                      // Show error message as a snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message,
                              style: TextStyle(color: Colors.white)),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else if (state is CheckUserLoaded) {
                      // Proceed to next screen if user check is successful
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                  builder: (context, state) {
                    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

                    return Form(
                      key: LocatorService.authCubit.formKey,
                      child: Column(
                        children: [
                          CustomTextFormField1(
                            labelText: "Phone Number or Email",
                            onChanged: (val) {
                              LocatorService.authCubit.loginFormEntity.value =
                                  val.toString();
                              LocatorService.authCubit.loginFormEntity.type =
                                  'email';
                            },
                            onFieldSubmitted: (_) {},
                          ),
                          SizedBox(height: 30),

                          // Display loading spinner while checking user
                          state is CheckUserLoading
                              ? CircularProgressIndicator()
                              : InkWell(
                                  onTap: () async {
                                    print('Button tapped, checking user...');
                                    await authCubit.checkUser(LocatorService
                                        .authCubit.loginFormEntity);
                                  },
                                  child: Container(
                                    height: 48,
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF037979),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Continue',
                                      style: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: .42,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Nunito',
                                      ),
                                    ),
                                  ),
                                ),

                          // Show "Continue" button when not loading

                          // Show error message below input field if error occurs
                          if (state is CheckUserError)
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(state.message,
                                  style: TextStyle(color: Colors.red)),
                            ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
