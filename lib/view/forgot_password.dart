import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resources/components/round_button.dart';
import '../view_model/auth_view_model.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                            Text('Forgot password?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: const [
                            Text("Don't worry! we got you",style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300
                            ),),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          maxLines: 1,
                          decoration:   InputDecoration(
                              prefixIcon: const Icon(Icons.alternate_email,
                                  color: Colors.grey),
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'Enter your email',
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
                        RoundButton(
                          loading: authViewModel.loading ,
                        onPress: (){},
                          title: 'Verify Email',
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
