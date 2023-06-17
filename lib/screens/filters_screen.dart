import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersProvider);
    final switchFilter = ref.read(filtersProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter meals'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: filters[Filter.glutenfree]!,
            onChanged: (value) {
              switchFilter.setFilter(Filter.glutenfree, value);
            },
            title: Text(
              'Gluten Free',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include gluten free meals',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Colors.greenAccent,
            contentPadding: const EdgeInsets.only(left: 30, right: 20),
          ),
          SwitchListTile(
            value: filters[Filter.lactosefree]!,
            onChanged: (value) {
              switchFilter.setFilter(Filter.lactosefree, value);
            },
            title: Text(
              'Lactose Free',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include lactose free meals',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Colors.greenAccent,
            contentPadding: const EdgeInsets.only(left: 30, right: 20),
          ),
          SwitchListTile(
            value: filters[Filter.vegan]!,
            onChanged: (value) {
              switchFilter.setFilter(Filter.vegan, value);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegan meals',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Colors.greenAccent,
            contentPadding: const EdgeInsets.only(left: 30, right: 20),
          ),
          SwitchListTile(
            value: filters[Filter.vegetarian]!,
            onChanged: (value) {
              switchFilter.setFilter(Filter.vegetarian, value);
            },
            title: Text(
              'Vegitarian',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegitarian meals',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Colors.greenAccent,
            contentPadding: const EdgeInsets.only(left: 30, right: 20),
          ),
        ],
      ),
    );
  }
}
