function plan = buildfile
import matlab.buildtool.tasks.*
import matlab.unittest.plugins.CodeCoveragePlugin
import matlab.unittest.plugins.codecoverage.CoverageResult

plan = buildplan(localfunctions);

plan("check") = CodeIssuesTask;
plan("test") = TestTask(Dependencies="check",...
    TestResults="test-results/results.xml",...
    CodeCoverageResults="code-coverage/report.xml",...
    SourceFiles={'Code/AnomalyDetectionDemo.mlx','Code/detectAnomalies.mlx'});

plan.DefaultTasks = ["check" "test"];
end

