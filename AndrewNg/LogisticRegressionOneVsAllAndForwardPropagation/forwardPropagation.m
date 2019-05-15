function p = forwardPropagation(Theta1, Theta2, X)

m = size(X, 1);
num_labels = size(Theta2, 1);

X = [ones(m,1),X]; 

p = zeros(size(X, 1), 1);

a = [ones(m,1),sigmoid(X * Theta1')];
 
[val,p] = max(sigmoid(a * Theta2'),[],2);

end
