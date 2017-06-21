global with sharing class FindAssets{

    public FindAssets(ApexPages.StandardSetController controller) { }

    @RemoteAction
    // Find warehouses nearest a geolocation
    global static List<Asset__c> getNearby(String lat, String lon) {

        // If geolocation isn't set, use San Francisco
        if(lat == null || lon == null || lat.equals('') || lon.equals('')) {
            lat = '37.77493';
            lon = '-122.419416';
        }

        // SOQL query to get the nearest warehouses
        String queryString =
            'SELECT Id, Name, GeoLocation__Longitude__s, GeoLocation__Latitude__s ' +
            ' FROM Asset__c ' +
            ' WHERE DISTANCE(GeoLocation__c, GEOLOCATION('+lat+','+lon+'), \'mi\') < 20 ' +
            ' ORDER BY DISTANCE(GeoLocation__c, GEOLOCATION('+lat+','+lon+'), \'mi\') ' +
            ' LIMIT 10';

        // Run and return the query results
        return(database.Query(queryString));
    }
}