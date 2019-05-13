function [J, grad] = lrCostFunction(theta, X, y, lambda)
 
m = length(y);

J = 0;

grad = zeros(size(theta));

J = -1 * sum( y .* log( sigmoid(X*theta) ) + (1 - y ) .* log( (1 - sigmoid(X*theta)) ) ) / m ;

theta(1)=0;
 
J+=theta'*theta*lambda/(2*m);

grad=((X'*(sigmoid(X*theta)-y))+lambda*theta)/m;

grad = grad(:);

end