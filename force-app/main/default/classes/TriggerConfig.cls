public with sharing class TriggerConfig {
    public TriggerConfig() {}
    private static TriggerConfig instance;
    public static TriggerConfig getInstance(){
        if(instance == null){
            instance = new TriggerConfig();
        }
        return instance;
    }

    public void runAll(SObjectType objectType){
        String objectName = objectType.getDescribe().getName(); 
        if(shouldRun(prepareFieldName(objectName))){
            
        }
    }

    private Boolean shouldRun(String triggerObjectName){
        ManageTriggers__c setting = ManageTriggers__c.getInstance();

        if ( setting.get(triggerObjectName) == true ){
            return true;
        } else {
            return false;
        }
    }

    private String prepareFieldName(String objectName){
        String fieldAPIName;
        if(objectName.endsWith('__c')){
            fieldAPIName.removeEnd('__c');
            fieldAPIName = fieldAPIName + 'Trigger__c';
        }else{
            fieldAPIName = objectName + 'Trigger__c';
        }
        return fieldAPIName;
    }
}
