import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_sizes.dart';
import '../../utils/text_strings.dart';
import 'widgets/drawer_component.dart';
import 'widgets/listview_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(JPAppSizes.appBarSize),
        child: AppBar(
          backgroundColor: JPAppColors.background,
          title: const Text(JPTexts.appBarTitle),
        ),
      ),
      drawer: const DrawerComponent(),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 24.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: JPAppSizes.spaceXs / 2,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(JPAppSizes.spaceXs),
          ),
          child: const Icon(
            Icons.add,
            size: JPAppSizes.fontOverSize,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.only(
          top: JPAppSizes.spaceXL,
          left: JPAppSizes.defaultSpace,
          bottom: JPAppSizes.defaultSpace,
          right: JPAppSizes.defaultSpace,
        ),
        child: ListViewComponent(),
      ),
    );
  }
}
