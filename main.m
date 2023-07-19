%% Script to show experimental results

%% Channel estimation error with SNR=5dB
figure;
plot(gnb,mse_snr5_hgw,'-*r',gnb,mse_snr5_hwu,'-ob');
xlabel('No. of gNB antennas');
ylabel('MSE');
ylim([0 0.4]);
legend('h_{gW}','h_{WU}','Location','best');
title('Channel estimation error with SNR=5dB');

%% Channel estimation error with SNR=10dB
figure;
plot(gnb,mse_snr10_hgw,'-*r',gnb,mse_snr10_hwu,'-ob');
xlabel('No. of gNB antennas');
ylabel('MSE');
ylim([0 0.4]);
legend('h_{gW}','h_{WU}','Location','best');
title('Channel estimation error with SNR=10dB');

%% Channel estimation error with SNR=15dB
figure;
plot(gnb,mse_snr15_hgw,'-*r',gnb,mse_snr15_hwu,'-ob');
xlabel('No. of gNB antennas');
ylabel('MSE');
ylim([0 0.4]);
legend('h_{gW}','h_{WU}','Location','best');
title('Channel estimation error with SNR=15dB');

%% Nullification with SNR=5,10,15dB
figure;
semilogy(gnb,null_snr_15,'-*r',gnb,null_snr_10,'-ob',gnb,null_snr_5,'-squareg');
xlabel('No. of gNB antennas');
ylabel('w^Hh_{gW} (dB)');
ylim([10^(-2) 1]);
yticklabels([-20 -10 0]);
legend('SNR=15dB','SNR=10dB','SNR=5dB','Location','best');
title('Nullification with SNR=5,10,15dB');

%% Nullification with noise at AP and UE
figure;
semilogy(null_ap_ue_snr,null_ap,'-squarer',null_ap_ue_snr,null_ue,'-^b');
xlabel('SNR (dB)');
ylabel('w^Hh_{gW} (dB)');
ylim([10^(-2) 1]);
yticklabels([-20 -10 0]);
legend('AP','UE','location','best');
title('Nullification with noise at AP and UE');

%% RSSI UE
figure;
plot(gnb,rssi_ue_icc_off,'-*r',gnb,rssi_ue_icc_on,'-ob');
ylim([-72 -62]);
xlabel('No. of gNB antennas');
ylabel('RSSI (dBm)');
legend('ICC OFF','ICC ON','Location','best');
title('gNB downlink RSSI at UE');

%% RSSI Wifi
figure;
plot(gnb,rssi_wifi_icc_off,'-*r',gnb,rssi_wifi_icc_on,'-ob');
hold on;
yline(-79);
ylim([-90 -60]);
xlabel('No. of gNB antennas');
ylabel('RSSI (dBm)');
legend('ICC OFF','ICC ON','Wi-Fi ED','Location','best');
title('gNB downlink RSSI at AP');

%% Data rate ICC only
figure;
plot(chan_cap_snr,data_wifi_icc_off,'-vr',chan_cap_snr,data_wifi_icc_on,'-^b',chan_cap_snr,data_nru_icc_off,'-*m',chan_cap_snr,data_nru_icc_on,'-og',chan_cap_snr,data_sys_icc_on,'-squarek');
xlabel('SNR (dB)');
ylabel('Data Rate (Mbps)');
legend('Wi-Fi ICC OFF','Wi-Fi ICC ON','NR-U ICC OFF','NR-U ICC ON','System ICC ON','location','best');
title('Data rate of NR-U and Wi-Fi with ICC ON/OFF');

%% Data rate comparison
figure;
plot(chan_cap_snr,data_wifi_obo,'-vr',chan_cap_snr,data_wifi_icc,'-^b',chan_cap_snr,data_nru_obo,'-*m',chan_cap_snr,data_nru_icc,'-og');
xlabel('SNR (dB)');
ylabel('Data Rate (Mbps)');
legend('Wi-Fi with OBO','Wi-Fi with ICC','NR-U with OBO','NR-U with ICC','location','best');
title('Data rate comparison of ICC and OBO');

%% Channel capacity comparison
figure;
plot(chan_cap_snr,chan_cap_wifi_obo,'-vr',chan_cap_snr,chan_cap_wifi_icc,'-^b',chan_cap_snr,chan_cap_nru_obo,'-*m',chan_cap_snr,chan_cap_nru_icc,'-og');
xlabel('SNR (dB)');
ylabel('Channel Capacity (Mbps)');
legend('Wi-Fi with OBO','Wi-Fi with ICC','NR-U with OBO','NR-U with ICC','location','best');
title('Channel capacity comparison of ICC and OBO');

%% Channel estimation error exp
figure;
plot(snr,mse_exp,'-or',snr,mse_theory,'-*b');
xlabel('SNR (dB)');
ylabel('Channel Estimation MSE');
legend('Experiment','Theory','location','best');
title('Channel estimation complex experiment');

%% Nullification exp
figure;
semilogy(snr,null_exp,'-or',snr,null_theory,'-*b');
xlabel('SNR (dB)');
ylabel('Nullification (dB)');
ylim([10^(-3) 1]);
yticklabels([-30 -20 -10 0]);
legend('Experiment','Theory','location','best');
title('Nullification complex experiment');