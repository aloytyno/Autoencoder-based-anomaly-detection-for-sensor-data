function Y = generateSubseq(X, W, S)
% GENERATESUBSEQ Generate subsequence time series
%
%   Y = generateSubseq(X, W, S)
%
%       X : time series data
%       W : size of sliding window
%       S : size of stride

% Copyright 2016 The MathWorks, Inc.

if nargin < 3
    S = 1;
end

[T, M] = size(X);

% �������n��̖{���̌v�Z
K = T - W + 1;

% �Y���̌v�Z
idx = repmat(1:W, K, 1)' + repmat(1:K, W, 1) - 1;
idx = idx(:, 1:S:K);

% �N�_���w�肵�āA�������n��𒊏o����
idx = idx(:);
X = X';
Y = X(:, idx);

% (M*W)-�s �̍s��֕ό`����
Y = reshape(Y, M * W, [])';
