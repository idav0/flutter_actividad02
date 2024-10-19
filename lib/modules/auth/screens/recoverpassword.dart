import 'package:flutter/material.dart';
import 'package:flutter_actividad1/validation/validations.dart';

class Recoverpassword extends StatefulWidget {
  const Recoverpassword({super.key});

  @override
  State<Recoverpassword> createState() => _RecoverpasswordState();
}

class _RecoverpasswordState extends State<Recoverpassword> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar Contraseña'),
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
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Correo Electrónico',
                    label: Text('Correo Electrónico'),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 48),
                SizedBox(
                  height: 48,
                  width: 256,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('Enviar Código');
                        Navigator.pushNamed(context, '/recoverpasswordtoken');
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text('Enviar Código'),
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
