function [J, grad] = lrCostFunction(theta, X, y, lambda)
 
m = length(y);
J = 0;
grad = zeros(size(theta));
h = sigmoid(X*theta);


J=(y'*log(h)+(1-y)'*log(1-h))/(-m);
 
theta(1)=0;
 
J+=theta'*theta*lambda/(2*m);
grad=((X'*(h-y))+lambda*theta)/m;
 
grad = grad(:);

end