
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/widgets/custom_text_field.dart';
import 'package:todo_app/features/Register/page/register_view.dart';
import 'package:todo_app/features/setting_provider.dart';

class LoginView extends StatelessWidget {
  static const route_name="Login";
  var formkey=GlobalKey<FormState>();
   LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context).size;
    var theme=Theme.of(context);
    var vm=Provider.of<SettingProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color:(vm.current_theme==ThemeMode.light)?Color(0XFFDFECDB):Color(0xFF060E1E),
        image: DecorationImage(
          image: AssetImage("assets/images/auth_pattern.png"),
          fit: BoxFit.fill
        )
      ),
      child: Scaffold(
        backgroundColor:Colors.transparent,
        appBar: AppBar(
          title: Text("Login",style: theme.textTheme.titleLarge,),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 120,),
                  Text("Welcome back!",style:(vm.current_theme==ThemeMode.light)? theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ):theme.textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                  )),
                  SizedBox(height: 10,),
                  Text('E-mail',style: (vm.current_theme==ThemeMode.light)?theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.black
                  ):theme.textTheme.bodyMedium),
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    hint: "Enter your e-mail address",
                    hintColor: (vm.current_theme==ThemeMode.light)?Colors.black45:Colors.white54,
                    suffixWidget: Icon(Icons.email_rounded,color:(vm.current_theme==ThemeMode.light)? Colors.grey.shade700:theme.primaryColor,),
                    onValidate: (value){
                      if(value==null||value.trim().isEmpty){
                        return "enter Your mail address";}
                        var regex = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (!regex.hasMatch(value)) {
                          return "Invalid e-mail address";
                        }
                        return null;
                    },
                  ),
                  SizedBox(height: 10,),
                  Text('Password',style: (vm.current_theme==ThemeMode.light)?theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.black
                  ):theme.textTheme.bodyMedium),
                  CustomTextField(
                    isPassword: true,
                    maxLines: 1,
                    hint: "Enter your password",
                    hintColor: (vm.current_theme==ThemeMode.light)?Colors.black45:Colors.white54,
                    suffixWidget: Icon(Icons.email_rounded,color:(vm.current_theme==ThemeMode.light)? Colors.grey.shade700:theme.primaryColor,),
                    onValidate: (value) {
                      if(value==null||value.trim().isEmpty){
                        return "Enter Your Password";
                      }
                      return null;

                    },
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: () {
                    if(formkey.currentState!.validate()){
                      print("validate done");
                    }
                  }, style:ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40)
                  ),child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Login",style: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 17
                      ),),
                      Icon(Icons.arrow_forward_outlined)
                    ],

                  )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("OR",
                        textAlign: TextAlign.center,
                        style: (vm.current_theme==ThemeMode.light)?theme.textTheme.bodyLarge!.copyWith(color: Colors.black,fontWeight: FontWeight.bold):theme.textTheme.bodyLarge,
                        ),
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, RegisterView.route_name);
                      },
                          child:Text("create new account !..",
                              style: (vm.current_theme==ThemeMode.light)?theme.textTheme.bodyLarge!.copyWith(color: Colors.black,fontWeight: FontWeight.bold):theme.textTheme.bodyLarge,
                              textAlign: TextAlign.center)
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
