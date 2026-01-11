import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:musicland_app/state/auth/models/auth_result.dart';
import 'package:musicland_app/state/auth/models/auth_state.dart';
import 'package:musicland_app/state/auth/providers/authentication_provider.dart';
import 'package:musicland_app/views/authentication/validators/validators.dart';
import 'package:musicland_app/views/authentication/widgets/divider_with_margins.dart';
import 'package:musicland_app/views/constants/app_colors.dart';
import 'package:musicland_app/views/constants/strings.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends ConsumerState<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _attemptLogin() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      final authProvider = ref.read(authenticationProvider.notifier);
      await authProvider.loginWithEmailAndPassword(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = ref.watch(authenticationProvider);

    ref.listen(authenticationProvider, (
      AuthState? previous,
      AuthState current,
    ) {
      // We check if the state is not loading and login failed
      if (current.result == AuthResult.failure && !current.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Wrong email or password!"),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text(Strings.appName)),
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
                  Strings.welcomeToAppName,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const DividerWithMargins(20),
                Text(
                  Strings.logIntoYourAccount,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(height: 1.5),
                ),
                const SizedBox(height: 20),
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

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: authProvider.isLoading ? null : _attemptLogin,
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 4),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    context.push("/register");
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 14),
                  ),
                ),

                const DividerWithMargins(20),
                Text(
                  'Or continue with',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  icon: Image.asset(
                    'assets/google_logo.png',
                    height: 24,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.g_mobiledata, size: 24);
                    },
                  ),
                  label: const Text('Sign in with Google'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  onPressed: authProvider.isLoading
                      ? null
                      : () async {
                          final authNotifier = ref.read(
                            authenticationProvider.notifier,
                          );
                          await authNotifier.signInWithGoogle();
                        },
                ),
                //const LoginViewSignupLinks(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
