LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
	
#1 定义查找所有cpp文件的宏  
define all-cpp-files-under  
$(patsubst jni/%,%, $(shell find $(LOCAL_PATH) -name "*.cpp" -and -not -name ".*")  )
endef  
  
define all-subdir-cpp-files  
$(call all-cpp-files-under, .)  
endef 

LOCAL_C_INCLUDES  := $(LOCAL_PATH) 		\
					$(LOCAL_PATH)/taglib 		\
                    $(LOCAL_PATH)/taglib/toolkit	\
                    $(LOCAL_PATH)/taglib/mpeg/id3v1	\
                    $(LOCAL_PATH)/taglib/mpeg/id3v2		\
                    $(LOCAL_PATH)/taglib/mpeg/id3v2/frames		\
                    $(LOCAL_PATH)/taglib/mpeg	\
                    $(LOCAL_PATH)/taglib/riff/aiff	\
                    $(LOCAL_PATH)/taglib/riff	\
           			$(LOCAL_PATH)/taglib/riff/wav	\
           			$(LOCAL_PATH)/taglib/ape		\
           			$(LOCAL_PATH)/taglib/mod		\
           			$(LOCAL_PATH)/taglib/asf		\
           			$(LOCAL_PATH)/taglib/it		\
           			$(LOCAL_PATH)/taglib/xm		\
           			$(LOCAL_PATH)/taglib/s3m		\
           			$(LOCAL_PATH)/taglib/flac		\
           			$(LOCAL_PATH)/taglib/mp4		\
           			$(LOCAL_PATH)/taglib/mpc		\
           			$(LOCAL_PATH)/taglib/ogg		\
           			$(LOCAL_PATH)/taglib/wavpack		\
           			$(LOCAL_PATH)/taglib/ogg/vorbis		\
           			$(LOCAL_PATH)/taglib/ogg/opus	\
           			$(LOCAL_PATH)/taglib/ogg/speex	\
           			$(LOCAL_PATH)/taglib/ogg/flac	\
           			$(LOCAL_PATH)/taglib/trueaudio
LOCAL_CFLAGS := -Wno-error=non-virtual-dtor -frtti

LOCAL_SRC_FILES := $(call all-subdir-cpp-files)  					
$(info $(LOCAL_SRC_FILES))																						
LOCAL_MODULE    := Taglib
LOCAL_LDLIBS := -llog 

include $(BUILD_SHARED_LIBRARY)
