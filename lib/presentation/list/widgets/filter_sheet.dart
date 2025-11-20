import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../list/cubit/recipes_list_cubit.dart';
import '../../list/cubit/recipes_list_state.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet();

  @override
  State<FilterSheet> createState() => FilterSheetState();
}

class FilterSheetState extends State<FilterSheet> {
  bool _withImages = false;
  String _maxMinutes = '';

  @override
  void initState() {
    super.initState();

    final cubit = context.read<RecipesListCubit>();
    final state = cubit.state;

    if (state is RecipesLoaded) {
      _withImages = cubit.filterWithImages;
      _maxMinutes = cubit.filterMaxMinutes?.toString() ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SwitchListTile(
            title: const Text("Только с картинкой"),
            value: _withImages,
            onChanged: (v) => setState(() => _withImages = v),
          ),

          const SizedBox(height: 12),

          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "До N минут",
              border: OutlineInputBorder(),
            ),
            onChanged: (v) => _maxMinutes = v,
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    context.read<RecipesListCubit>().resetFilters();
                    Navigator.pop(context);
                  },
                  child: const Text("Сбросить"),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final cubit = context.read<RecipesListCubit>();

                    cubit.setFilterWithImages(_withImages);

                    final minutes = int.tryParse(_maxMinutes);
                    cubit.setFilterMaxMinutes(minutes);

                    Navigator.pop(context);
                  },
                  child: const Text("Применить"),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
