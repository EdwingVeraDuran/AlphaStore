import 'package:alpha_store/core/shared/entities/operation_status.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class OperationToast extends StatelessWidget {
  final ToastOverlay overlay;
  final OperationStatus status;
  const OperationToast({
    super.key,
    required this.overlay,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      child: Basic(
        title: Text(status.success ? 'Operación exitosa' : 'Operación fallida'),
        leading: Icon(
          status.success ? LucideIcons.circleCheck : LucideIcons.circleX,
          color: status.success ? Colors.green : Colors.red,
        ),
        subtitle: Text(status.message),
        trailing: IconButton.outline(
          icon: Icon(LucideIcons.x),
          onPressed: () => overlay.close(),
          size: ButtonSize.small,
        ),
        trailingAlignment: Alignment.center,
      ),
    );
  }
}
