import 'environment.dart';

const BASE_MOVIE =  BASE_URL + "movie/";
const KEY = "?api_key=" + API_KEY;

const REVIEWS =  "/reviews" + KEY;

const POPULAR_MOVIE = BASE_MOVIE + "popular" + KEY;
const NOW_PLAYING =  BASE_MOVIE + "now_playing" + KEY;
const UPCOMING_MOVIE =  BASE_MOVIE + "upcoming" + KEY;

const BASE_TV =  BASE_URL + "tv/";

const POPULAR_TV = BASE_TV + "popular" + KEY;
const NOW_TV =  BASE_TV + "on_the_air" + KEY;
