function out=load_database();
persistent w;
imgPath = 'images\';
images  = dir('images\*.jpg');
len=length(images);
v=zeros(len,128*128);   %example
%v=zeros(128*128,len);   %face recognition
 for idx = 1:len
    a = imread([imgPath images(idx).name]);
    a=rgb2gray(a);
    fprintf('%s\n',images(idx).name);
    v(idx,:)=reshape(a,size(a,1)*size(a,2),1);  %example
    %v(:,idx)=reshape(a,size(a,1)*size(a,2),1);  %face recognition
 end
w=uint8(v); % Convert to unsigned 8 bit numbers to save memory. 
out=w;
end

