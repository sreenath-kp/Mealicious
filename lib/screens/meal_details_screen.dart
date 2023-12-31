import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/favourites_provider.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavourite = ref.watch(favouritesProvider).contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(favouritesProvider.notifier).toggleFavourites(meal);
            },
            icon: Icon(isFavourite ? Icons.favorite : Icons.favorite_border),
          )
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(error.toString())));
                return const Icon(Icons.error);
              },
            ),
            const SizedBox(height: 10),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            for (var ingredient in meal.ingredients)
              Row(
                children: [
                  const SizedBox(width: 20),
                  const Icon(Icons.arrow_right),
                  Text(
                    ingredient,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ],
              ),
            const SizedBox(height: 10),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            ListBody(
              children: [
                for (var step in meal.steps)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          horizontalTitleGap: 8,
                          leading: Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          title: Text(
                            step,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
