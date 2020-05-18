% verson: Matlab R2019a
% picking keypoints by man-eyes
load imageSet.mat

%% image contract
subplot(1,2,1);
imshow(img1);hold on
plot(1446,882,'ro');
plot(1456,1965,'bo');
plot(1017,797,'go');hold off

subplot(1,2,2);
imshow(img2);hold on
plot(1033,849,'ro');
plot(1053,1935,'bo');
plot(511,738,'go');hold off

%% deal with the keypoint
P = [1446,882;1456,1965;1017,797];
Q = [1033,849;1053,1935;511,738];

p_bar = mean(P);
q_bar = mean(Q);

x = P - p_bar;
y = Q - q_bar;

%% 1.find the rotation matrix by calculate
tan_theta = (x(:,2)'*y(:,1) - y(:,2)'*x(:,1))/(x(:,1)'*y(:,1) + y(:,2)'*x(:,2));

theta = atan(tan_theta);

R_c = [cos(theta) sin(theta); -sin(theta) cos(theta)];

%% 2.find the rotation matrix by SVD
S = x'*y;

[U ,~ ,V] = svd(S);

R_svd = V*U';

% compare R_c and R_svd
[R_c R_svd]
