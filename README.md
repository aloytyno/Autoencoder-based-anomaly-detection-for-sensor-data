# Autoencoder-based-anomaly-detection-for-sensor-data
Autoencoder-based anomaly detection for sensor data using MATLAB

This demo highlights how one can use an unsupervised machine learning technique based on autoencoder to detect an anomaly in sensor data (output pressure of a triplex pump). The demo also shows how a trained autoencoder can be deployed on an embedded system through automatic code generation. The advantage of autoencoders is that they can be trained to detect anomalies with data representing normal operation, i.e. you don't need data from failures.

# Autoencoder basics
Autoencoders are based on neural networks, and the network consists of two parts: an encoder and a decoder. Encoder compresses the N-dimensional input (e.g. a frame of sensor data) into an x-dimensional code (where x < N), which contains most of the information carried in the input, but with fewer data. Hence, the encoder is somewhat similar to principal component analysis, but autoencoders can capture non-linear relationships. The decoder, on the other hand, tries to regenerate the input from the lower-dimensional code or latent representation. 
The way one can use trained autoencoders for anomaly detection is that in normal conditions, when normal data is fed into the network, the network can regenerate the input, and the error between the input and output is small. When data containing anomalies is fed into the network, the network fails to regenerate the input, and the error becomes larger.
