function array=load_DB()
struct('image',{},'password',{},'name',{});
array=struct('image',{},'password',{},'name',{});

imgPath = 'images\';
images  = dir('images\*.jpg');
for idx = 1:length(images)
    array{idx}.image = imread([imgPath images(idx).name]);
    S=strsplit(images(idx).name,'_');
    array{idx}.name =S(1);
    array{idx}.password=S(2);
    
end
end

