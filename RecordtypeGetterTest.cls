@isTest
public class RecordtypeGetterTest {
    @isTest static void instantiate()
    {
        RecordtypeGetterSingleton singleton = RecordtypeGetterSingleton.getInstance();

        System.assert(singleton != null);
    }

    @isTest static void isSingleton()
    {
        RecordtypeGetterSingleton singleton1 = RecordtypeGetterSingleton.getInstance();
        RecordtypeGetterSingleton singleton2 = RecordtypeGetterSingleton.getInstance();

        System.assert(singleton1 === singleton2);
    }

    @isTest static void getRecordtype()
    {
        RecordtypeGetterSingleton singleton = RecordtypeGetterSingleton.getInstance();
        Recordtype someRecordtype = [SELECT ID, DeveloperName, sObjectType FROM RECORDTYPE limit 1];
        Recordtype rc = singleton.getRecordType(someRecordtype.sObjectType, someRecordtype.DeveloperName);

        System.assert(rc.developername.equals(someRecordtype.DeveloperName));
    }

    @isTest static void isNotCaseSensitive()
    {
        RecordtypeGetterSingleton singleton = RecordtypeGetterSingleton.getInstance();
        Recordtype someRecordtype = [SELECT ID, DeveloperName, sObjectType FROM RECORDTYPE limit 1];
        Recordtype rc = singleton.getRecordType(someRecordtype.sObjectType.toUpperCase(), someRecordtype.DeveloperName.toUpperCase());

        System.assert(rc != null);
    }

    @isTest static void isNotFound()
    {
        RecordtypeGetterSingleton singleton = RecordtypeGetterSingleton.getInstance();
        Recordtype rc = singleton.getRecordType('12345678910', '12345677810');

        System.assert(rc == null);
    }
}