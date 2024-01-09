import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseService {
  // Firestore bağlantısını oluştur
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 30 gün içindeki tarihleri Firestore'a kaydet
  Future<void> kaydet() async {
    DateTime bugununTarihi = DateTime.now();
    DateTime otuzGunOnce = bugununTarihi.subtract(Duration(days: 30));
    print(otuzGunOnce.day);

    for (int i = 0; i < 30; i++) {
      DateTime gun = otuzGunOnce.add(Duration(days: i));

      // Firestore'a tarihi ekle
      _firestore
          .collection('tarihler')
          .doc(
            gun.day.toString() + gun.month.toString() + gun.year.toString(),
          )
          .set({
        'gun': gun.day.toString(),
        'ay': gun.month.toString(),
        'yil': gun.year.toString(),
      });
    }
  }
}
