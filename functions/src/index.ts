import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

admin.initializeApp();

export const createCustomToken = functions.https.onCall(async (data, context) => {
  const { deviceId } = data;
  
  if (!deviceId) {
    throw new functions.https.HttpsError(
      'invalid-argument',
      'Device ID is required'
    );
  }

  try {
    const deviceDoc = await admin
      .firestore()
      .collection('devices')
      .doc(deviceId)
      .get();

    if (!deviceDoc.exists) {
      throw new functions.https.HttpsError(
        'not-found',
        'No user found for this device'
      );
    }

    const userId = deviceDoc.get('userId');
    const customToken = await admin.auth().createCustomToken(userId);
    
    return { customToken };
  } catch (error) {
    throw new functions.https.HttpsError(
      'internal',
      'Error creating custom token'
    );
  }
}); 