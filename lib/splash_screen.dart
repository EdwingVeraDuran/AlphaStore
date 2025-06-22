import 'package:alpha_store/core/shared/icons/my_flutter_app_icons.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _opacity = 1;
      });
    });
    Future.delayed(const Duration(seconds: 2), () => toHome());
  }

  void toHome() => Navigator.of(context).pushReplacementNamed('/home');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: Duration(milliseconds: 800),
        child: Center(
          child: Container(
            height: 128,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  MyFlutterApp.logo,
                  size: 64,
                  weight: 600,
                  color: Colors.white,
                ),
                Gap(24),
                VerticalDivider(thickness: 4, color: Colors.white),
                Gap(24),
                Text(
                  'Alpha Store',
                  style: TextStyle(color: Colors.white),
                ).x5Large.semiBold,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
