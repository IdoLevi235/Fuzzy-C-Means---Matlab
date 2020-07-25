function [prediction v] = fcm(c, X, m, metric, Max, tol)
[n, no] = size(X); % n = 150, n0=4
U = zeros([c, n]); 
v = repmat(max(X), c, 1).*rand([c, no]);

U = rand([c, n]); %מטריצת ציונים 3 שורות 150 עמודות
for j = 1:n
      U(:, j) = U(:, j)./sum(U(:, j));    
end 


%centroids calculation
for i = 1:c
      v(i, :) = sum((X(:, :).*repmat(U(i, :)'.^m, 1, no)),1)./sum(U(i, :).^m);
end
%centroids calculation end


% objective function
v_old = v;
delta = 10000;
k = 0; % iterations
%tol=0.001 
while  (k<Max & delta>tol)
    for i = 1:c
      for j = 1:n
        U(i, j)=(1/sum((metric(X(j, :), v(i, :))./metric(X(j, :), v)).^(2/(m-1))));
        
      end
% objective function end
% centroids calculaations
    end
    for i = 1:c
       v(i, :) = sum((X(:, :).*repmat(U(i, :)'.^m, 1, no)), 1)./sum(U(i, :).^m);  
    end
%centroids calculations end
v_new = v; 

delta = max(max(abs(v_new-v_old)));
v_old = v;

k = k+1; %%
end

disp("iterations:")
disp(k)
disp("final membership matrix:")
disp(U)
prediction = zeros([1, n]);
for i = 1:n
   [M, prediction(i)]=max(U(:, i));
end


end