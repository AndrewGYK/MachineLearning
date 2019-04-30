function [X,y,theta] = initial(data)

	[m,n] = size(data);
	
	y = data(:,3);

	X = [ones(m,1),data(:,[1,2]];

	theta = zeros(n,1);

end