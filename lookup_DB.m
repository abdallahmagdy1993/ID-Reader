function exist=lookup_DB(I,Pass,Name)
exist=0;
array=load_DB();
for i=1:length(array)
    a=strcmp(Name,char(array{i}.name));
    b=strcmp(Pass,char(array{i}.password));
    c=match_face(I,array{i}.image);
    if(a~=0&&b~=0&&c==1)
        exist=1;
        break;
    end
    
end
end

