trigger RollupTrigger on Policies__c (after insert, after update, after delete, after undelete) {
AccountRollupHelper.updateAccountRollup(trigger.new);
}