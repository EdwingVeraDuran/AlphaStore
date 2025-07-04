import 'package:alpha_store/core/layout/widgets/section_title.dart';
import 'package:alpha_store/features/categories/presentation/bloc/categories_cubit.dart';
import 'package:alpha_store/features/categories/presentation/bloc/categories_state.dart';
import 'package:alpha_store/features/categories/presentation/widgets/categories_table.dart';
import 'package:alpha_store/features/categories/presentation/widgets/category_popover.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().readCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SectionTitle(label: 'Categorías', icon: LucideIcons.tag),
            CategoryPopover(),
          ],
        ),
        Gap(24),
        BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is CategoriesError) {
              return Center(child: Text(state.message));
            }

            if (state is CategoriesEmpty) {
              return Center(child: Text('No hay categorías'));
            }

            if (state is CategoriesList) {
              return CategoriesTable(state.categories);
            }

            return Container();
          },
        ),
      ],
    );
  }
}
