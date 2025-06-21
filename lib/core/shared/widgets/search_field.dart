import 'package:shadcn_flutter/shadcn_flutter.dart';

class SearchField extends StatelessWidget {
  //TODO: Add controller and onChanged callback
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextField(
        placeholder: Text('Buscar producto'),
        features: [
          InputFeature.leading(Icon(LucideIcons.search)),
          InputFeature.clear(),
        ],
      ),
    );
  }
}
