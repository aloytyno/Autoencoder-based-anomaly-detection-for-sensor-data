function plan = buildfile
import matlab.buildtool.tasks.*
import matlab.unittest.plugins.CodeCoveragePlugin
import matlab.unittest.plugins.codecoverage.CoverageResult

plan = buildplan(localfunctions);

plan("check") = CodeIssuesTask;
plan("test") = TestTask(Dependencies="check",...
    TestResults="test-results/results.xml",...
    CodeCoverageResults="code-coverage/report.xml",...
    SourceFiles={'Code/AnomalyDetectionDemo.m','Code/detectAnomalies.m'});

plan("toolbox").Dependencies="test";
plan("toolbox").Actions=@toolboxTask;
plan.DefaultTasks = "toolbox";
end

function toolboxTask(~)

    projectFile = "AutoEncoderAnomalyDetection.prj";
    matlab.addons.toolbox.packageToolbox(projectFile);

end

