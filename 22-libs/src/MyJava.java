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
 static native void myJNInit();
 
 static
 {
  System.out.println("loadLibrary");
  System.loadLibrary("my-java");
  myJNInit();
 }

 public static void main(String args[])
 {
  myCall();
  myJNICall();
 }
}
