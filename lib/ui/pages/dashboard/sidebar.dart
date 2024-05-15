// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/items.dart';
import 'package:keeyosk/constants/routes.dart';
import 'package:keeyosk/data/models/user.dart';
import 'package:keeyosk/ui/widgets/sidebar_item.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                    height: 180,
                    width: double.infinity,
                    padding: EdgeInsets.zero,
                    color: primary,
                    child: SizedBox(
                      width: constraints.maxWidth,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: 100,
                              width: constraints.maxWidth,
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            top: 50,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                './lib/ui/assets/images/user_black.png',
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Column(
                              children: [
                                Text(
                                  '${currentUser.firstName} ${currentUser.lastName}',
                                  style: TextStyle(
                                    color: primary,
                                    fontSize: 22,
                                    height: 1.2,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '09123456789',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 180,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SidebarItem(
                    imgUrl: './lib/ui/assets/images/user.png',
                    label: 'Personal Information',
                    onClick: () {},
                  ),
                  SidebarItem(
                    imgUrl: './lib/ui/assets/images/history.png',
                    label: 'Order History',
                    onClick: () {},
                  ),
                  SidebarItem(
                    imgUrl: './lib/ui/assets/images/help.png',
                    label: 'FAQ',
                    onClick: () {},
                  )
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            currentUser.role == Role.admin ?
            Container(
              
              padding: EdgeInsets.all(12),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(239, 243, 249, 1),
                border: Border(
                  top: BorderSide(color: Colors.black12),
                  bottom: BorderSide(color: Colors.black12),
                ),
              ),
              child: Text(
                'Admin Panel',
                style: TextStyle(color: primary, fontSize: 16),
              ),
            ) : SizedBox(),
            SizedBox(height: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    currentUser.role == Role.admin ?
                    SidebarItem(
                      onClick: () {
                        Navigator.of(context).pushNamed(adminPanel);
                      },
                      imgUrl: './lib/ui/assets/images/user.png',
                      label: 'Admin Panel',
                    ) : SizedBox(),
                    SidebarItem(
                      imgUrl: './lib/ui/assets/images/exit.png',
                      label: 'Log Out',
                      onClick: () {},
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
