import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_app/core/utils/dialog/confirm_dialog.dart';
import 'package:ecommerce_app/core/utils/dialog/exit_dialog.dart';
import 'package:ecommerce_app/core/utils/flutter_toast.dart';
import 'package:ecommerce_app/core/utils/local_auth.dart';
import 'package:ecommerce_app/core/validetor/app_validetor.dart';
import 'package:ecommerce_app/core/view_model/login_user_view_model.dart';
import 'package:ecommerce_app/core/view_model/register_user_view_model.dart';
import 'package:ecommerce_app/screen/constant/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    addressController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: SingleChildScrollView(
          child: GetBuilder<RegisterUserViewModel>(
            builder: (registerController) => Container(
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
                                  'Signup Now'.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.green,
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
                                  controller: nameController,
                                  keyboardType: TextInputType.text,
                                  textCapitalization: TextCapitalization.words,
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
                                      hintText: "Full Name"),
                                ),
                                SizedBox(
                                  height: 10,
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
                                          Icons.phone,
                                          size: 30,
                                          color: AppColors.green,
                                        ),
                                      ),
                                      hintText: "Type Mobile"),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: addressController,
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
                                          Icons.location_on,
                                          size: 30,
                                          color: AppColors.green,
                                        ),
                                      ),
                                      hintText: "Address"),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: passwordController,
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
                                          Icons.vpn_key,
                                          size: 30,
                                          color: AppColors.green,
                                        ),
                                      ),
                                      hintText: "Password"),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: confirmPasswordController,
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
                                          Icons.vpn_key,
                                          size: 30,
                                          color: AppColors.green,
                                        ),
                                      ),
                                      hintText: "Confirm Password"),
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
                                          print('ok');
                                          if (_formKey.currentState!
                                              .validate()) {
                                            await registerController
                                                .registerUserMethod(
                                                    name: nameController.text,
                                                    phone:
                                                        mobileController.text,
                                                    password:
                                                        passwordController.text,
                                                    address:
                                                        addressController.text,
                                                    confirmPassword:
                                                        confirmPasswordController
                                                            .text);
                                          }

                                          if (registerController
                                                  .registerUserModel.success !=
                                              null) {
                                            FlutterToastCustom.showSuccessToast(
                                                message:
                                                    'Registration successfully completes.');

                                            Future.delayed(Duration(seconds: 2),
                                                () {
                                              Navigator.pop(context);
                                              nameController.clear();
                                              mobileController.clear();
                                              passwordController.clear();
                                              addressController.clear();
                                              confirmPasswordController.clear();
                                            });
                                          }
                                          if (registerController
                                                  .registerUserModel.error !=
                                              null) {
                                            if (registerController
                                                    .registerUserModel
                                                    .error
                                                    ?.phone
                                                    ?.length !=
                                                null) {
                                              FlutterToastCustom.showErrorToast(
                                                  message: registerController
                                                      .registerUserModel
                                                      .error
                                                      ?.phone
                                                      ?.first);
                                            } else
                                            // (registerController
                                            //       .registerUserModel
                                            //       .error
                                            //       ?.password
                                            //       ?.length !=
                                            //   null)
                                            {
                                              FlutterToastCustom.showErrorToast(
                                                  message: registerController
                                                      .registerUserModel
                                                      .error
                                                      ?.password
                                                      ?.first);
                                            }
                                          }
                                        },
                                        child: Text(
                                          'Register'.toUpperCase(),
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
      ),
    );
  }
}
