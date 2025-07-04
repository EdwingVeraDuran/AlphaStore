class FormError {
  final String message;
  final String? field;

  const FormError({required this.message, this.field});

  // Campos comunes
  static FormError emptyField(String fieldName) => FormError(
    message: 'El campo "$fieldName" no puede estar vacío.',
    field: fieldName,
  );

  static FormError invalidNumber(String fieldName) => FormError(
    message: 'El campo "$fieldName" debe ser un número válido.',
    field: fieldName,
  );

  static FormError invalidEmail() => const FormError(
    message: 'El correo electrónico ingresado no es válido.',
    field: 'email',
  );

  static FormError passwordsDoNotMatch() => const FormError(
    message: 'Las contraseñas no coinciden.',
    field: 'passwordConfirmation',
  );

  static FormError minLength(String fieldName, int min) => FormError(
    message: 'El campo "$fieldName" debe tener al menos $min caracteres.',
    field: fieldName,
  );

  static FormError maxLength(String fieldName, int max) => FormError(
    message: 'El campo "$fieldName" debe tener máximo $max caracteres.',
    field: fieldName,
  );

  static FormError custom(String message, {String? field}) =>
      FormError(message: message, field: field);
}
