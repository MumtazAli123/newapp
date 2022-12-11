import 'package:flutter/material.dart';
import 'package:newapp/screens/login_screen/login_screen.dart';
import 'package:newapp/widgets/custom_button.dart';
import 'package:newapp/widgets/input_ui.dart';

class SigningScreen extends StatefulWidget {
  const SigningScreen({Key? key}) : super(key: key);

  @override
  State<SigningScreen> createState() => _SigningScreenState();
}

class _SigningScreenState extends State<SigningScreen> {

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
              decoration: UIConfig().inputDecoration('Name', "Enter Name", Icons.person,
                  null, () { })),
            const SizedBox(height: 20,),
            TextFormField(
              decoration: UIConfig().inputDecoration('Email', 'Enter Email', Icons.email, null, () { })),
            const SizedBox(height: 20,),
            TextFormField(
              decoration: UIConfig().inputDecoration('Phone', 'Phone', Icons.phone_iphone, null, () { }),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              decoration: UIConfig().inputDecoration('Password', 'Password', Icons.lock, Icons.visibility, () { }),),
            const SizedBox(height: 20,),
            CustomButtonScreen(buttonText: 'Signing', onPressed: (){}, icon: Icons.person)
          ],
        ),
      ),
    );
  }
}
