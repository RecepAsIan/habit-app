const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp();

const firestore = admin.firestore();

exports.createUserDocument = functions.auth.user().onCreate(async (user) => {
  const uid = user.uid;
  const userDocRef = firestore.collection('users').doc(uid);

  const registrationDate = new Date(user.metadata.creationTime);

  // Kullanıcının UID'si altında bir koleksiyon oluştur
  const userDateCollectionRef = userDocRef.collection('dates');

  // 1 ay önceki tarih
  const oneMonthAgo = new Date(registrationDate);
  oneMonthAgo.setMonth(registrationDate.getMonth() - 1);

  // 1 yıl sonraki tarih
  const oneYearLater = new Date(registrationDate);
  oneYearLater.setFullYear(registrationDate.getFullYear() + 1);

  // Tarih aralığı oluştur
  const dateRange = generateDateRange(oneMonthAgo, oneYearLater);

  // Her bir tarih için doküman oluştur
  for (const date of dateRange) {
    const dateDocRef = userDateCollectionRef.doc(date);
    await dateDocRef.set({ registrationDate: registrationDate.toISOString() });
  }

  return null;
});

// Belirli bir tarih aralığındaki tüm günleri oluşturur
function generateDateRange(startDate, endDate) {
  const dateRange = [];
  let currentDate = new Date(startDate);

  while (currentDate <= endDate) {
    dateRange.push(currentDate.toISOString());
    currentDate.setDate(currentDate.getDate() + 1);
  }

  return dateRange;
}
