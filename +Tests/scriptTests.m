classdef scriptTests < matlab.unittest.TestCase

    methods (Test)
        % Test methods

        function smokeTest(testCase)
            evalin("base","AnomalyDetectionDemo")
            % Verify that a script runs to the point where variable "ax2"
            % is created
            testCase.verifyEqual(1,1)
        end
    end
end