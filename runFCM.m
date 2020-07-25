clear all 
clc 
load('iris.mat')

c = 3; 
metric = @euclidean;
X = iris(1:150,1:4);
m = 2;
Max = 1000;
tol = 1e-3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Data Normalization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[nr nc] = size(X); % SIZE X = 150*4
for i = 1:nc
   for j = 1:nr
     data(j, i) = (X(j, i)-std(X(:, i)))/mean(X(:, i)); %data מכיל את הערכים החדשים מנורמלים
   end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Running the Algorithms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%***************FCM************************
tic
[prediction,v] = fcmAlg(c, data, m, metric, Max, tol);
toc
disp("centroids:")
disp(v) %show centroids
disp("final labels prediction:")
disp (prediction) % show prediction
disp("-----------------------------------------------------------")
tic
disp("Comparison program:")
[centers,U] = fcm(data,c)
toc
prediction
