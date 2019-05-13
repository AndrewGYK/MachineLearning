function [all_theta] = oneVsAll(X, y, num_labels, lambda)

	m = size(X, 1);

	n = size(X, 2);

	all_theta = zeros(num_labels, n + 1);

	X = [ones(m, 1) X];

	initial_theta = zeros(n+1,1);

	options = optimset('GradObj', 'on', 'MaxIter', 100);

	for (i = 1 : num_labels)

		y_t = (y==i)

		all_theta(i,:) = fmincg(@(t)(lrCostFunction(t, X, y_t, 0.1)),initial_theta, options);

	end

end