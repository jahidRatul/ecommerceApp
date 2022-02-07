import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_app/core/utils/dialog/confirm_dialog.dart';
import 'package:ecommerce_app/core/utils/dialog/exit_dialog.dart';
import 'package:ecommerce_app/core/utils/flutter_toast.dart';
import 'package:ecommerce_app/core/utils/local_auth.dart';
import 'package:ecommerce_app/core/validetor/app_validetor.dart';
import 'package:ecommerce_app/core/view_model/login_user_view_model.dart';
import 'package:ecommerce_app/screen/constant/app_colors.dart';
import 'package:ecommerce_app/screen/register_page/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ForgotPage extends StatefulWidget {
  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 0),
                          color: Colors.black12)
                    ], color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                'Forgot password'.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.green,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Please Write Your Phone Number',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: mobileController,
                                validator: (value) =>
                                    AppValidTor.isEmpty(value!),
                                decoration: InputDecoration(
                                    isDense: true,
                                    fillColor: Color(0xffedf2fb),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 32.0),
                                    ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.person,
                                        size: 30,
                                        color: AppColors.green,
                                      ),
                                    ),
                                    hintText: "Enter Mobile"),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.blue, // foreground
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Login Now?'),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary:
                                              AppColors.green, // background
                                          onPrimary: Colors.white,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 80,
                                              vertical: 10) // foreground
                                          ),
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          // await loginController.signInMethod(
                                          //     name: nameController.text,
                                          //     password:
                                          //     passwordController.text);
                                        }
                                      },
                                      child: Text(
                                        'Submit'.toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 6,
                          color: AppColors.deepBlueTextColor,
                        ),
                      ],
                    ),
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
