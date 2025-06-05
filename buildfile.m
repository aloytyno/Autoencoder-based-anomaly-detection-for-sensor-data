function plan = buildfile
import matlab.buildtool.tasks.*

plan = buildplan(localfunctions);

plan("check") = CodeIssuesTask;
plan("test") = TestTask(Dependencies="check");

plan.DefaultTasks = ["check" "test"];
end
