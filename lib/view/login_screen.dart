import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resources/components/round_button.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  ValueNotifier<bool> obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/Rectangle 21.png'),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Text('Hey,Welcome Back!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: const [
                            Text('Login to your account',style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300
                            ),),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          controller: emailController,
                          maxLines: 1,
                          decoration:   InputDecoration(
                              prefixIcon: const Icon(Icons.alternate_email,
                                  color: Colors.grey),
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'Enter your username',
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.circular(10))

                          ),
                        ),
                        const SizedBox(height: 10,),
                        ValueListenableBuilder(
                            valueListenable: obsecurePassword,
                            builder: (context, value, child){
                              return TextFormField(
                                focusNode: passwordFocusNode,
                                obscureText: obsecurePassword.value,
                                obscuringCharacter: '*',
                                controller: passwordController,
                                decoration: InputDecoration(
                                    fillColor: Colors.grey.shade100,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.grey.shade200),
                                        borderRadius: BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.grey.shade200),
                                        borderRadius: BorderRadius.circular(10)),
                                    hintText: 'Enter your password',
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: InkWell(
                                        onTap: (){
                                          obsecurePassword.value = ! obsecurePassword.value!;
                                        },
                                        child: obsecurePassword.value? const Icon(Icons.visibility_off):
                                        const Icon(Icons.visibility)
                                    )

                                ),

                              );
                            }

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed: (){
                              Navigator.pushNamed(context, RoutesName.forgot);
                            },
                                child: const Text('Forgot password?',style: TextStyle(
                                    decoration: TextDecoration.underline
                                ),))
                          ],
                        ),
                        RoundButton(
                            loading: authViewModel.loading,
                            onPress: (){
                              if(emailController.text.isEmpty){
                                Utils.snackBar('please enter email', context);
                              }
                              else if(passwordController.text.isEmpty){
                                Utils.snackBar('please enter password', context);
                              }
                              else if(passwordController.text.length<6){
                                Utils.snackBar('please enter six digit password', context);
                              }
                              else{
                                Map data ={
                                  'email': emailController.text.toString(),
                                  'password': passwordController.text.toString()
                                };
                                authViewModel.loginApi(data,context);
                              }
                            },
                            title: 'Login'),
                        const SizedBox(height: 15,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? "),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).pushNamed(RoutesName.signup);
                              },
                              child: const Text('Register',style:
                              TextStyle(color: Colors.blue,
                                fontStyle: FontStyle.italic
                              ),),
                            ),
                          ],
                        )

                      ],
                    ),
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
