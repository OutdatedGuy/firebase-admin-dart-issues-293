import { initializeApp } from "firebase-admin/app";
initializeApp();

import { getAuth } from "firebase-admin/auth";
import { onRequest } from "firebase-functions/https";

export const helloWorld = onRequest(async (request, response) => {
  const phoneNumber = "+919999999999";

  const auth = getAuth();
  try {
    const userRecord = await auth.createUser({
      phoneNumber: phoneNumber,
    });
    console.log("User record:", userRecord.toJSON());
  } catch (error) {
    console.error("Error fetching user by phone number:", error);
  }

  response.send("Hello from Firebase Functions!");
});
