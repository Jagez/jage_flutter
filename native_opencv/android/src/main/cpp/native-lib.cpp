#include <opencv2/opencv.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/dnn/dnn.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/objdetect/objdetect.hpp>
#include <opencv2/ml/ml.hpp>
#include <errno.h>
#include <iostream>
#include <cstdio>
#include <ctime>
#include <vector>
#include <android/log.h>
#include <android/native_window_jni.h>
#include <android/asset_manager.h>
#include <android/asset_manager_jni.h>
using namespace cv;
using namespace std;

// Avoiding name mangling
// Attributes to prevent 'unused' function from being removed and to make it visible
#define OPENCV_API extern "C" __attribute__((visibility("default"))) __attribute__((used)) 

OPENCV_API 
const char* version() 
{
    return CV_VERSION;
}

OPENCV_API
void process_image(char* inputImagePath, char* outputImagePath) 
{
    Mat input = imread(inputImagePath, IMREAD_GRAYSCALE);
    Mat threshed, withContours;

    vector<vector<Point>> contours;
    vector<Vec4i> hierarchy;
    
    adaptiveThreshold(input, threshed, 255, ADAPTIVE_THRESH_GAUSSIAN_C, THRESH_BINARY_INV, 77, 6);
    findContours(threshed, contours, hierarchy, RETR_TREE, CHAIN_APPROX_TC89_L1);
    
    cvtColor(threshed, withContours, COLOR_GRAY2BGR);
    drawContours(withContours, contours, -1, Scalar(0, 255, 0), 4);
    
    imwrite(outputImagePath, withContours);
}

OPENCV_API
const char * erodePic(char * inputImagePath, char *outputImagePath)
{
    Mat pic = imread(inputImagePath);
    if (pic.empty())
    {
        return "input image is invaild.";
    }
    Mat element = getStructuringElement(MORPH_RECT, Size(20, 20));
	Mat resultPic;

	erode(pic, resultPic, element);
    imwrite(outputImagePath, resultPic);
    return "ok";
}

OPENCV_API
const char * dnnTest(char * modelImagePath, char *configImagePath, char *inputImagePath, char *outputImagePath)
{
	const char* classnames[] = {
		"background", "aeroplane", "bicycle", "bird", "boat", "bottle", "bus", "car"
		, "cat", "chair", "cow", "diningtable", "dog", "horse", "motorbike", "person", "pottedplant"
		, "sheep", "sofa", "train", "tvmonitor"
	};
	dnn::Net net =  dnn::readNetFromCaffe(configImagePath, modelImagePath);

	Mat img = imread(inputImagePath);


	//检测
	Mat blob = dnn::blobFromImage(img, 0.007843, Size(300, 300), cv::Scalar(127.5, 127.5, 127.5), false, false);
	net.setInput(blob, "data");
	std::string out_name;
	Mat detections = net.forward();

	Mat imgResize;
	auto layout_names = net.getLayerNames();
	 

	 auto id = net.getLayerId(layout_names[1]);
	 auto lastLayer = net.getLayer(id);

	 cv::Mat detectionResults(detections.size[2], detections.size[3], CV_32F, detections.ptr<float>());

	 // 遍历检测结果
	 for (int i = 0; i < detectionResults.rows; ++i)
     {
		 float confidence = detectionResults.at<float>(i, 2);
		 char confidence_str[20];
		 if (confidence > 0.5) 
         {

			 size_t obj_name_index = static_cast<size_t>(detectionResults.at<float>(i, 1));
			 // 提取检测框坐标等信息
			 int xLeftBottom = static_cast<int>(detectionResults.at<float>(i, 3) * img.cols);
			 int yLeftBottom = static_cast<int>(detectionResults.at<float>(i, 4) * img.rows);
			 int xRightTop = static_cast<int>(detectionResults.at<float>(i, 5) * img.cols);
			 int yRightTop = static_cast<int>(detectionResults.at<float>(i, 6) * img.rows);

			 Rect obj_rect((int)xLeftBottom, yLeftBottom, xRightTop - xLeftBottom, yRightTop - yLeftBottom);
			 // 绘制检测框
			 cv::rectangle(img, obj_rect, cv::Scalar(0, 255, 0), 2);
			 // 绘制分类标签

			 sprintf(confidence_str, "%s %.2f", classnames[obj_name_index], confidence);
			 std::string label = confidence_str;
			 int baseLine = 0;
			 cv::Size labelSize = cv::getTextSize(label, cv::FONT_HERSHEY_SIMPLEX, 0.5, 1, &baseLine);
			 cv::putText(img, label, cv::Point(xLeftBottom, yLeftBottom), cv::FONT_HERSHEY_SIMPLEX, 0.5, cv::Scalar(0, 255, 0), 2, 8, 0);
		 }
	 }
    imwrite(outputImagePath, img);
    return "ok";
}

