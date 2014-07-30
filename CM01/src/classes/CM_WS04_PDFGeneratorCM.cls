/**
 * Class Name: CM_WS04_PDFGeneratorCM
 * Author: Pasona tquila
 * Date: 29-05-2014
 * Project Name: Commercial RFA 
 * Requirement Description: This apex class is used for calling the PDF Generator REST based class.
 *
 * created by yoshinari
 * calling: CM_AP04_UTIL_PdfCompletionMemo
 */
 
public class CM_WS04_PDFGeneratorCM
{
    @Future( callout=true)
    public static void PDFGenerator(Id rfaId, String SessionId)
    {
        /********************* Creating Http Request for pdf Generator REST based WS******/
		system.debug('--- CM_WS_04_PDF_GeneratorCM - rfaId:' + rfaId + ' - SessionId:' + SessionId);
        HttpRequest req = new HttpRequest(); 
        
        //req.setEndpoint(EndPoint 
        req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() 
            + '/services/apexrest/cm_pdfGeneratorCM/CM_AP04_UTIL_PdfCompletionMemo/savePDF');
            
        req.setMethod('POST');
        
        // adding content type as JSON format for the request
        req.setHeader('Content-Type', 'application/json');
        
        //Passing RFA ID as parentId for attaching the attachment.
        req.setbody('{"parentId":"'+rfaId +'"}');
        
        //Adding SOAP Action
        req.setHeader('SOAPAction', '""');
        
        //Set the header with OAuth and session Id
        req.setHeader('Authorization','OAuth '+SessionId);
        
        try{
            Http http = new Http();  
            system.debug('--End Point--'+req.getEndPoint());    
            HTTPResponse res = http.send(req);  
        } Catch(Exception e)
        {
            system.debug('--- CM_WS_04_PDF_GeneratorCM - exception: ' + e.getMessage());
        }
    }
}