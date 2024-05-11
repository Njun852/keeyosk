// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/ui/pages/dashboard/sidebar_item.dart';

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
                                './lib/images/user_black.png',
                              ),
                            ),
                          ),
                          const Positioned(
                            bottom: 0,
                            child: Column(
                              children: [
                                Text(
                                  'Prince Duran',
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
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SidebarItem(
                    imgUrl: './lib/images/user.png',
                    label: 'Personal Information',
                  ),
                  SidebarItem(
                    imgUrl: './lib/images/history.png',
                    label: 'Order History',
                  ),
                  SidebarItem(
                    imgUrl: './lib/images/help.png',
                    label: 'FAQ',
                  )
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
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
            ),
            SizedBox(height: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SidebarItem(
                      imgUrl: './lib/images/user.png',
                      label: 'Admin Panel',
                    ),
                    SidebarItem(imgUrl: './lib/images/exit.png', label: 'Log Out')
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
