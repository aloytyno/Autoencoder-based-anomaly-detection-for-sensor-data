% Preallocate
losses = nan(100,1);
dataall = [];
j = 1;

% Setup axes and plots
ax1 = subplot(2,1,1);p1 = plot(ax1,magic(2));ylim(ax1,[32 45]),title('Measured and Predicted')
xlim(ax1,[0,600])
ax2 = subplot(2,1,2);p2 = plot(ax2,1); ylim(ax2,[0,25]),title('RMSE'),xlim(ax2,[0,600])

% Loop through data points (the anomaly occurs somewhere around 1350)
for i = 1000:1500
   
    % Take a frame of data
    data = faultydata(i:i+99);
    
    % Predict with autoencoder
    yhat = predict(autoenc,data);
    
    % Calculate error
    losses = [losses;sqrt(sum((yhat - data).^2))];
    
    % After first frame, only add one data point to the plot
    if j > 1
        yhat = yhat(end);
        data = data(end);
    end
    
    % Update data to be plotted
    dataall = [dataall;[data yhat]];
    
    % Plot
    p1(1).XData = 1:size(dataall,1);p1(2).LineWidth = 1.5;
    p1(2).XData = 1:size(dataall,1);
    p1(1).YData = dataall(:,1);p2.LineWidth = 1.5;
    p1(2).YData = dataall(:,2);
   
    p2.XData = 1:length(losses);
    p2.YData = losses;
    pause(0.005)
    j = j+1;
end
xlim([0 length(losses)])

% Find anomalies by thresholding the error
anomalyIdxs = find(losses > 7.5);

% Highlight the region with high anomaly scores
patch(ax1,[min(anomalyIdxs),max(anomalyIdxs),max(anomalyIdxs),min(anomalyIdxs)],...
    [min(ax1.YLim),min(ax1.YLim),max(ax1.YLim),max(ax1.YLim)],'red','FaceAlpha',.3)