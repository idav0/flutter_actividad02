import 'package:flutter/material.dart';
import 'package:flutter_actividad1/validation/validations.dart';

class Recoverpasswordnew extends StatefulWidget {
  const Recoverpasswordnew({super.key});

  @override
  State<Recoverpasswordnew> createState() => _RecoverpasswordnewState();
}

class _RecoverpasswordnewState extends State<Recoverpasswordnew> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newpasswordconfirmController = TextEditingController();
  bool _isObscure = true;
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
                  validator: (value) => Validations.validatePasswordConfirm(value, _newPasswordController.text),
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    hintText: 'Confirmar Nueva Contraseña',
                    label: const Text('Confirmar Nueva Contraseña'),
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
                        print('Nueva contraseña coincide ');
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text('Guardar'),
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
