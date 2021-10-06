class Api {
  static const String shaidInsert = '';
  //for login
  //email,password
  static const String login = 'http://www.programmingly.com/book/Login/Login';

  /*
      {
    "status": "true",
    "error_code": "S01",
    "message": "Successfully logined",
    "show_alert": "false",
    "data": {
        "id": "3",
        "name": "Vineeth v",
        "status": "1",
        "last_login_time": "1630219340",
        "last_login_ip": "127.0.0.1",
        "token": "ut-d0334e2ca352ebb03efc7d986c28e7b073c85f087cd6e0ae324e7a4e0f99255c"
    }
} */

  //for register username must be email
  //name,username,password,confirmpassword
  static const String register = 'http://www.programmingly.com/book/Register/';
/*
"{
    ""status"": ""true"",
    ""error_code"": ""S01"",
    ""message"": ""Successfully registered"",
    ""show_alert"": ""false""
}"
 */
//category list
//
  static const String categoryList =
      'http://www.programmingly.com/book/Category/GetCategoryList';
/*
"{
    ""status"": ""true"",
    ""error_code"": ""S01"",
    ""message"": ""Successfully logined"",
    ""show_alert"": ""false"",
    ""data"": {
        ""id"": ""3"",
        ""name"": ""Vineeth v"",
        ""status"": ""1"",
        ""last_login_time"": ""1630219340"",
        ""last_login_ip"": ""127.0.0.1"",
        ""token"": ""ut-d0334e2ca352ebb03efc7d986c28e7b073c85f087cd6e0ae324e7a4e0f99255c""
    }
}"
 */

  ///profile data
  ///in headerr token : <token value> post
  static const String profileData = "http://www.programmingly.com/book/Profile";
/*
"{
    ""status"": ""true"",
    ""error_code"": ""S01"",
    ""message"": ""Profile Data"",
    ""show_alert"": ""false"",
    ""data"": {
        ""name"": ""Vineeth v"",
        ""about"": ""Test about us test about us"",
        ""profile_pic"": ""http://programmingly.com/book/web/upload/profile/profile_3_1630238086.jpeg"",
        ""bookList"": []
    }
}"
 */

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
}"
 */
  ///books details
  ///1)book_id
  static const String bookDetails =
      "http://www.programmingly.com/book/Book/BookDetails";
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
}"

 */

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
/*
"{
    ""status"": ""true"",
    ""error_code"": ""S01"",
    ""message"": ""Author Data"",
    ""show_alert"": ""false"",
    ""data"": {
        ""name"": ""vineeth"",
        ""about"": ""Test about"",
        ""profile_pic"": ""http://programmingly.com/book/web/upload/profile/profile_3_1630260275.jpeg""
    }
}"
 */

//forget password
//email

  static const forgetPassword =
      "http://www.programmingly.com/book/Login/resetPassword";
/*
"{
    ""status"": ""true"",
    ""error_code"": """",
    ""message"": ""Password sent to Mail"",
    ""show_alert"": ""true""
}"
 */

//home
  ///token
  ///1)search_keyword
//Note : search_keyword is optional
  static const String home = "http://www.programmingly.com/book/Home/GetHome";

  ///---------------------------------------------
/*

"if search keyword is empty
{
    ""status"": ""true"",
    ""error_code"": """",
    ""message"": ""Trending Books and Category List"",
    ""show_alert"": ""false"",
    ""data"": {
        ""bookDetail"": [
            {
                ""id"": ""1"",
                ""title"": ""Test title1"",
                ""author"": ""vineeth"",
                ""cover_photo"": """",
                ""synopsis"": ""Test synopsis""
            },
            {
                ""id"": ""2"",
                ""title"": ""Test title"",
                ""author"": ""vineeth"",
                ""cover_photo"": ""http://programmingly.com/book/web/uploads/cover/cover_Test title3_1630260523.jpeg"",
                ""synopsis"": ""Test synopsis""
            }
        ],
        ""categoryList"": [
            {
                ""id"": ""1"",
                ""name"": ""Drama"",
                ""image"": ""http://programmingly.com/book/bo/web/uploads/category/drama.png""
            }
        ],
        ""search"": ""false""
    }
}

if search keyword id not empty

{
    ""status"": ""true"",
    ""error_code"": """",
    ""message"": ""Trending Books and Category List"",
    ""show_alert"": ""false"",
    ""data"": {
        ""bookDetail"": [
            {
                ""id"": ""1"",
                ""title"": ""Test title1"",
                ""author"": ""vineeth"",
                ""cover_photo"": """",
                ""synopsis"": ""Test synopsis""
            }
        ],
        ""categoryList"": [
            {
                ""id"": ""1"",
                ""name"": ""Drama"",
                ""image"": ""http://programmingly.com/book/bo/web/uploads/category/drama.png""
            }
        ],
        ""search"": ""true""
    }
}"

 */
}
