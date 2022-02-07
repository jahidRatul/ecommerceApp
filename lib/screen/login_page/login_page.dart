import 'package:ecommerce_app/core/utils/flutter_toast.dart';
import 'package:ecommerce_app/core/validetor/app_validetor.dart';
import 'package:ecommerce_app/core/view_model/login_user_view_model.dart';
import 'package:ecommerce_app/screen/constant/app_colors.dart';
import 'package:ecommerce_app/screen/forgot_page/forgot_page.dart';
import 'package:ecommerce_app/screen/register_page/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: SingleChildScrollView(
          child: GetBuilder<LoginUserViewModel>(
            builder: (loginController) => Container(
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
                          //
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  'Login Now'.toUpperCase(),
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
                                  controller: phoneController,
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
                                          Icons.vpn_key_sharp,
                                          size: 30,
                                          color: AppColors.green,
                                        ),
                                      ),
                                      hintText: "Type password"),
                                ),
                                SizedBox(
                                  height: 20,
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
                                          if (_formKey.currentState!
                                              .validate()) {
                                            await loginController.signInMethod(
                                                phone: phoneController.text,
                                                password:
                                                    passwordController.text);
                                            if (loginController
                                                    .loginUserModel.token !=
                                                null) {
                                              phoneController.clear();
                                              passwordController.clear();
                                            }
                                            if (loginController
                                                    .loginUserModel.error !=
                                                null) {
                                              FlutterToastCustom.showErrorToast(
                                                  message: loginController
                                                      .loginUserModel.error);
                                            }
                                          }
                                        },
                                        child: Text(
                                          'Login'.toUpperCase(),
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
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Colors.blue, // foreground
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegisterPage()));
                                      },
                                      child: Text('Don\'t have Account?'),
                                    ),
                                    Text('OR'),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        primary: Colors.blue, // foreground
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgotPage()));
                                      },
                                      child: Text('Forgot Password?'),
                                    ),
                                  ],
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
