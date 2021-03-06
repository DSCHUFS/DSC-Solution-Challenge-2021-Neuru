class APIPath {
  static String accountInfo(String uid) => 'users/$uid';

  static String myBadges(String uid) => 'users/$uid/my_badges';
  static String myBadge(String uid, String myBadgeId) =>
      'users/$uid/my_badges/$myBadgeId';
  static String myChallenges(String uid) =>
      'users/$uid/participated_challenges';
  static String myChallenge(String uid, String myChallengeId) =>
      'users/$uid/participated_challenges/$myChallengeId';

  static String thisMonthChallenge() => 'activeChallenge/thisMonthChallenge';
  static String nextMonthChallenge() => 'activeChallenge/nextMonthChallenge';
  static String challengeParticipants() =>
      'activeChallenge/thisMonthChallenge/participants';
  static String challengeParticipant(String uid) =>
      'activeChallenge/thisMonthChallenge/participants/$uid';

  static String counselors() => 'counselors';
  static String counselor(String counselorId) => 'counselors/$counselorId';
}

//파이어스토어 경로, 컬렉션/도큐먼트/... 순서로 이뤄짐

// 1. api_path.dart 에서 데이터베이스 경로 지정
// 2. database.dart 에서 set, delete, stream 함수 생성
// 3. 사용하는 곳에서 final database = Provider.of<Database>(context, listen: false); 로 정의하고
// 4. stream과 set, delete을 적절히 사용 (profile_screen.dart와 setting_screen.dart 참고)