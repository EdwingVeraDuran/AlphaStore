import 'package:alpha_store/core/shared/entities/form_error.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ErrorToast extends StatelessWidget {
  final ToastOverlay overlay;
  final FormError status;
  const ErrorToast({super.key, required this.overlay, required this.status});

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      child: Basic(
        leading: Icon(LucideIcons.circleX, color: Colors.red),
        title: Text('Error de validación'),
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
