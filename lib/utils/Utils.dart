class Utils{
  static String imagePath(String img,{String format:"png"}){

    return "assets/images/$img.$format";
  }
}