
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_exmple/Controller(Obs)/controller.dart';
import 'package:getx_exmple/homepage.dart';
import 'package:getx_exmple/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final HomeController controller=Get.put(HomeController());
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  late bool _obscurePassword;
  late bool _autovalidate;
   TextEditingController usernameController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  late bool username_validate = false;
   late bool password_validate = false;

  @override
  void initState() {
    super.initState();
    _obscurePassword = true;
    _autovalidate = false;
    usernameController = TextEditingController();
    passwordController = TextEditingController();
            // _loadCounter();

  }
  // void _loadCounter() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  //   log("isloggedin = " + isLoggedIn.toString());
  //   if (isLoggedIn) {
  //     Navigator.push(context, MaterialPageRoute(builder: (_) => MyHomePage()));
  //   }
  // }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
     body: Center(
     
      child:_buildLoginForm(),
     ),
     );
  }

  Widget _buildLoginForm() {
          

    return Form(
      key: _key,
    
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
                  'WELCOME BACK',
                  textAlign: TextAlign.center,
                  // style:
                  //     GoogleFonts.openSans(color: Colors.black, fontSize: 35,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  'Login with your username and password',
                  textAlign: TextAlign.center,
                  // style:
                  //     GoogleFonts.openSans(color: Colors.grey, fontSize: 18,fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),

            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Username',
                filled: true,
                isDense: true,
              ),
              controller: usernameController,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
               validator: (val) => _validateRequired(val!, 'Username'),

            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                filled: true,
                isDense: true,
              ),
              obscureText: _obscurePassword,
              controller: passwordController,
              validator: (val) => _validateRequired(val!, 'Password'),
            ),
            const SizedBox(
              height: 16,
            ),
             
          TextButton(
  onPressed: () async {
    final bool success = _key.currentState!.validate();
    if (success) {
      print('Form is valid');
      _key.currentState!.save();
      String username = usernameController.text;
      String password = passwordController.text;

      print("username = $username");
      print("password = $password");

      if (username.isNotEmpty && password.isNotEmpty) {
        
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("username", username);
        String sessionUsername = pref.getString("username").toString(); // Use null-aware operator to handle null case
        print(sessionUsername);
   

       controller.logindata(username, password).then((value){
        
        if (value==true) {
          Get.to(const MyHomePage(title: '',));
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Success"))); 
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => MyHomePage()),
          // );
        } else {
          // Show error message or handle unsuccessful login
           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Failed"))); 
          // print('login failed');
        }
      });
    }
    }
  },
  style: TextButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 1, 4, 36),
    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  ),
  child: const Text('Login'),
),


               Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Dont have an account?'),
                TextButton(
                  child: const Text(
                    'Go to Register',
                    style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 1, 4, 36)),
                    
                  ),
                  onPressed: () {
                            Get.to(const RegistrationPage());
                    //  Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //           RegistrationPage()));
                              
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
     }
            
  String? _validateRequired(String val, fieldName) {
    if (val == '') {
      return '$fieldName is required';
    }
    
    return null;
  }

  String? _validateEmail(String value) {
    if (value == '') {
      return 'Email is required';
    }
  

    var regex;
    if (!regex.hasMatch(value)) {
      return 'Enter valid email address';
    }
    return null;
  }

  void _validateFormAndLogin() {
    // Get form state from the global key
    var formState = _key.currentState;

    // check if form is valid
    if (formState!.validate()) {
      print('Form is valid');
    } else {
      // show validation errors
      // setState forces our [State] to rebuild
      setState(() {
        _autovalidate = true;
      });
    }
  }
}
