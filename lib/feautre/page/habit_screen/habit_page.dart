import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/feautre/page/habit_screen/habit_provider.dart';
import 'package:habit_tracker/product/constants/assests_string.dart';
import 'package:habit_tracker/product/constants/color_constants.dart';
import 'package:habit_tracker/product/constants/habit_string.dart';
import 'package:habit_tracker/product/widgets/habit_add_container.dart';

final _habitProvider =
    StateNotifierProvider<HabitNotifier, HabitContainerModel>((ref) {
  return HabitNotifier();
});

class HabitPage extends ConsumerWidget {
  const HabitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConstants.mineApprox,
      appBar: AppBar(
        title: const Text('New Habbit'),
        backgroundColor: ColorConstants.mineApprox,
        foregroundColor: ColorConstants.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  HabitAddContainer(
                      onTap: () {
                        ref.read(_habitProvider.notifier).meditate();
                      },
                      containerColor: ColorConstants.meditation,
                      habitText: HabitString.meditate,
                      imageText: AssetsString.meditate),
                  HabitAddContainer(
                      onTap: () {
                        ref.read(_habitProvider.notifier).running();
                      },
                      containerColor: ColorConstants.running,
                      habitText: HabitString.running,
                      imageText: AssetsString.running),
                ],
              ),
              Row(
                children: [
                  HabitAddContainer(
                      onTap: () {
                        ref.read(_habitProvider.notifier).readBooks();
                      },
                      containerColor: ColorConstants.readABooks,
                      habitText: HabitString.readBooks,
                      imageText: AssetsString.readABook),
                  HabitAddContainer(
                      onTap: () {
                        ref.read(_habitProvider.notifier).setAtodoList();
                      },
                      containerColor: ColorConstants.setAtodoList,
                      habitText: HabitString.setAtodoList,
                      imageText: AssetsString.setATodoList),
                ],
              ),
              Row(
                children: [
                  HabitAddContainer(
                      onTap: () {
                        ref.read(_habitProvider.notifier).hitTheGym();
                      },
                      containerColor: ColorConstants.hitTheGym,
                      habitText: HabitString.hitTheGym,
                      imageText: AssetsString.weightlifting),
                  HabitAddContainer(
                      onTap: () {
                        ref.read(_habitProvider.notifier).swimming();
                      },
                      containerColor: ColorConstants.swimming,
                      habitText: HabitString.swimming,
                      imageText: AssetsString.swimming),
                ],
              ),
              Row(
                children: [
                  HabitAddContainer(
                      onTap: () {
                        ref.read(_habitProvider.notifier).yoga();
                      },
                      containerColor: ColorConstants.yoga,
                      habitText: HabitString.yoga,
                      imageText: AssetsString.yoga),
                  HabitAddContainer(
                      onTap: () {
                        ref.read(_habitProvider.notifier).cardio();
                      },
                      containerColor: ColorConstants.cardio,
                      habitText: HabitString.cardio,
                      imageText: AssetsString.hiitCardio),
                ],
              ),
              Row(
                children: [
                  HabitAddContainer(
                      onTap: () {
                        ref.read(_habitProvider.notifier).cycling();
                      },
                      containerColor: ColorConstants.cycling,
                      habitText: HabitString.cycling,
                      imageText: AssetsString.cycling),
                  HabitAddContainer(
                      onTap: () {
                        ref.read(_habitProvider.notifier).goForAWalk();
                      },
                      containerColor: ColorConstants.goForAWalk,
                      habitText: HabitString.goForAWalk,
                      imageText: AssetsString.goForAWalk),
                ],
              ),
              Row(
                children: [
                  HabitAddContainer(
                      onTap: () {
                        ref.read(_habitProvider.notifier).drinkWater();
                      },
                      containerColor: ColorConstants.drinkWater,
                      habitText: HabitString.drinkWater,
                      imageText: AssetsString.drinkWater),
                  HabitAddContainer(
                      onTap: () {
                        ref.read(_habitProvider.notifier).getGoodSleep();
                      },
                      containerColor: ColorConstants.getGoodSleep,
                      habitText: HabitString.getGoodSleep,
                      imageText: AssetsString.getGoodSleep),
                ],
              ),
              Row(
                children: [
                  HabitAddContainer(
                      onTap: () {
                        ref.read(_habitProvider.notifier).takeAColdShower();
                      },
                      containerColor: ColorConstants.takeAColdShower,
                      habitText: HabitString.takeAColdShower,
                      imageText: AssetsString.takeAColdShower),
                  HabitAddContainer(
                      onTap: () {
                        ref.read(_habitProvider.notifier).limitSugar();
                      },
                      containerColor: ColorConstants.limitSugar,
                      habitText: HabitString.limitSugar,
                      imageText: AssetsString.limitSugar),
                ],
              ),
              Row(
                children: [
                  HabitAddContainer(
                      onTap: () {
                        ref.read(_habitProvider.notifier).trackCalories();
                      },
                      containerColor: ColorConstants.trackCalories,
                      habitText: HabitString.trackCalories,
                      imageText: AssetsString.trackCalories),
                  HabitAddContainer(
                      onTap: () {
                        ref.read(_habitProvider.notifier).takeVitamins();
                      },
                      containerColor: ColorConstants.takeVitamins,
                      habitText: HabitString.takeVitamins,
                      imageText: AssetsString.takeVitamins),
                ],
              ),
              Row(
                children: [
                  HabitAddContainer(
                      onTap: () {
                        ref.read(_habitProvider.notifier).eatFruits();
                      },
                      containerColor: ColorConstants.eatFruits,
                      habitText: HabitString.eatFruits,
                      imageText: AssetsString.eatFruits),
                  HabitAddContainer(
                      onTap: () {
                        ref.read(_habitProvider.notifier).limitCaffeine();
                      },
                      containerColor: ColorConstants.limitCaffeine,
                      habitText: HabitString.limitCaffeine,
                      imageText: AssetsString.limitCaffeine),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
