function b_opt = ICC_main(r_gw, r_uw, csi_feed, b_crs, b_srs, gamma_1)
h_gw = r_gw./b_crs;
h_wu = r_uw./b_srs;
h_gu = csi_feed;

Q = null(h_gw);
b_int = (((Q*(Q')-eye(length(h_gu)))*h_gu).*b_crs)./h_wu;

a = ((Q*(Q')*h_gu - 0.1).*b_crs)./h_wu;
rho_s = 10^((-7)/10)  ;                              % Signal power of gNB
r_ue = h_gu.*b_crs + h_wu.*b_int;
w = r_ue./b_crs;
b = ((rho_s)/((sqrt(1+gamma_1)-1)))*norm((w')*h_gu);
mu_opt1 = (((b*(1+sqrt(1-norm(a)))))/(norm(a)+b*(1+sqrt(1-norm(a)))));
mu_opt2 = (((b*(1-sqrt(1-norm(a)))))/(norm(a)+b*(1-sqrt(1-norm(a)))));
mu_opt = -1*((mu_opt1+mu_opt2)/2)*a;

b_opt = b_int + mu_opt;