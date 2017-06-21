global class MyResourcesController{

    @RemoteAction
    global static List<Reservations__c> getReservations(){
    
        
            return 
            [SELECT 
                All_Day_Event__c, 
                Asset__c,
                Asset__r.Name, 
                Asset__r.Location__c, 
                Assigned_To__c, 
                CreatedById, 
                CreatedDate, 
                IsDeleted, 
                Description__c, 
                End__c, 
                LastModifiedById, 
                LastModifiedDate, 
                OwnerId, 
                Id, 
                Name, 
                Start__c, 
                Subject__c, 
                SystemModstamp 
            FROM 
                Reservations__c 
            where 
                Assigned_To__c = :UserInfo.getUserId() 
            AND 
                Start__c >= :DateTime.now()];
        
        
    
    }

}