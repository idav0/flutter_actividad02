class Validations {

  static String? validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su correo electrónico';
    }
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Por favor, ingrese un correo electrónico válido';
    }
    return null;
  }

  static String? validatePassword(value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su contraseña';
    }

    if (value.length < 8) {
      return 'La contraseña debe tener al menos 8 caracteres';
    }

    return null;
  }

  static String? validateToken(value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su código de verificación';
    }

    if (value.length < 6) {
      return 'El código de verificación debe tener al menos 6 caracteres';
    }

    return null;
  }

  static String? validatePasswordConfirm(value, password) {
    if (value == null || value.isEmpty) {
      return 'Por favor, confirme su contraseña';
    }

    if (value != password) {
      return 'Las contraseñas no coinciden';
    }

    return null;
  }
}
