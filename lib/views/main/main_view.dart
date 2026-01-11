import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicland_app/state/auth/providers/authentication_provider.dart';
import 'package:musicland_app/views/constants/strings.dart';
import 'package:musicland_app/views/dialogs/alert_dialog_model.dart';
import 'package:musicland_app/views/dialogs/logout_dialog.dart';
import 'package:musicland_app/views/tabs/add_post/add_post_view.dart';
import 'package:musicland_app/views/tabs/profile/profile_view.dart';
import 'package:musicland_app/views/tabs/search/search_view.dart';
import 'package:musicland_app/views/tabs/users_posts/user_posts_view.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  int _currentIndex = 0;
  final List<Widget> screens = [
    const UserPostsView(),
    const SearchView(),
    const AddPostView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final titles = [
      Strings.allAds,
      Strings.search,
      Strings.createAd,
      Strings.profile,
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_currentIndex]),
        actions: [
          IconButton(
            onPressed: () async {
              final shouldLogOut = await const LogoutDialog()
                  .present(context)
                  .then((value) => value ?? false);

              if (shouldLogOut) {
                await ref.read(authenticationProvider.notifier).logOut();
              }
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: Strings.posts,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: Strings.search,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: Strings.addPost,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: Strings.profile,
          ),
        ],
      ),
    );
  }
}
