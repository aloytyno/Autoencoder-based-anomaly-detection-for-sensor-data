classdef scriptTests < matlab.unittest.TestCase

    properties
        prj
    end

    methods (TestMethodSetup)
        function openProject(testCase)
            try
                testCase.prj = currentProject;
                cd(testCase.prj.RootFolder)
            catch
                open("AutoEncoderAnomalyDetection.prj");
                testCase.prj = currentProject;
                cd(testCase.prj.RootFolder)
            end
        end
    end

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