import 'package:eventrack_app/app/modules/userdashboard/controllers/userdashboard_controller.dart';
import 'package:eventrack_app/app/modules/userdashboard/provider/user_provider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../modules/initLoad/controllers/init_load_controller.dart';
import '../routes/app_pages.dart';
import '../services/shared_prefs.dart';

Drawer buildAppDrawer() {
  InitLoadController _controller = Get.find<InitLoadController>();
  UserdashboardController _dashboard = Get.find<UserdashboardController>();
  return Drawer(
    child: ListView(
      children: [
        Container(
          child: DrawerHeader(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.check,
                      size: 60,
                    ),
                    radius: 50,
                    backgroundColor: Colors.blueGrey,
                  ),
                  Text(
                    'EventTrack',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        ListTile(
          title: Text("Home"),
          onTap: () => Get.toNamed(Routes.HOME),
          leading: Icon(Icons.home),
        ),
        ListTile(
          title: Text("Search Events"),
          onTap: () => _dashboard.seeAll('all'),
          leading: Icon(Icons.search),
        ),
        ListTile(
          title: Text("Registered Events"),
          onTap: () => _dashboard.seeAll(_dashboard.my),
          leading: Icon(Icons.pages_outlined),
        ),
        ListTile(
          title: Text("Favourite Events"),
          onTap: () => _dashboard.seeAll(_dashboard.fav),
          leading: Icon(Icons.favorite_border),
        ),
        Divider(
          color: Colors.black,
        ),
        ListTile(
          title: Text("Profile"),
          onTap: () => Get.toNamed(Routes.USER_PROFILE),
          leading: Icon(Icons.person),
        ),
        _controller.currentUser.organization == null
            ? ListTile(
                title: Text("Create Organization"),
                onTap: () => Get.toNamed(Routes.CREATE_ORGANIZATION),
                leading: Icon(Icons.create_rounded),
              )
            : ListTile(
                title: Text("Your Organization"),
                onTap: () => Get.toNamed(Routes.ORGANIZATION_PROFILE,
                    arguments: _controller.organization),
                leading: Icon(Icons.business),
              ),
        // _controller.currentUser.organization == null
        //     ? Center()
        //     : ListTile(
        //         title: Text("Create Events"),
        //         onTap: () => Get.toNamed(Routes.CREATE_EVENT),
        //         leading: Icon(Icons.create),
        //       ),
        Divider(
          color: Colors.black,
        ),
        ListTile(
          title: Text("Logout"),
          onTap: () async => await SharedPreference.requestLogout(),
          leading: Icon(Icons.logout),
        ),
      ],
    ),
  );
}
