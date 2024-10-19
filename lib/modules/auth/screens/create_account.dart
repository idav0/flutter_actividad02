import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_actividad1/validation/validations.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newpasswordconfirmController =
      TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Cuenta'),
      ),
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
                    controller: _email,
                    decoration: const InputDecoration(
                      hintText: 'Correo electronico',
                      labelText: 'Correo electronico',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    validator: (value) => Validations.validatePassword(value),
                    controller: _newPasswordController,
                    obscureText: _isObscure,
                    decoration: const InputDecoration(
                      hintText: 'Nueva Contraseña',
                      label: Text('Nueva Contraseña'),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _newpasswordconfirmController,
                    validator: (value) => Validations.validatePasswordConfirm(
                        value, _newPasswordController.text),
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      hintText: 'Confirmar Nueva Contraseña',
                      label: const Text('Confirmar Nueva Contraseña'),
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  SizedBox(
                      width: 256,
                      height: 48,
                      child: ElevatedButton(
                          onPressed: () async {
                            print('entro');
                            if (_formKey.currentState!.validate()) {
                              try {
                                final credential = await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: _email.text,
                                        password: _newPasswordController.text);
                                print(credential.user);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  print('No user found for that email.');
                                } else if (e.code == 'wrong-password') {
                                  print(
                                      'Wrong password provided for that user.');
                                }
                              }
                            }
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text('Crear Cuenta'))),
                ],
              )),
        ),
      ),
    );
  }
}
