
import 'package:flutter/material.dart';
import 'package:newapp/widgets/custom_button.dart';
import 'package:newapp/widgets/input_ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar(){
    return AppBar(
      title: const Text('Login'),
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
          children: [
            TextFormField(
              decoration: UIConfig().inputDecoration('Email', 'Email ', Icons.email, null, () { }),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              decoration: UIConfig().inputDecoration('Password', 'Password', Icons.lock, Icons.visibility, () { }),
            ),
            const SizedBox(height: 20,),
            CustomButtonScreen(buttonText: 'Login', onPressed: (){}, icon: Icons.lock)
          ],
        ),
      ),
    );
  }
}
