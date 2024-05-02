import 'package:flutter/material.dart';
import 'package:furniture_store_app_bloc/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.profilePic.path,
            width: 100,
            height: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Hello Nurhayat!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.images.github.path, width: 20),
              const SizedBox(width: 10),
              const Text(
                "github.com/NurhayatYurtaslan",
                style: TextStyle(fontSize: 20),
              ),
            ],
          )
        ],
      ),
    );
  }
}
