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

% 部分時系列の本数の計算
K = T - W + 1;

% 添字の計算
idx = repmat(1:W, K, 1)' + repmat(1:K, W, 1) - 1;
idx = idx(:, 1:S:K);

% 起点を指定して、部分時系列を抽出する
idx = idx(:);
X = X';
Y = X(:, idx);

% (M*W)-行 の行列へ変形する
Y = reshape(Y, M * W, [])';
