enum OperationType { add, update, delete }

class OperationStatus {
  final bool success;
  final OperationType type;
  final String message;

  OperationStatus({
    required this.success,
    required this.type,
    required this.message,
  });

  // Success
  static OperationStatus succesAdd(String message) =>
      OperationStatus(success: true, type: OperationType.add, message: message);

  static OperationStatus successUpdate(String message) => OperationStatus(
    success: true,
    type: OperationType.update,
    message: message,
  );

  static OperationStatus successDelete(String message) => OperationStatus(
    success: true,
    type: OperationType.delete,
    message: message,
  );

  // Error
  static OperationStatus errorAdd(String message) => OperationStatus(
    success: false,
    type: OperationType.add,
    message: message,
  );

  static OperationStatus errorUpdate(String message) => OperationStatus(
    success: false,
    type: OperationType.update,
    message: message,
  );

  static OperationStatus errorDelete(String message) => OperationStatus(
    success: false,
    type: OperationType.delete,
    message: message,
  );
}
