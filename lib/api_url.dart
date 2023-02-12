class APIUrl {
  static String baseURL = "https://xtravel.vercel.app";

  static String getSet = '$baseURL/customerUI/saveRservation';

  static String login = "$baseURL/customerUI/login";

  static String resrvation = "$baseURL/customerUI/saveRservation";

  static String myResrvation = "$baseURL/customerUI/myRservations";

  static String deleteResrvation =
      "$baseURL/customerUI/removeRservation/trip_id";

  static String refresh = "$baseURL/customerUI/refreashAftereLogin";

  static String myProfile = "$baseURL/customerUI/myProfile";

  static String locations = "$baseURL/customerUI/viewRservation/";
}
