function [J grad] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda)

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

m = size(X, 1);

J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

Y = zeros(m, num_labels);

for i=1:m

  Y(i,y(i))=1;

end

a1 = [ones(m,1),X];
z2 = a1 * Theta1';
a2 = [ones(m,1),sigmoid(z2)];
z3 = a2 * Theta2';
a3 = sigmoid(z3);

cost = Y .* log(a3) + (1-Y) .* log(1-a3);

Theta1_tem = [zeros(hidden_layer_size,1),Theta1(:,2:end)];
Theta2_tem = [zeros(num_labels,1),Theta2(:,2:end)];

J= -1 / m * sum(cost(:)) + lambda/(2*m) * ( sum(Theta1_tem(:).^2)+ sum(Theta2_tem(:).^2) );

delta_1 = zeros(size(Theta1));
delta_2 = zeros(size(Theta2));

for i = 1 : m
  a1 = [1 ; X(i,:)'];
  z2 =  Theta1 * a1;
  a2 = [1 ; sigmoid(z2)];
  z3 = Theta2 * a2;
  a3 = sigmoid(z3);

  erro3 = zeros(num_labels,1);
  erro3 = a3 - Y(i,:)';
  erro2 = (Theta2' * erro3)(2 : end) .* (a2(2:end) .* (1 - a2(2:end))); % The erro of bias unit should be get rid of.
  delta_1 = delta_1 + erro2 * a1';
  delta_2 = delta_2 + erro3 * a2';

end


Theta1_temp = [zeros(size(Theta1,1),1) Theta1(:,2:end)];
Theta2_temp = [zeros(size(Theta2,1),1) Theta2(:,2:end)];
Theta1_grad = 1 / m * delta_1 + lambda/m * Theta1_temp;
Theta2_grad = 1 / m * delta_2 + lambda/m * Theta2_temp;




grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
