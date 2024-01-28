20240128      cdc-acm.c,cdc-acm.h  

/*
 * USB driver structure.
 */

static const struct usb_device_id acm_ids[] = { \
	/* quirky and broken devices */ \
	{ USB_DEVICE(0x303A, 0x1001), /* ESP32C3 USB DRIVER */   \
	.driver_info = NO_UNION_NORMAL, \
	},   // NO_UNION_NORMAL,SINGLE_RX_URB,NOT_A_MODEM,IGNORE_DEVICE \
	{ USB_DEVICE(0x2341, 0x0043), /* Arduino SA Uno R3 USB DRIVER 2*/   \
	.driver_info = NO_UNION_NORMAL, \
	},  \
	{ USB_DEVICE(0x26ac, 0x0011), /* Generic Pixhawk1-BL USB DRIVER 2*/ \  
	.driver_info = NO_UNION_NORMAL, \
	},  \
	{ } \
}; \

test ok - ESP32C3 USB,Arduino SA Uno R3 USB, Pixhawk1-BL USB


[경고는 컴파일러]

WARNING: __dynamic_pr_debug; [/home/kkk/cdcam-03/cdcwdm.ko] undefined!
WARNING: __dynamic_dev_dbg; [/home/kkk/cdcam-03/cdcwdm.ko] undefined!

__dynamic_dev_dbg이 정의되지 않은 경고는 컴파일러가 해당 함수 또는 매크로를 찾을 수 없을 때 발생합니다. 이 오류는 주로 로깅 및 
디버깅 기능과 관련된 코드에서 나타납니다.


[해결]
#define cdc_dev_dbg(dev, format, arg...) dev_printk(KERN_DEBUG, dev, format, ## arg)



# CDC-ACM-USB-CDC

CDC-ACM은 "Communications Device Class - Abstract Control Model"의 약자로, USB로 연결된 장치 간에 통신을 위한 표준 프로토콜이다. 
CDC-ACM은 주로 시리얼 통신을 지원하는 USB 장치 간에 사용된다. 
이는 주로 모뎀, 시리얼 통신을 지원하는 센서, 기타 장치들과 컴퓨터 사이의 통신을 위해 사용된다.

CDC-ACM 프로토콜은 USB CDC 클래스의 하나로, USB 장치가 특정한 역할을 수행하기 위해 사용하는 일종의 드라이버이다. 
CDC 클래스는 여러 가지 응용 분야에 사용될 수 있으며, CDC-ACM은 주로 시리얼 통신에 중점을 둔다.

CDC-ACM을 사용하면 USB를 통해 연결된 장치가 마치 일반적인 시리얼 포트처럼 동작할 수 있다. 이는 다양한 장치와 호환성을 제공하며, 
특히 임베디드 시스템에서 센서나 다양한 제어 장치와의 통신을 쉽게 구현할 수 있도록 도와준다.

USB CDC 클래스는 통신의 추상화를 제공하므로, 특정한 통신 장치에 종속되지 않고 다양한 USB 호스트와 장치 간에 쉽게 통신할 수 있도록 해준다. 
CDC-ACM은 이러한 기능을 특히 시리얼 통신에 중점을 두고 구현한 것이다.


CDC-ACM stands for "Communications Device Class - Abstract Control Model," and it is a standard protocol for communication 
between devices connected via USB. CDC-ACM is primarily used for USB devices that support serial communication, such as modems,
 sensors with serial communication capabilities, and other devices for communication between the device and a computer.

The CDC-ACM protocol is one of the USB CDC classes, serving as a kind of driver that USB devices use to perform specific roles. 
The CDC class can be applied in various fields, and CDC-ACM specifically focuses on serial communication.

By using CDC-ACM, a device connected via USB can operate like a typical serial port. This provides compatibility with various devices, 
facilitating easy implementation of communication with sensors and various control devices, especially in embedded systems.

The USB CDC class offers communication abstraction, allowing easy communication between various USB hosts and devices without
 being dependent on a specific communication device. CDC-ACM is designed with a particular emphasis on implementing these 
 features for serial communication.



 
