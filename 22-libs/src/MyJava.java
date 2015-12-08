//--------------------------
//MyJava
//(c) H.Buchmann FHNW 2015
//--------------------------
class MyJava
{
 static void myCall()
 {
  System.err.println("-------- myCall");
 }
 
 static native void myJNICall();

 static
 {
  System.loadLibrary("my-java");
 }
 
 public static void main(String args[])
 {
  myCall();
  myJNICall();
 }
}
