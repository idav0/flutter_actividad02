import 'package:flutter/material.dart';
import 'package:flutter_actividad1/validation/validations.dart';

class Recoverpasswordtoken extends StatefulWidget {
  const Recoverpasswordtoken({super.key});

  @override
  State<Recoverpasswordtoken> createState() => _RecoverpasswordtokenState();
}

class _RecoverpasswordtokenState extends State<Recoverpasswordtoken> {
  final TextEditingController _tokenController = TextEditingController();
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
                  validator: (value) => Validations.validateToken(value),
                  controller: _tokenController,
                  decoration: const InputDecoration(
                    hintText: 'Código de Verificación',
                    label: Text('Código de Verificación'),
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
                        print('Validar Código');
                        Navigator.pushNamed(context, '/recoverpasswordnew');
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text('Validar Código'),
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
