function plotData(X,y)

	pos = find(y == 1);

	neg = find(y == 0);

	plot(X(pos, 1), X(pos, 2), 'k+','LineWidth', 2, 'MarkerSize', 7); 

	xlabel('Exam 1 score');
	
	ylabel('Exam 2 score');

	hold on;
	
	plot(X(neg, 1), X(neg, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);

	legend('Admitted', 'Not admitted')
end