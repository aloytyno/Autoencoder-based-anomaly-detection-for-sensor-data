# Autoencoder-based anomaly detection for sensor data using MATLAB

[![View Autoencoder-based anomaly detection for sensor data on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/77554-autoencoder-based-anomaly-detection-for-sensor-data)

This demo highlights how one can use a semi-supervised machine learning technique based on autoencoder to detect an anomaly in sensor data (output pressure of a triplex pump). The demo also shows how a trained autoencoder can be deployed on an embedded system through automatic code generation. The advantage of autoencoders is that they can be trained to detect anomalies with data representing normal operation, i.e. you don't need data from failures.

# Autoencoder basics
Autoencoders are based on neural networks, and the network consists of two parts: an encoder and a decoder. Encoder compresses the N-dimensional input (e.g. a frame of sensor data) into an x-dimensional code (where x < N), which contains most of the information carried in the input, but with fewer data. Hence, the encoder is somewhat similar to principal component analysis, but autoencoders can capture non-linear relationships. The decoder, on the other hand, tries to regenerate the input from the lower-dimensional code or latent representation. 
The way one can use trained autoencoders for anomaly detection is that in normal conditions, when normal data is fed into the network, the network can regenerate the input, and the error between the input and output is small. When data containing anomalies is fed into the network, the network fails to regenerate the input, and the error becomes larger.

![Autoencoder schema](https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Autoencoder_schema.png/220px-Autoencoder_schema.png)

# How to run
Open the AnomalyDetectionDemo.mlx in MATLAB

# Toolboxes required
This demo uses Deep Learning toolbox to train the model. To generate C code from the trained model, you need MATLAB Coder toolbox.
