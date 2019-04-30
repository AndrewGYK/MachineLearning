function [J,theta] = gradientDescent(X,y,theta,alpha,num_iters)
	
	m = length(y);

	J_history = zeros(num_iters, 1);

	theta_t = theta;

	for iter = 1 : num_iters

		theta(1) = theta(1) - (alpha/m) * sum((sigmoid(X * theta_t) - y));

		theta(2) = theta(2) - (alpha/m) * sum((sigmoid(X * theta_t) - y) .* X(:,2));

		theta(3) = theta(3) - (alpha/m) * sum((sigmoid(X * theta_t) - y) .* X(:,3));

		theta_t = theta;

		J(iter) = cost(theta_t,X,y);

	end
	
end