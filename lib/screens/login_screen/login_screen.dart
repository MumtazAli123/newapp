import 'package:flutter/material.dart';
import 'package:newapp/models/userprofile_model.dart';
import 'package:newapp/services/http_services.dart';
import 'package:newapp/services/provider.dart';
import 'package:newapp/widgets/custom_button.dart';
import 'package:newapp/widgets/input_ui.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserProfileModel? authCustomerUser = UserProfileModel();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('Login'),
    );
  }

  _buildBody() {
    return Center(
      child: Container(
        width: 350,
        margin: const EdgeInsets.all(10),
        child: ChangeNotifierProvider<ProviderTextField>(
          create: (context)=> ProviderTextField(),
          child: Consumer<ProviderTextField>(
            builder: (context, provider, child){
              return  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(provider.eligibilityMessage.toString(), style: TextStyle(
                    color: (provider.isEligible == true)? Colors.green: Colors.red,
                  ),),
                  const SizedBox(
                    height: 60,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    // controller: _emailController,
                    decoration: UIConfig()
                        .inputDecoration('Age', 'Enter Age ', Icons.person, Icons.favorite_outlined, () {}),
                    onChanged: (val){
                      provider.checkEligibility(int.parse(val));
                    },
                  ),


                  const SizedBox(
                    height: 50,
                  ),

                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: UIConfig()
                        .inputDecoration('Email', 'Email ', Icons.email, null, () {}),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _passwordController,
                    obscureText: _obscureText,
                    decoration: UIConfig().inputDecoration(
                        'Password', 'Password', Icons.lock, Icons.visibility, togglePassword),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButtonScreen(
                      buttonText: 'Login', onPressed: () {
                        AuthService().Login(
                            _emailController.text, _passwordController.text, context);
                  }, icon: Icons.lock)
                ],
              );
            },
          ),
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
