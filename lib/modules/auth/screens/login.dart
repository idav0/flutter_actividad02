import 'package:flutter/material.dart';
import 'package:flutter_actividad1/validation/validations.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', width: 200, height: 200),
                const SizedBox(height: 32),
                TextFormField(
                  validator: (value) => Validations.validateEmail(value),
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Correo Electrónico',
                    label: Text('Correo Electrónico'),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) => Validations.validatePassword(value),
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    label: const Text('Contraseña'),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 48.0),
                SizedBox(
                  height: 48,
                  width: 256,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('Iniciar Sesión');
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text('Iniciar Sesión'),
                  ),
                ),
                SizedBox(
                  child : Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/recoverpassword');
                      },
                      child: const Text('¿Olvidaste tu contraseña?', style: TextStyle( decoration: TextDecoration.underline)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
