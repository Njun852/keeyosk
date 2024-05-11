import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keeyosk/constants/colors.dart';
import 'package:keeyosk/constants/routes.dart';
import 'package:keeyosk/constants/styles.dart';
import 'package:keeyosk/ui/pages/admin_panel/admin_option.dart';

class AdminPanel extends StatelessWidget {
  AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          style: appBarIconButtonStyle,
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Admin'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
            image: AssetImage('./lib/images/wave.png'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Prince',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: secondary,
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              height: 450,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                semanticChildCount: 6,
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
                children: [
                  AdminOption(
                    imageUrl: './lib/images/card.png',
                    label: 'Manage Orders',
                    onClick: () {},
                  ),
                  AdminOption(
                    imageUrl: './lib/images/ticket.png',
                    label: 'Offer Manager',
                    onClick: () {},
                  ),
                  AdminOption(
                    imageUrl: './lib/images/2person.png',
                    label: 'User Management',
                    onClick: () {},
                  ),
                  AdminOption(
                    imageUrl: './lib/images/2person.png',
                    label: 'Admin Management',
                    onClick: () {},
                  ),
                  AdminOption(
                    imageUrl: './lib/images/open_box.png',
                    label: 'Product List',
                    onClick: () {},
                  ),
                  AdminOption(
                    imageUrl: './lib/images/4squares.png',
                    label: 'Category\n(Add/Edit)',
                    onClick: () {
                      Navigator.of(context).pushNamed(category);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
