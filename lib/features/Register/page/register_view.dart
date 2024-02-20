import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/widgets/custom_text_field.dart';
import 'package:todo_app/features/setting_provider.dart';

class RegisterView extends StatelessWidget {
  static const String route_name = "Register";
  var formkey=GlobalKey<FormState>();
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var confirmPasswordController=TextEditingController();

   RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<SettingProvider>(context);
    return Container(
      decoration: BoxDecoration(
          color: (vm.current_theme == ThemeMode.light)
              ? const Color(0XFFDFECDB)
              : const Color(0xFF060E1E),
          image: const DecorationImage(
              image: AssetImage("assets/images/auth_pattern.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            "Create Account",
            style: theme.textTheme.titleLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Text('Full Name',
                      style: (vm.current_theme == ThemeMode.light)
                          ? theme.textTheme.bodyMedium!
                              .copyWith(color: Colors.black)
                          : theme.textTheme.bodyMedium),
                  CustomTextField(
                    controller:nameController ,
                      keyboardType: TextInputType.emailAddress,
                      hint: "Enter your Full Name",
                      hintColor: (vm.current_theme == ThemeMode.light)
                          ? Colors.black45
                          : Colors.white54,
                      suffixWidget: Icon(
                        Icons.person,
                        color: (vm.current_theme == ThemeMode.light)
                            ? Colors.grey.shade700
                            : theme.primaryColor,
                      ),
                      onValidate: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "you must enter your name";
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('E-mail',
                      style: (vm.current_theme == ThemeMode.light)
                          ? theme.textTheme.bodyMedium!
                              .copyWith(color: Colors.black)
                          : theme.textTheme.bodyMedium),
                  CustomTextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    hint: "Enter your e-mail address",
                    hintColor: (vm.current_theme == ThemeMode.light)
                        ? Colors.black45
                        : Colors.white54,
                    suffixWidget: Icon(
                      Icons.email_rounded,
                      color: (vm.current_theme == ThemeMode.light)
                          ? Colors.grey.shade700
                          : theme.primaryColor,
                    ),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Enter Your e-mail address";
                      }
                      var regex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (!regex.hasMatch(value)) {
                        return "Invalid e-mail address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Password',
                      style: (vm.current_theme == ThemeMode.light)
                          ? theme.textTheme.bodyMedium!
                              .copyWith(color: Colors.black)
                          : theme.textTheme.bodyMedium),
                  CustomTextField(
                    controller: passwordController,
                    isPassword: true,
                    maxLines: 1,
                    hint: "Enter your password",
                    hintColor: (vm.current_theme == ThemeMode.light)
                        ? Colors.black45
                        : Colors.white54,
                    suffixWidget: Icon(
                      Icons.email_rounded,
                      color: (vm.current_theme == ThemeMode.light)
                          ? Colors.grey.shade700
                          : theme.primaryColor,
                    ),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "you must enter your password !";
                      }
                      var regex = RegExp(
                          r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$");
                      if (!regex.hasMatch(value)) {
                        return "The password must include at least \n* one lowercase letter, \n* one uppercase letter, \n* one digit, \n* one special character,\n* at least 8 characters long.";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Confirm Password',
                      style: (vm.current_theme == ThemeMode.light)
                          ? theme.textTheme.bodyMedium!
                              .copyWith(color: Colors.black)
                          : theme.textTheme.bodyMedium),
                  CustomTextField(
                    controller: confirmPasswordController,
                    isPassword: true,
                    maxLines: 1,
                    hint: "Enter your Confirm password",
                    hintColor: (vm.current_theme == ThemeMode.light)
                        ? Colors.black45
                        : Colors.white54,
                    suffixWidget: Icon(
                      Icons.email_rounded,
                      color: (vm.current_theme == ThemeMode.light)
                          ? Colors.grey.shade700
                          : theme.primaryColor,
                    ),
                    onValidate: (value) {
                      if(value==null||value.trim().isEmpty)
                        return "You must enter your password !";
                      if (value != passwordController.text)
                        return "Password not matched";
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if(formkey.currentState!.validate()){
                          print("validate done");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 40)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Create Account",
                            style: theme.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          Icon(Icons.arrow_forward_outlined)
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
