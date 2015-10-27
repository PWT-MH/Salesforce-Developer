public with sharing class PaulGoogleCalendar {
	
    private static final String constSessionAuthToken = '{"web":{"auth_uri":"https://accounts.google.com/o/oauth2/auth","client_secret":"59_TL7Pifhj_D8X45Z0RwZkf","token_uri":"https://accounts.google.com/o/oauth2/token","client_email":"560734294021-vatvh8lrb777ad2d4pjodjskrt0rkccj@developer.gserviceaccount.com","client_x509_cert_url":"https://www.googleapis.com/robot/v1/metadata/x509/560734294021-vatvh8lrb777ad2d4pjodjskrt0rkccj@developer.gserviceaccount.com","client_id":"560734294021-vatvh8lrb777ad2d4pjodjskrt0rkccj.apps.googleusercontent.com","auth_provider_x509_cert_url":"https://www.googleapis.com/oauth2/v1/certs"}}';
	private static final string constSessionAuthToken2='{"web":{"auth_uri":"https://accounts.google.com/o/oauth2/auth","token_uri":"https://accounts.google.com/o/oauth2/token","client_email":"560734294021-aes7mgc5vnmc6g7jr17ah79efg3qab6m@developer.gserviceaccount.com","client_x509_cert_url":"https://www.googleapis.com/robot/v1/metadata/x509/560734294021-aes7mgc5vnmc6g7jr17ah79efg3qab6m@developer.gserviceaccount.com","client_id":"560734294021-aes7mgc5vnmc6g7jr17ah79efg3qab6m.apps.googleusercontent.com","auth_provider_x509_cert_url":"https://www.googleapis.com/oauth2/v1/certs"}}';
	
	public class JWTClaimSet
    {
       public string iss {get;set;}
       public string scope {get;set;}
       public string aud {get;set;}
       public Long exp {get;set;}
       public Long iat {get;set;}
       //public string prn {get;set;}
    }
    
    //@future (callout=true)
    public static void LoginToGoogle()
    {
        //Set your username and password here        
        String clientId = '851234545868.apps.googleusercontent.com';

        //Construct HTTP request and response
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();


        String JWTHeader =  '{"typ":"JWT","alg":"RS256"}';
        //String Base64EncodedJWTHeader = 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9'; //To encode later using code

        //Taken from .net application
        // Since the information is going to be same, I have encoded it already in .NET and using it here
        String Base64EncodedJWTHeader = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9';
        // Salesforce returns time in milliseconds, so we are dividing it by 1000 to set the seconds value instead of milliseconds value
        Long expires_at = math.roundToLong(DateTime.now().addMinutes(40).getTime() / 1000);
        Long issued_at = math.roundToLong(DateTime.now().addSeconds(-2).getTime() / 1000);
        //Long issued_at = 1372276504;
        //Long Expires_at = 1372279804;

        JWTClaimSet JWT = new JWTClaimSet();
        //JWT.prn = username;
        JWT.iss = '851234545868@developer.gserviceaccount.com';
        JWT.scope = 'https://www.googleapis.com/auth/drive.file';
        JWT.aud = 'https://accounts.google.com/o/oauth2/token';
        JWT.iat = issued_at;
        JWT.exp = expires_at;

        String strJWTJSON = JSON.Serialize(JWT);
        system.debug('Unencoded claimset::'+strJWTJSON);


        Blob ClaimsetBlob = Blob.valueOf(strJWTJSON);
        String Base64EncodedClaimset = EncodingUtil.base64Encode(ClaimsetBlob);
       //Base64EncodedClaimset = PerformPostBase64Encode(Base64EncodedClaimset);
       system.debug('Base64 Encoded Claimset::'+Base64EncodedClaimset);

       // constructing the base64 encoded string to sign it
       string Base64EncodedString = Base64EncodedJWTHeader + '.' + Base64EncodedClaimset;


       // Steps to sign the base64Encoded string
       String algorithmName = 'RSA';
       String key = 'MIICXAIBAAKBgQCi16h+5TeQU5Fo0DlR6+YmrzYXZ7DLxz+dBEnB8Hj0gznqlz8p7nQ7I4AV/SfiJQ6JbU16sKS5IW7Hob5ieW1DfwxYZeCSBPbEkt7eASrI8xqGU5RVewaQivY3vO+avgSSUT+ZU243XsDvZJQlkE3e46FhBvFedDQvuk2iEfgdxQIDAQABAoGAFaO882f4c0h3qUsKYvWLNxbPhFq2Js5KiM4aEximqi+KEb+ZmDPk5Dr6eXGTzDyKav7IbgZtTWDA/OxkhWeHelsMB9LqBq50L6hLHTK4hHecPrT3oN4GviUXh5y5Vt479A1TopjLKdt7V4AnAs0HEWJzar/euUa+T9eODPWPFP0CQQDWQeK2cqzWSVHUpkufp7a0Sc2RvfcIpOf8kRFBLnKiFGr7BscLz6qsaG1M8TyUNMrCquwLSNSDMvPjl6sCjgRPAkEAwpFx8+lspjN0yV5M5XHPmnoddTHwV/8QHoccMBBq0ZMFs2m1E/rFhwMHRBiFN6flbze8src7YnOmmtYqsGizqwJAfqoEtYel1ikST3zgSEqGIJ9hAEAlwt56pz27zaT/8AHSHQUstzbV14cE1u/muFddZyhU03cC62078djAKIp80QJAKMMT3ofOrVsmYnGRJpibZ7+hoEXgFm9nTx37N86YsmNc1GOW/iKRc2GdChUhA7H3DT/eForwtAWKp/Gqa97jlQJBAKjKOIKvdYS9fTpCzs1nUHg9rvVartRR5xxwLH57bBincuSJSBGjwd1FInAh2tgiUGPWGPsplShP87wao9+n9VQ=';
       Blob privateKey = EncodingUtil.base64Decode(key);

       Blob input = Blob.valueOf(Base64EncodedString);
       //Blob SHA256InputBlob = Crypto.generateDigest('SHA-256',input);

       Blob Blobsign = Crypto.sign(algorithmName, input , privateKey);


       // The following line is just for debugging and viewing the blob data in signature as string and its not used anywhere
       String signature = EncodingUtil.urlEncode(EncodingUtil.convertToHex(Blobsign),'UTF-8');

       system.debug('Unencoded signature ::'+signature);
       String base64EncodedSignature = EncodingUtil.base64Encode(Blobsign); 
       //base64EncodedSignature = PerformPostBase64Encode(base64EncodedSignature);
       system.debug('Base 64 encoded signature ::'+base64EncodedSignature );

       system.debug('Encoded assertion : ' + Base64EncodedString+'.'+base64EncodedSignature);

       string URLEncodedUTF8GrantType = encodingUtil.urlEncode('urn:ietf:params:oauth:grant-type:jwt-bearer','UTF-8');
       string URLEncodedUTF8Assertion = encodingUtil.urlEncode(Base64EncodedString+'.'+base64EncodedSignature,'UTF-8');        

       system.debug('URLEncodedUTF8GrantType : ' + URLEncodedUTF8GrantType);
       system.debug('URLEncodedUTF8Assertion : ' + URLEncodedUTF8Assertion);

       //Making the call out
       req.setEndpoint('https://accounts.google.com/o/oauth2/token');
       req.setMethod('POST');
       //req.setHeader('Content-Length', '-1');
       req.setHeader('Content-Type','application/x-www-form-urlencoded');
       //req.setHeader('grant_type',URLEncodedUTF8GrantType);
       //req.setHeader('assertion',URLEncodedUTF8Assertion);
       req.setBody('grant_type='+URLEncodedUTF8GrantType+'&assertion='+URLEncodedUTF8Assertion);
       res = http.send(req);
       system.debug('PaulGoogleCalendar.LoginToGoogle:response: '+res.getBody());
   }

   public static String PerformPostBase64Encode(String s)
   {
       s = s.Replace('+', '-');
       s = s.Replace('/', '_');
       s = s.Split('=')[0]; // Remove any trailing '='s
       return s;
   }
   
	public void googleCalendarExtract()
	{
		
	    System.debug ('PaulGoogleCalendar.googleCalendarExtract:Start');
	    //string sessionAuthToken = null;	
	    LoginToGoogle();
	    CalendarService service = new CalendarService();
	    //service.setAuthSubToken('CJ3pqczuBBCpgI2pBw');
	    
	    //GoogleData feed = service.getAllCalendarsFeed();
	    //list<GoogleData.Calendar> cals = GoogleData.calendarFactory(feed.entries);
	    
	    //system.debug('Cals='  + cals);
	    
	    System.debug ('PaulGoogleCalendar.googleCalendarExtract:End');	
	}
}