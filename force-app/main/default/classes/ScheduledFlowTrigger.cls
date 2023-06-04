public class ScheduledFlowTrigger implements Schedulable {
    public void execute(SchedulableContext sc) {
        // Invoke your record-triggered flow here
        Flow.Interview.Account_related flow = new Flow.Interview.Account_related(new Map<String, Object>());
        flow.start(); // Start the flow execution
    }
}