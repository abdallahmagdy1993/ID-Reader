function delete_DB(I,Pass,Name)

%% check for existence
exist=lookup_DB(I,Pass,Name);
if(exist==1)
    imgPath = 'images\';
    image=strcat(imgPath,Name,'_',Pass,'_','.jpg');
    delete(image);
    msgbox('User Deleted successfully');
end
end

