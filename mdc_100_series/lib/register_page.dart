import 'package:flutter/material.dart';
import 'colors.dart';
import 'services/database_services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  // final DatabaseCredentials _databaseService = DatabaseCredentials.instance;
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account", style: TextStyle(color: coconutWhite)),
        backgroundColor: jungleGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            Column(
              children: <Widget>[
                Image.asset('assets/gorilla.png', width: 125, height: 125),
                const SizedBox(height: 16.0),
                const Text('Sign up', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center
                ),
              ],
            ),

            const Text(
              "Create an account",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 100),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter your Full Name',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: inkBlack,),
                ),

                const SizedBox(height: 8),

                TextField(
                  controller: _nameController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration( 
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    label: const Center(child: Text('First & Last', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: jungleGreen,),)),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter your Email',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                TextField(
                  controller: _emailController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration( 
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    label: const Center(child: Text('Gorilla@gmail.com', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: jungleGreen,),)),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter your Username',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                TextField(
                  controller: _usernameController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true, 
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    label: const Center(child: Text('Username', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: jungleGreen,),)),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
          
              ],
            ),

            const SizedBox(height: 15),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create your Password',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                TextField(
                  controller: _passwordController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration( 
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    label: const Center(child: Text('Password', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: jungleGreen,),)),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),



            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     elevation: 5.0,
            //     padding: const EdgeInsets.symmetric(vertical: 16,),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(16),
            //     ),
            //   ),
            //   onPressed: () async{
            //     // TODO: handle registration logic later
            //     final fullname = _nameController.text.trim();                
            //     final email    = _emailController.text.trim();                
            //     final username = _usernameController.text.trim();
            //     final password = _passwordController.text.trim();

            //     final db = await DatabaseCredentials.database;

            //     await  DatabaseCredentials.insertUser(db, fullname, email, username, password);
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text("Account Created!")),
            //     );
            //     Navigator.pop(context);
            //   },
            //   child: const Text(
            //     "CREATE ACCOUNT",
            //     style: TextStyle(fontSize: 18, color: inkBlack),
            //   ),
            // ),
         ElevatedButton(
  style: ElevatedButton.styleFrom(
    elevation: 5.0,
    padding: const EdgeInsets.symmetric(vertical: 16,),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),
  onPressed: () async {
    final fullname = _nameController.text.trim();
    final email    = _emailController.text.trim();
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (fullname.isEmpty || email.isEmpty || username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    try {
      final db = await DatabaseCredentials.database;

      await DatabaseCredentials.insertUser(db, fullname, email, username, password);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account Created!")),
      );

      Navigator.pop(context);
    } catch (e, stacktrace) {
      debugPrint('Registration error: $e');
      debugPrint('Stacktrace: $stacktrace');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Database error: $e')),
      );
    }
  },
  child: const Text(
    "CREATE ACCOUNT",
    style: TextStyle(fontSize: 18, color: inkBlack),
  ),
)


          ],
        ),
      ),
    );
  }
}
