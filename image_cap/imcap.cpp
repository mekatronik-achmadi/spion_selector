#include <iostream>
#include <opencv2/core/core.hpp>
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"

using namespace cv;
using namespace std;

int main(){
  VideoCapture cap(1);
  if ( !cap.isOpened()){
      cout << "Cannot open the web cam" << endl;
      return -1;
  }
  Mat imgOriginal;
  bool bSuccess = cap.read(imgOriginal);
  if (!bSuccess) {
    cout << "Cannot read a frame from video stream" << endl;
  }
  else{
    imwrite("raw_image.jpg",imgOriginal);
  }
}