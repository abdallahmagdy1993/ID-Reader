function exist=match_face(I1,I2)
    exist=0;
    %I1=imread('h_123_.jpg');
    I1=rgb2gray(I1);
    r1=reshape(I1,size(I1,1)*size(I1,2),1);
    
    %I2=imread('images\f_123_.jpg');
    I2=rgb2gray(I2);
    v=reshape(I2,size(I2,1)*size(I2,2),1);
    
    
    N=size(v,2);                               % Number of signatures used for each image.
    %% Subtracting the mean from v
    O=uint8(ones(1,size(v,2))); 
    m=uint8(mean(v));                 % m is the maen of all images.
    vzm=v-uint8(single(m)*single(O));   % vzm is v with the mean removed. 

    %% Calculating eignevectors of the correlation matrix
    % We are picking N of the 400 eigenfaces.
    L=single(vzm)'*single(vzm);
    [V,D]=eig(L);
    V=single(vzm)*V;
    V=V(:,end:-1:end-(N-1));            % Pick the eignevectors corresponding to the 10 largest eigenvalues. 


    %% Calculating the signature for each image
    cv=zeros(size(v,2),N);
    for i=1:size(v,2);
        cv(i,:)=single(vzm(:,i))'*V;    % Each row in cv is the signature for one image.
    end


    %% Recognition 
    %  Now, we run the algorithm and see if we can correctly recognize the face. 


    p=r1-m;                              % Subtract the mean
    s=single(p)'*V;
    z=[];
    for i=1:size(v,2)
        z=[z,norm(cv(i,:)-s,2)];
        if(rem(i,N)==0)end;
        drawnow;
    end

    [a,i]=min(z)
    if(a==0)
    exist=1;
    end


end

