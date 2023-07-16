M = 10;
m = 2:M;
MSE = zeros(1,length(m));
sigma = 15;
E = 5;
for i = 1:length(MSE)
	E = E+5;
	R = randn(m(i));
	MSE_M = (R+eye(m(i)).*sigma)./(m(i)*E);
	MSE(i) = norm(MSE_M);
end
plot(m,MSE)