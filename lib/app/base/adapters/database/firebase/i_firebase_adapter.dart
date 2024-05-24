abstract class IFirebaseAdapter {
  void initializeApp();
  Future<void> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
}
