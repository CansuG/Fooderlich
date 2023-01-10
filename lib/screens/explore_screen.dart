import 'package:flutter/material.dart';

import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';
import '../models/explore_data.dart';

class ExploreScreen extends StatelessWidget {
  //1
  final mockService = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1
    return FutureBuilder(
        // 2
        future: mockService.getExploreData(),
        // 3
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          // 4
          if (snapshot.connectionState == ConnectionState.done) {
            // 5
            return ListView(
              // 6
              scrollDirection: Axis.vertical,
              children: [
                // 7
                TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
                // 8
                const SizedBox(height: 16),
                // 9
                FriendPostListView(
                    friendPosts: snapshot.data?.friendPosts ?? []),
                Container(
                  height: 400,
                  color: Colors.green,
                ),
              ],
            );
          } else {
            // 10
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
