import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resources/components/round_button.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  ValueNotifier<bool> obsecurePassword = ValueNotifier<bool>(true);
  ValueNotifier<bool> obsecureConfirmPassword = ValueNotifier<bool>(true);
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

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
    obsecureConfirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
            child: Column(
              children: [
                Image.asset('assets/images/Rectangle 21.png'),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text('Hey,Welcome',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: const [
                          Text('Create new account',style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300
                          ),),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        controller: usernameController,
                        maxLines: 1,
                        decoration:   InputDecoration(
                            prefixIcon: const Icon(Icons.person,
                                color: Colors.grey),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'username',
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
                      TextFormField(
                        controller: emailController,
                        maxLines: 1,
                        decoration:   InputDecoration(
                            prefixIcon: const Icon(Icons.alternate_email,
                                color: Colors.grey),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'email',
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
                      TextFormField(
                        maxLength: 10,
                        controller: phonenumberController,
                        maxLines: 1,
                        decoration:   InputDecoration(
                          counterText: '',
                            prefixIcon: const Icon(Icons.phone_android,
                                color: Colors.grey),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'phone number',
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
                                  hintText: 'password',
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
                      const SizedBox(height: 10,),
                      ValueListenableBuilder(
                          valueListenable: obsecureConfirmPassword,
                          builder: (context, value, child){
                            return TextFormField(
                              focusNode: passwordFocusNode,
                              obscureText: obsecureConfirmPassword.value,
                              obscuringCharacter: '*',
                              controller: confirmpasswordController,
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
                                  hintText: 'confirm password',
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: InkWell(
                                      onTap: (){
                                        obsecureConfirmPassword.value = ! obsecureConfirmPassword.value!;
                                      },
                                      child: obsecureConfirmPassword.value? const Icon(Icons.visibility_off):
                                      const Icon(Icons.visibility)
                                  )

                              ),

                            );
                          }

                      ),
                      const SizedBox(height: 10,),
                      RoundButton(
                          loading: authViewModel.loading,
                          onPress: (){
                            if(usernameController.text.isEmpty){
                              Utils.snackBar('please enter username', context);
                            }
                            else if(emailController.text.isEmpty){
                              Utils.snackBar('please enter email', context);
                            }
                            if(phonenumberController.text.isEmpty){
                              Utils.snackBar('please enter phone number', context);
                            }
                            else if(passwordController.text.isEmpty){
                              Utils.snackBar('please enter password', context);
                            }
                            else if(passwordController.text.length<6){
                              Utils.snackBar('please enter six digit password', context);
                            }
                            else{
                              Map data ={
                                'name': usernameController.text.toString(),
                                'email': emailController.text.toString(),
                                'phone' : phonenumberController.toString(),
                                'password': confirmpasswordController.text.toString()
                              };
                              authViewModel.signupApi(data, context);
                            }
                          },
                          title: 'Register'),
                      const Padding(
                        padding: EdgeInsets.only(top: 20,bottom: 5),
                        child: Text('or'),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account? "),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).popAndPushNamed(RoutesName.login);
                            },
                            child: const Text('Login',style:
                            TextStyle(color: Colors.blue,
                                fontStyle: FontStyle.italic
                            ),),
                          ),

                        ],
                      ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
