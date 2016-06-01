function insert_DB(I,Pass,Name)
imgPath = 'images\';
image=strcat(imgPath,Name,'_',Pass,'_','.jpg');
imwrite(I,image);
msgbox('User Inserted Successfully');
end

