import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/config/theme/t.dart';
import 'package:rick_and_morty/feature/favorite/presentation/page/favorite_page.dart';
import 'package:rick_and_morty/feature/home/presentation/page/home_page.dart';

enum _ActiveItem { home, favorite }

class MyNavigationBarProvider extends ChangeNotifier {
  _ActiveItem _activeItem = _ActiveItem.home;

  void _setActiveItem(_ActiveItem item) {
    _activeItem = item;
    notifyListeners();
  }
}

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyNavigationBarProvider>(context);
    final activeItem = provider._activeItem;

    return Container(
      padding: const .symmetric(vertical: 8.0, horizontal: 16.0),
      color: T.of(context).colorScheme.tertiary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _Item(
            onTap: () {
              if (activeItem == _ActiveItem.home) return;
              context.go(HomePage.fullRoute());
              provider._setActiveItem(_ActiveItem.home);
            },
            isActive: activeItem == _ActiveItem.home,
            icon: Icons.home,
          ),

          _Item(
            onTap: () {
              if (activeItem == _ActiveItem.favorite) return;
              context.go(FavoritePage.fullRoute());
              provider._setActiveItem(_ActiveItem.favorite);
            },
            isActive: activeItem == _ActiveItem.favorite,
            icon: Icons.favorite,
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.onTap,
    required this.isActive,
    required this.icon,
  });

  final VoidCallback onTap;
  final bool isActive;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: isActive
          ? T.of(context).colorScheme.secondary
          : T.of(context).colorScheme.secondary.withAlpha(64),
      onPressed: onTap,
      icon: Icon(icon),
    );
  }
}
