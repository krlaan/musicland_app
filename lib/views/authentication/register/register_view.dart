import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:musicland_app/state/auth/models/auth_result.dart';
import 'package:musicland_app/state/auth/models/auth_state.dart';
import 'package:musicland_app/state/auth/providers/authentication_provider.dart';
import 'package:musicland_app/state/auth/providers/is_logged_in_provider.dart';
import 'package:musicland_app/views/authentication/validators/validators.dart';
import 'package:musicland_app/views/authentication/widgets/divider_with_margins.dart';
import 'package:musicland_app/views/constants/app_colors.dart';
import 'package:musicland_app/views/constants/strings.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  RegisterViewState createState() => RegisterViewState();
}

class RegisterViewState extends ConsumerState<RegisterView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _attemptRegister() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final email = _emailController.text;
      final password = _passwordController.text;

      final authProvider = ref.read(authenticationProvider.notifier);
      await authProvider.registerWithEmailAndPassword(
          email: email, name: name, password: password);

      final currentUser = FirebaseAuth.instance.currentUser;
      print('CURRENT USER: $currentUser');

      if (currentUser != null) {
        await FirebaseFirestore.instance
            .collection('debug_users')
            .doc(currentUser.uid)
            .set({
          'email': email,
          'name': name,
          'createdAt': FieldValue.serverTimestamp(),
        });
        print('Firestore debug write done!');
      } else {
        print('User is null, Firestore write skipped!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // After successful registration/login, go to profile setup
    ref.listen(isLoggedInProvider, (_, isLoggedIn) {
      if (isLoggedIn && mounted) {
        context.go('/profile-setup');
      }
    });

    ref.listen(authenticationProvider,
            (AuthState? previous, AuthState current) {
          // We check if the state is not loading and login failed
          if (current.result == AuthResult.userAlreadyExists &&
              !current.isLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("User already exists!"),
                backgroundColor: Colors.red,
              ),
            );
          }
        });

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                // Header text
                Text(
                  Strings.signUp,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const DividerWithMargins(20),
                // Email field
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: validateName,
                ),
                const SizedBox(height: 16),
                // Email field
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator:
                  validateEmail, //-> (String? value) => _validateEmail(value)
                ),
                const SizedBox(height: 16),
                // Password field
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: validatePassword,
                ),
                const SizedBox(height: 16),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor,
                    foregroundColor: AppColors.loginButtonTextColor,
                  ),
                  onPressed: _attemptRegister,
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const DividerWithMargins(20),
                //const LoginViewSignupLinks(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
