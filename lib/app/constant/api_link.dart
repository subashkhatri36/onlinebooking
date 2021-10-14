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

  ///update profile
  ///in headerr token : <token value> post
  ///"1)name
  ///2)about
  ///3)profile_pic
  ///Note : profile_pic should be multipart"
  static const String updateProfile =
      "http://www.programmingly.com/book/Profile/UpdateProfile";
/*
"{
    ""status"": ""true"",
    ""error_code"": ""S01"",
    ""message"": ""Profile Data"",
    ""show_alert"": ""false"",
    ""data"": {
        ""name"": ""vineeth"",
        ""about"": ""Test about"",
        ""profile_pic"": ""http://programmingly.com/book/web/upload/profile/profile_3_1630260275.jpeg"",
        ""bookList"": []
    }
}"
 */
  ///uploading books:
  ///in headerr token : <token value> post
/*
"1)title
2)category_id
3)synopsis
4)cover_image
5)pdf_file

Note : cover_image and pdf_file should be multipart"
 */
  static const String uploadbook =
      "http://www.programmingly.com/book/Book/UploadBook";
/*
"{
    ""status"": ""true"",
    ""error_code"": ""S01"",
    ""message"": ""Successfully uploaded the book"",
    ""show_alert"": ""false""
}"*/

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

//home
  ///token
  ///1)search_keyword
//Note : search_keyword is optional
  static const String home = "http://www.programmingly.com/book/Home/GetHome";

  static const String logout = "http://www.programmingly.com/book/Home/Logout";
}