extern "C"
{
    JNIEXPORT jstring
    JNICALL
    Java_com_example_native_opencv_NativeOpencvPlugin_getAssetFilePath(
            JNIEnv *env,
            jobject obj, /* this */
			jstring assetFileName) {
        
		// AAssetManager *mgr = AAssetManager_fromJava(env, assetManager);
		// if (mgr != nullptr) {
		// 	AAsset* asset_model = AAssetManager_open(mgr, "opencv/MobileNetV2SSD/MobileNetSSD_deploy.caffemodel", AASSET_MODE_BUFFER);
		// 	AAsset* asset_config = AAssetManager_open(mgr, "opencv/MobileNetV2SSD/MobileNetSSD_deploy.prototxt", AASSET_MODE_BUFFER);

		// 	off_t asset_model_size = AAsset_getLength(asset_model);
		// 	off_t asset_config_size = AAsset_getLength(asset_config);
		// 	const void* assetModelBuffer = AAsset_getBuffer(asset_model);
		// 	const void* assetConfigBuffer = AAsset_getBuffer(asset_config);

		// 	cv::Mat modelContent(1, asset_model_size, CV_8UC1, (void*)assetModelBuffer);
		// 	cv::Mat configContent(1, asset_config_size, CV_8UC1, (void*)assetConfigBuffer);

		// 	cv::dnn::Net net = cv::dnn::readNetFromCaffe(configContent, modelContent);

		// 	AAsset_close(asset_model);
		// 	AAsset_close(asset_config);
			
		// }

		const char* assetFileNameStr = env->GetStringUTFChars(assetFileName, nullptr);

		jclass nativeOpencvPluginClass = env->FindClass("com/example/native_opencv/NativeOpencvPlugin");
		jmethodID getAssetFilePathMethod = env->GetStaticMethodID(nativeOpencvPluginClass, "getAssetFilePath", "(Ljava/lang/String;)Ljava/lang/String;");

		jstring assetFilePath = static_cast<jstring>(env->CallStaticObjectMethod(nativeOpencvPluginClass, getAssetFilePathMethod, env->NewStringUTF(assetFileNameStr)));

		env->ReleaseStringUTFChars(assetFileName, assetFileNameStr);

		// return assetFilePath;
		return env->NewStringUTF("wfasf");
    }

// OPENCV_API
// void dnn(const std::string& assetFileName) {
//     JNIEnv* env;
//     // 获取JNIEnv对象
//     // if (JNI_OK != jvm->GetEnv(reinterpret_cast<void**>(&env), JNI_VERSION_1_6)) {
//     //     return;
//     // }

//     jclass nativeOpencvPluginClass = env->FindClass("com/example/native_opencv/NativeOpencvPlugin");
//     jmethodID getAssetFilePathMethod = env->GetStaticMethodID(nativeOpencvPluginClass, "getAssetFilePath", "(Ljava/lang/String;)Ljava/lang/String;");

//     jstring assetFilePath = static_cast<jstring>(env->CallStaticObjectMethod(nativeOpencvPluginClass, getAssetFilePathMethod, env->NewStringUTF(assetFileName.c_str())));

//     const char* assetFilePathStr = env->GetStringUTFChars(assetFilePath, nullptr);

//     cv::dnn::Net net = cv::dnn::readNetFromCaffe(assetFilePathStr);

//     env->ReleaseStringUTFChars(assetFilePath, assetFilePathStr);
// }
}
