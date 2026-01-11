import 'package:flutter/foundation.dart';

/// A class containing all string constants used across the app.
/// These strings help maintain consistency and make it easier to manage text content centrally.
@immutable
class Strings {
  // General app information
  static const appName = 'Musicland';
  static const welcomeToAppName = 'Welcome to ${Strings.appName}!';
  static const loading = "Loading...";

  // Bottom navigation bar
  static const posts = 'Posts';
  static const search = 'Search';
  static const addPost = 'Add Post';
  static const profile = 'Profile';
  // App bar titles per tab
  static const allAds = 'All Ads';
  static const createAd = 'Create Ad';

  // Add post view
  static const addPostView = 'Add Post';

  // Dialogs
  static const logOut = 'Log Out';
  static const areYouSureThatYouWantToLogOutOfTheApp =
      'Are you sure that you want to log out of the app?';
  static const cancel = 'Cancel';
  static const delete = 'Delete';
  static const areYouSureYouWantToDeleteThis =
      'Are you sure you want to delete this';

  // Messages related to posts
  static const youHaveNoPosts =
      'You have not made a post yet. Press either the video-upload or the photo-upload buttons at the top of the screen to upload your first post!';
  static const noPostsAvailable =
      "Nobody seems to have made any posts yet. Why don't you take the first step and upload your first post?!";

  // Search-related messages
  static const enterYourSearchTerm =
      'Enter your search term to get started. You can search in the description of all posts available in the system';

  // Third-party integration
  static const google = 'Google';
  static const googleSignupUrl = 'https://accounts.google.com/signup';

  // Login and account-related messages
  static const logIntoYourAccount = 'Log into your account.';
  static const dontHaveAnAccount = "Don't have an account?\n";
  static const signUp = 'Sign up';
  static const orCreateAnAccountOn = ' or create an account on ';

    // Post interaction strings
  static const checkOutThisPost = 'Check out this post!';
  static const postDetails = 'Post Details';
  static const post = 'post';
  static const createNewPost = 'Create New Post';
  static const pleaseWriteYourMessageHere = 'Please write your message here';
  static const person = 'person';
  static const people = 'people';
  static const likedThis = 'liked this';

    // Comments-related message

  // Search input hint
  static const enterYourSearchTermHere = 'Enter your search term here';

  // Private constructor to prevent instantiation
  const Strings._();
}
