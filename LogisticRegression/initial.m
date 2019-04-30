function [X,y,theta,inter,alpha] = initial(data)
	
	y = data(:,3);

	m = length(y);

	X = [ones(m,1),data(:,1),data(:,2)];

	theta = [90;-1;-1];

	inter = 1500;

	alpha = 0.001;

end