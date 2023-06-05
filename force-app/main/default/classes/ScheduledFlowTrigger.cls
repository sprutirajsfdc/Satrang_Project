/*
    @Description        : "The implementation includes a Schedulable Apex class that enables the execution of a record trigger flow at a specific scheduled time, allowing for automated and timely processing of records according to predefined business logic.."
    @Author             : Sprutiraj
    @Last Modified By   : Sprutiraj
    @Last Modified On   : 03-06-2023
    @Modification Log   :
    Ver       Date            Author          Modification
    1.0    04-06-2023       Sprutiraj        Initial Version
*/
public class ScheduledFlowTrigger implements Schedulable {
    public void execute(SchedulableContext sc) {
        // Invoke your record-triggered flow here
        Flow.Interview.Account_related flow = new Flow.Interview.Account_related(new Map<String, Object>());
        flow.start(); // Start the flow execution
    }
}