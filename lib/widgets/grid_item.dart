import 'package:flutter/material.dart';
import 'package:meals/model/category.dart';

class GridItem extends StatelessWidget {
  const GridItem(
      {required this.category, super.key, required this.onSelectCategory});
  final Category category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: category.color.withOpacity(1),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.3),
              category.color.withOpacity(0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                category.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(80, 10, 10, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                boxShadow: [
                  BoxShadow(
                    color: category.color,
                    blurRadius: 0,
                    offset: const Offset(-12, 5),
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 40,
                child: Image.asset(
                  category.icon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
