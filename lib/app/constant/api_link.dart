class Api {
  static const String shaidInsert = '';
  //for login
  //email,password
  static const String login = 'http://www.programmingly.com/book/Login/Login';

  //for register username must be email
  //name,username,password,confirmpassword
  static const String register = 'http://www.programmingly.com/book/Register/';

//category list
//
  static const String categoryList =
      'http://www.programmingly.com/book/Category/GetCategoryList';

  ///profile data
  ///in headerr token : <token value> post
  static const String profileData = "http://www.programmingly.com/book/Profile";

  static const String bookList =
      "http://www.programmingly.com/book/Book/BookList";

  static const String updateProfile =
      "http://www.programmingly.com/book/Profile/UpdateProfile";

  static const String uploadbook =
      "http://www.programmingly.com/book/Book/UploadBook";

  static const String bookDetails =
      "http://www.programmingly.com/book/Book/BookDetails";

//reading books

  static const String readBooks =
      "http://www.programmingly.com/book/Book/ReadBook";
/*
"{
    ""status"": ""true"",
    ""error_code"": ""S01"",
    ""message"": ""Book Details"",
    ""show_alert"": ""false"",
    ""data"": {
        ""bookDetails"": {
            ""title"": ""Test title"",
            ""cover_photo"": ""http://programmingly.com/book/web/uploads/cover/cover_Test title3_1630260523.jpeg"",
            ""author"": ""vineeth"",
            ""synopsis"": ""Test synopsis"",
            ""pdf_file"": ""http://programmingly.com/book/web/uploads/pdf/book_Test title3_1630260523.pdf"",
            ""author_id"": ""3""
        }
    }
}" */

  ///about author
  ///
  static const String aboutAuthor =
      "http://www.programmingly.com/book/Book/Aboutauthor";

//forget password
//email

  static const forgetPassword =
      "http://www.programmingly.com/book/Login/resetPassword";

  //bookmarks
  static const bookmark = "http://www.programmingly.com/book/Book/Bookmark";

//home
  ///token
  ///1)search_keyword
//Note : search_keyword is optional
  static const String home = "http://www.programmingly.com/book/Home/GetHome";

  static const String logout = "http://www.programmingly.com/book/Home/Logout";
}
