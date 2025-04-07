import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shortify/res/constants.dart';
import 'package:shortify/view_models/controllers/general_controller.dart';
import 'home/home.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // final userController = Get.put(UserController());

  final List<Widget> _pages = [
    const HomePage(),
    // const SearchPage(),
    // const GalleryPage(),
  ];

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     notificationServices.requestNotificationPermission();
  //     notificationServices.foregroundMsg();
  //     notificationServices.firebaseInit();
  //     notificationServices.setupInteractMessage();
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final generalController = Get.put(GeneralController());
    return Scaffold(
      body: Obx(
        () => _pages[generalController.selectedIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 15,
          backgroundColor: pinFieldColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: whiteColor,
          unselectedItemColor: unSelectedItemColor,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          currentIndex: generalController.selectedIndex.value,
          onTap: (index) {
            generalController.selectedIndex.value = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svgs/home_icon.svg",
                colorFilter: ColorFilter.mode(
                  generalController.selectedIndex.value == 0
                      ? whiteColor
                      : unSelectedItemColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svgs/search_icon.svg",
                colorFilter: ColorFilter.mode(
                  generalController.selectedIndex.value == 1
                      ? whiteColor
                      : unSelectedItemColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Search',
            ),
            // BottomNavigationBarItem(
            //   icon: SvgPicture.asset(
            //     "assets/svgs/gallery_icon.svg",
            //     colorFilter: ColorFilter.mode(
            //       generalController.selectedIndex.value == 2
            //           ? whiteColor
            //           : unSelectedItemColor,
            //       BlendMode.srcIn,
            //     ),
            //   ),
            //   label: 'Gallery',
            // ),
          ],
        ),
      ),
    );
  }
}
