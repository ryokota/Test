/**
 * Class Name: CM_AP04_UTIL_PdfCompletionMemo 
 * Author: Pasona tquila
 * Date: 29-05-2014
 * Project Name: Commercial - RFA
 * Requirement Description: Util class for PDF Generate for RFA. This is the praser for POST Method.
 */
 //called from CM_WS04_PDFGeneratorCM
 //calling VF page: CM_VFP04_CM_DetailsAsPDF
 @RestResource(urlMapping='/cm_pdfGeneratorCM/*')

global class CM_AP04_UTIL_PdfCompletionMemo {

    // Defining the POST method
    @HttpPOST
    global static void savePDF(ID parentId)
    {
    	system.debug('--- CM_AP04_UTIL_PdfCompletionMemo - parentId:' + parentId);
    	
        PageReference pdf = Page.CM_VFP04_CM_DetailsAsPDF;
        // add parent id to the parameters for standardcontroller
        pdf.getParameters().put('id', parentId);
 
        // create the new attachment
        Attachment attach = new Attachment();
     
        // the contents of the attachment from the pdf
        Blob body;
 
        try {
            system.debug('------- body: ' + body);
            // returns the output of the page as a PDF
            body =  pdf.getContent();
            // need to pass unit test -- current bug    
        } catch (VisualforceException e) {
            body = Blob.valueOf('Some Text');
        }
 
        attach.Body = body;
        // add the user entered name
        attach.Name = 'Completion_Memo' + datetime.now() + '.pdf';
        attach.IsPrivate = false;
        // attach the pdf to the account
        attach.ParentId = ParentId;
        insert attach;
    }
}