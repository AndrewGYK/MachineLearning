function plot_decisionBoundary(X,y,theta)
	
	xa = X(:,2);

	ya = (-theta(1)-(X(:,2)*theta(2))) / theta(3);

	plot(xa,ya,'-');

end

