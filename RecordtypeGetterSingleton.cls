public class RecordtypeGetterSingleton 
{
    private Map<String, recordType> recordTypeMap;
    private static RecordtypeGetterSingleton singleton;

    private RecordtypeGetterSingleton()
    {
        recordTypeMap = new Map<String, recordType>();

        for(recordType rt : [
                            SELECT 
                            ID
                            , Name
                            , Description
                            , sObjectType
                            , DeveloperName 
                            FROM RecordType
        ])
        {
            this.recordTypeMap.put((rt.sObjectType + ':' + rt.DeveloperName).toLowerCase(), rt);
        }
    }
    
    //always use this method to get the instance.
    public static RecordtypeGetterSingleton getInstance()
    {
        if(singleton == null) singleton = new RecordtypeGetterSingleton();

        return singleton;
    }
    
    public Recordtype getRecordType(String objName, String devName)
    {
        String query = (objName + ':' + devName).toLowerCase();
        recordtype rt = this.recordTypeMap.get(query);

        return rt;
    }
}
