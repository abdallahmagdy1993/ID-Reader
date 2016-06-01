function I=capture();


%creating a "videoinput" abject 'v'
v=videoinput('winvideo', 1, 'YUY2_640x480');
set(v, 'ReturnedColorSpace', 'RGB');
%Setting the "FramesPerTrigger" value to '1'
v.FramesPerTrigger= 30;
%for previewing window of the "videoinput" object 'v'
preview(v);
%start capturing
start(v);
%for warming up of webcam
pause(5.0);% Get image data from webcam
I=getsnapshot(v);
%displaying the captured image
%figure,imshow(im);
%deleting the "videoinput" object to avoid filling up of memory
delete(v);

end