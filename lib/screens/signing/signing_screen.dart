import 'package:flutter/material.dart';
import 'package:newapp/models/userprofile_model.dart';
import 'package:newapp/screens/login_screen/login_screen.dart';
import 'package:newapp/services/http_services.dart';
import 'package:newapp/widgets/custom_button.dart';
import 'package:newapp/widgets/input_ui.dart';

class SigningScreen extends StatefulWidget {
  const SigningScreen({Key? key}) : super(key: key);

  @override
  State<SigningScreen> createState() => _SigningScreenState();
}

class _SigningScreenState extends State<SigningScreen> {
  UserProfileModel authCustomerUser = UserProfileModel();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),

    );
  }

  _buildAppBar(){
    return AppBar(
      title: const Text('My App Bar'),

      actions: [
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
        }, icon: const Icon(Icons.lock),),
        const Icon(Icons.more_vert),

      ],
    );
  }
  _buildBody(){
    return Center(
      child: Container(
        width: 350,
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            TextFormField(
              controller: _nameController,
              decoration: UIConfig().inputDecoration('Name', "Enter Name", Icons.person,
                  null, () { })),
            const SizedBox(height: 20,),
            TextFormField(
              controller: _emailController,
              decoration: UIConfig().inputDecoration('Email', 'Enter Email', Icons.email, null, () { })),
            const SizedBox(height: 20,),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _phoneController,
              decoration: UIConfig().inputDecoration('Phone', 'Phone', Icons.phone_iphone, null, () { }),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: _passwordController,
              decoration: UIConfig().inputDecoration('Password', 'Password', Icons.lock, Icons.visibility, togglePassword),),
            const SizedBox(height: 20,),
            CustomButtonScreen(
                buttonText: 'Signing', onPressed: (){
                  AuthService().Signup(
                      _nameController.text,
                      _emailController.text,
                      _phoneController.text,
                      _passwordController.text,
                      _confirmPassword.text, context);
            }, icon: Icons.person)
          ],
        ),
      ),
    );
  }
  void togglePassword(){
    _obscureText = !_obscureText;
    setState(() {

    });

  }
}
