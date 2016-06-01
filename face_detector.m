function face=face_detector(I)

% Create a cascade detector object.
faceDetector = vision.CascadeObjectDetector('FrontalFaceLBP');
% Read a video frame and run the detector.

bbox = step(faceDetector, I);
if(size(bbox)~=0)
    
    face   = imcrop(I,bbox(1,:));
    face = imresize(face,[128,128]);
end
end