class ApiUrl {

  static const String mainUrl = "https://api.dotaramusic.com";
  static const String baseUrl = "$mainUrl/api/v1";
  static const String paymentTokenBkash = "eW9001cl91c2Vy12Onl45vdXJfc68GFzcw";

  /// Image Path Set
  static const String imageUrl = mainUrl;
  static const String blogImageUrl = "$mainUrl/images/blogs/";
  static const String sliderImageUrl = "$mainUrl/images/audio/thumb/";

  /// Auth Section
  static const String signIn = "$baseUrl/login";
  static const String googleSignIn = "$baseUrl/social-login";
  static const String iOSClientId = "288678240293-putr3r5pvvsbe9vrk5larnmvr094vnbq.apps.googleusercontent.com";
  static const String signUp = "$baseUrl/register";
  static const String logout = "$baseUrl/logout";
  static const String forgotPassword = "$baseUrl/forgot_password";
  static const String verifyOtp = "$baseUrl/verify_otp";
  static const String resetPassword = "$baseUrl/reset_password";

  /// Home Section
  static const String sliderSongs = "$baseUrl/getSliderSongs";
  static const String musicCategories = "$baseUrl/musicCategories";
  static const String getGenres = "$baseUrl/getMusic";
  static const String getGenresMusic = "$baseUrl/getMusicByCategory";
  static const String getArtistMusic = "$baseUrl/getMusicByArtist";

  ///Audio path
  static const String audioPath = "$mainUrl/images/audio/";

  /// Playlist Section
  static const String getPlaylist = "$baseUrl/playlist";
  static const String createPlaylist = "$baseUrl/create_playlist";
  static const String deletePlaylist = "$baseUrl/delete_playlist";
  static const String editPlaylist = "$baseUrl/update_playlist_name";
  static const String addToPlaylist = "$baseUrl/add_playlist_music";
  static const String removeToPlaylist = "$baseUrl/remove_playlist_music";

  /// Search Section
  static const String searchMusic = "$baseUrl/searchMusic";

  /// Profile Section
  static const String profileInfoUpdate = "$baseUrl/updateProfile";

  /// Music History Section
  static const String musicHistory = "$baseUrl/music_history";
  static const String addRemoveMusicHistory = "$baseUrl/addremove_musichistory";

  /// Favourite List Section
  static const String favouriteList = "$baseUrl/favouriteList";
  static const String removeAddFavourite = "$baseUrl/addFavouriteList";

  /// Plans Section
  static const String getPlans = "$baseUrl/plan_list";
  static const String getUserDetails = "$baseUrl/get_user_setting_details";

  ///Bkash Payment
  static const String bkashInit = "$baseUrl/bkash/recurring/payment";
  static const String bkashCreatePayment = "$bkashInit/subscription/create";
  static const String bkashSubscriptionDetails = "$bkashInit/subscription/getdetails";

  /// SSL Payment
  static const String sslPaymentUrl = "$baseUrl/payment/init";

  /// Plans Section
  static const String purchaseHistory = "$baseUrl/user_purchase_history";

  /// ApInfo Section
  static const String getAppInfo = "$baseUrl/get_app_info";
  static const String getBlogs = "$baseUrl/get_blogs";

}

