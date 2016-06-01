function exist=match_face(I1,I2)
exist=0;
%F=load_database();
a=rgb2gray(I1);
F=zeros(1,128*128);   %example
F(1,:)=reshape(a,size(a,1)*size(a,2),1);  %example
NN  = size(F,1);        % Overal number of face images.
N=NN;
[U, S, V] = svd(double(F), 'econ');
PC = U*S;                                % the principle components


nDim = N;                   % dimensionality of the eigenfaces subspace
V1 = V(:,1:nDim);            % reduced basis of eigenfaces



PC_mean = zeros(N, nDim);       % average feature vectors for each subject
for ii=1:N
    PC_mean(ii,:) = mean(PC(ii,1:nDim));
end

I=double(rgb2gray(I2));
f = I(:);   % test face
pc1 = V1'*f;                       % its principle component

% Compute distances in the feature space
Dist = PC_mean - ones(N,1)*pc1';
dist = sqrt(mean(Dist.^2, 2));
[min_dist, min_ix] = min(dist)
if(min_dist<=50)
    exist=1;
end
% Plot
% figure(5); clf; set(gcf, 'Name', 'Face recognition')
% subplot(2,2,1); imagesc( reshape(f,m,n) );
% axis equal tight off; colormap gray;
% title('Test face');
% subplot(2,2,2); imagesc( reshape( F((min_ix),:), m,n) );
% axis equal tight off; colormap gray;
% title('Recognized as');
end