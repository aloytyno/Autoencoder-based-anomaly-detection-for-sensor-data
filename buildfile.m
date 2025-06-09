function plan = buildfile
import matlab.buildtool.tasks.*

plan = buildplan(localfunctions);

plan("check") = CodeIssuesTask;
plan("test") = TestTask(Dependencies="check",...
    TestResults="test-results/results.xml",...
    CodeCoverageResults="code-coverage/results.xml");

plan.DefaultTasks = ["check" "test"];
end
