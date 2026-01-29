function anomalyidx = detectAnomalies(datapoint)
    % Make a buffer to store 100 values
    persistent buffer
    
    if isempty(buffer)
        buffer = nan(100,1);
    end
    
    % When we get new data, update the buffer as FIFO
    buffer = [buffer(2:end); datapoint];
    
    % Perform detection when we have a full buffer
    if ~any(isnan(buffer))
        % Call external model to predict expected values for the buffer
        yhat = anomalyDetectorFunc(buffer);
        % Compute RMS-like reconstruction error across the buffer
        loss = sqrt(sum((yhat - buffer).^2));
        % Flag indices where loss exceeds threshold
        anomalyidx = find(loss > 7.5);
        if isempty(anomalyidx)
            anomalyidx = nan;
        end
    else
        anomalyidx = nan;
    end
end

%[appendix]{"version":"1.0"}
%---
