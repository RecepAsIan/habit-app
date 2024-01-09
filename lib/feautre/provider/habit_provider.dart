import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_tracker/produck/constants/habit_string.dart';
import 'package:intl/intl.dart';

class HabitNotifier extends StateNotifier<HabitContainerModel> {
  HabitNotifier() : super(HabitContainerModel());
  final String firstDocID = FirebaseAuth.instance.currentUser!.uid;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DateTime toDay = DateTime.now();

  void habitAddFirebase(HabitContainerModel habitContainerModel) {
    // Tarih ve saat bilgisini içeren bir string oluştur
    String formattedDate = DateFormat('yyyy-MM-dd').format(toDay);
    String seconDocID = ('${formattedDate}T17:13:10.000Z');

    try {
      _firestore
          .collection('users')
          .doc(firstDocID)
          .collection('dates')
          .doc(seconDocID)
          .collection('habit')
          .add({
        'subtitleText': habitContainerModel.subtitleText,
        'titleText': habitContainerModel.titleText,
        'trailingText': habitContainerModel.trailingText,
      });
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (error) {
      print('cath hatası $error');
    }
  }

  void meditate() {
    habitAddFirebase(HabitContainerModel(
      titleText: HabitString.meditate,
      subtitleText: 'metre',
      trailingText: 'succesful',
    ));
  }

  void running() {
    habitAddFirebase(HabitContainerModel(
      titleText: HabitString.running,
      subtitleText: 'metre',
      trailingText: 'succesful',
    ));
  }

  void readBooks() {
    habitAddFirebase(HabitContainerModel(
      titleText: HabitString.readBooks,
      subtitleText: 'page',
      trailingText: 'succesful',
    ));
  }

  void setAtodoList() {
    habitAddFirebase(HabitContainerModel(
      titleText: HabitString.setAtodoList,
      subtitleText: 'düzenlenir',
      trailingText: 'succesful',
    ));
  }

  void hitTheGym() {
    habitAddFirebase(HabitContainerModel(
      titleText: HabitString.hitTheGym,
      subtitleText: 'düzenlenir',
      trailingText: 'succesful',
    ));
  }

  void swimming() {
    habitAddFirebase(HabitContainerModel(
      titleText: HabitString.swimming,
      subtitleText: 'düzenlenir',
      trailingText: 'succesful',
    ));
  }

  void yoga() {
    habitAddFirebase(HabitContainerModel(
      titleText: HabitString.yoga,
      subtitleText: 'minute',
      trailingText: 'succesful',
    ));
  }

  void cardio() {
    habitAddFirebase(HabitContainerModel(
      titleText: HabitString.cardio,
      subtitleText: 'minute',
      trailingText: 'succesful',
    ));
  }

  void cycling() {
    habitAddFirebase(HabitContainerModel(
      titleText: HabitString.cycling,
      subtitleText: 'minute',
      trailingText: 'succesful',
    ));
  }

  void goForAWalk() {
    habitAddFirebase(HabitContainerModel(
      titleText: HabitString.goForAWalk,
      subtitleText: 'minute',
      trailingText: 'succesful',
    ));
  }

  void drinkWater() {
    habitAddFirebase(HabitContainerModel(
      titleText: HabitString.drinkWater,
      subtitleText: 'minute',
      trailingText: 'succesful',
    ));
  }

  void getGoodSleep() {
    habitAddFirebase(HabitContainerModel(
      titleText: HabitString.drinkWater,
      subtitleText: 'minute',
      trailingText: 'succesful',
    ));
  }

  void takeAColdShower() {
    habitAddFirebase(HabitContainerModel(
      titleText: HabitString.takeAColdShower,
      subtitleText: 'minute',
      trailingText: 'succesful',
    ));
  }

  void limitSugar() {
    habitAddFirebase(HabitContainerModel(
      titleText: HabitString.limitSugar,
      subtitleText: 'minute',
      trailingText: 'succesful',
    ));
  }

  void trackCalories() {
    habitAddFirebase(HabitContainerModel(
      titleText: HabitString.trackCalories,
      subtitleText: 'minute',
      trailingText: 'succesful',
    ));
  }

  void takeVitamins() {
    habitAddFirebase(HabitContainerModel(
      titleText: HabitString.takeVitamins,
      subtitleText: 'minute',
      trailingText: 'succesful',
    ));
  }

  void eatFruits() {
    habitAddFirebase(HabitContainerModel(
      titleText: HabitString.eatFruits,
      subtitleText: 'minute',
      trailingText: 'succesful',
    ));
  }

  void limitCaffeine() {
    habitAddFirebase(HabitContainerModel(
      titleText: HabitString.limitCaffeine,
      subtitleText: 'minute',
      trailingText: 'succesful',
    ));
  }
}

class HabitContainerModel {
  final String? trailingText;
  final String? subtitleText;
  final String? titleText;

  HabitContainerModel({this.titleText, this.subtitleText, this.trailingText});
}
