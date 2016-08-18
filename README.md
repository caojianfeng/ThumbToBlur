# ThumbToBlur

## What?
Covert a thumb image to a big blurred image.

![thumb](http://i1.buimg.com/565547/875d874940330ed8.png) **=>** ![big blurred](http://i4.buimg.com/565547/c2c63179fc6bc007t.jpg)


## Why?

The thumb image file size is small then the blur image one.

This can improve on your network time performance.

## How much?

| THUMB BLUR|DIRECT BLUR |
|:---:|:---:|
|[origin(webp 33K)](http://i4.buimg.com/565547/60f3d230a18d6529.jpg)|[origin(webp 33K)](http://i4.buimg.com/565547/60f3d230a18d6529.jpg)|
|![origin](http://i4.buimg.com/565547/60f3d230a18d6529t.jpg)|![origin](http://i4.buimg.com/565547/60f3d230a18d6529t.jpg)|
|thumb(3,800B)|direct|
|![thumb](http://i1.buimg.com/565547/875d874940330ed8.png)||
|thumb then resize then blurred |blur directly(5,302B)|
|![thumb then blurred](http://i4.buimg.com/565547/c2c63179fc6bc007t.jpg)|![blur directly](http://i4.buimg.com/565547/bd4fca52101fd622t.jpg)|


## Blur performance

Don`t test performance on your simulator there`s no GPU support.

Try on my iPhone 6 . I got this:

8-30 ms for a (320,213)pic

```
2016-08-18 13:11:09.880 testBlurUrl[5403:4840131] image 'test.webp' not found
2016-08-18 13:11:09.885 testBlurUrl[5403:4840131] using image 'test.jpg'
2016-08-18 13:11:09.886 testBlurUrl[5403:4840131] image size = (320,213)
2016-08-18 13:11:13.887 testBlurUrl[5403:4840131] begin 1471497073887
2016-08-18 13:11:13.917 testBlurUrl[5403:4840162] end  1471497073917 , used 30ms
2016-08-18 13:11:17.021 testBlurUrl[5403:4840131] begin 1471497077021
2016-08-18 13:11:17.039 testBlurUrl[5403:4840162] end  1471497077039 , used 18ms
2016-08-18 13:11:18.240 testBlurUrl[5403:4840131] begin 1471497078240
2016-08-18 13:11:18.259 testBlurUrl[5403:4840163] end  1471497078259 , used 19ms
2016-08-18 13:11:19.506 testBlurUrl[5403:4840131] begin 1471497079506
2016-08-18 13:11:19.514 testBlurUrl[5403:4840162] end  1471497079514 , used 8ms
2016-08-18 13:11:20.473 testBlurUrl[5403:4840131] begin 1471497080473
2016-08-18 13:11:20.481 testBlurUrl[5403:4840163] end  1471497080481 , used 8ms
2016-08-18 13:11:21.157 testBlurUrl[5403:4840131] begin 1471497081157
2016-08-18 13:11:21.166 testBlurUrl[5403:4840155] end  1471497081166 , used 9ms
2016-08-18 13:11:21.758 testBlurUrl[5403:4840131] begin 1471497081758
2016-08-18 13:11:21.768 testBlurUrl[5403:4840155] end  1471497081768 , used 10ms
2016-08-18 13:11:22.641 testBlurUrl[5403:4840131] begin 1471497082641
2016-08-18 13:11:22.649 testBlurUrl[5403:4840162] end  1471497082649 , used 8ms

```