classdef scriptTests < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)
        % Test methods

        function smokeTest(testCase)
            AnomalyDetectionDemo

            % Verify that a script runs to the point where variable "ax2"
            % is created
            testCase.verifyTrue(exist("ax2","var"))
        end
    end

end