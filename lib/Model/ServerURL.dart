

class ServerURL {

  static String baseurl = "https://www.indiacart.ca/webbeta/public/api/categories?pagination=0";

  static getUrl(RequestType RequestTypes) {
    switch (RequestTypes) {
      case RequestType.categories:
        return baseurl;

    }
  }

}


enum RequestType {

  categories,

}