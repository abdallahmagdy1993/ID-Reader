function name=name_detector(I)
recting=imrect();
roi = round(getPosition(recting));
delete(recting);
I = rgb2gray(I);
th = graythresh(I);
BW = im2bw(I, th);

results = ocr(BW, roi,'TextLayout', 'Block');
name=results.Text;
name= strtrim(name);

end