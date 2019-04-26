function theta = gradientDescent(X, y, theta, alpha, num_iters)

	m = length(y);

	theta_t = theta;

	for iter = 1:num_iters

		theta(1) = theta(1) - (alpha / m) * sum(X * theta_s - y);

		theta(2) = theta(2) - (alpha / m) * sum((X * theta_s - y) .* X(:,2));

		//theta(3)=  theta(3) - (alpha / m) * sum((X * theta_s - y) .* X(:,3));

		theta_t = theta;

	end
	
end