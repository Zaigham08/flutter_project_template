class AppUrl {
  static const baseUrl = 'https://dev-dot-typicl-dev.uc.r.appspot.com';

  static const userApi = '$baseUrl/api/v1/users/';
  static const searchApi = '$baseUrl/api/v1/search/search-with-filters';
  static const generateSignedUrlsApi = '$baseUrl/api/v1/storage/generate-signed-urls';

  static const getGalleryImagesApi = '$baseUrl/api/v1/gallery/';
  static const galleryFavApi = '$baseUrl/api/v1/gallery/favorite';
  static const getGalleryFavApi = '$baseUrl/api/v1/gallery/favorites';

  static const getHistoryApi = '$baseUrl/api/v1/history/';
  static const historyFavApi = '$baseUrl/api/v1/history/favourites/';
  static const getHistoryFavApi = '$baseUrl/api/v1/history/favourites';

  static const upscaleApi = '$baseUrl/api/v1/upscale/generate-v2';
  static const textToImgApi = '$baseUrl/api/v1/text_to_image/generate-v2';
  static const faceGeniusApi = '$baseUrl/api/v1/arc_to_face/generate-v2';
  static const faceSwapApi = '$baseUrl/api/v1/face_swap/swap-v2';
  static const faceFitApi = '$baseUrl/api/v1/face_swap/face-fit-v2';
  static const stylizedPortraitApi = '$baseUrl/api/v1/instant_id/run-v2';

  static const img2imgInferenceApi = '$baseUrl/api/v1/image_to_image/inference';
  static const fetchResultsApi = '$baseUrl/api/v1/image_to_image/tasks';
  static const checkUserModelApi = '$baseUrl/api/v1/image_to_image/check-model';

  static const handleSubscriptionEventApi = '$baseUrl/api/v1/usage-limits/subscription_event';
  static const getFeatureLimitsApi = '$baseUrl/api/v1/usage-limits/';
  static const changeUserIdApi = '$baseUrl/api/v1/usage-limits/change_user_id';
}
