      $set ilusing"java.io"
      $set ilusing"java.util"
      $set ilusing"java.lang"
      $set ilusing"java.time"
      $set ilusing"java.time.format"
      $set ilusing"org.apache.pdfbox.pdmodel"
      * Uses Apache PDFBox to create a PDF document from COBOL
      * Records
       class-id com.amcpresales.PDF implements type AutoCloseable public.

       working-storage section.
       01 document type PDDocument.
       01 currentPage type PDPage.
       01 contentStream type PDPageContentStream.
       01 marginTop float-short constant value 750.
       01 marginBottom float-short constant value 50.
       01 marginLeft float-short constant value 50.
       01 marginLeading float-short constant value 18. 
       01 currentY float-short property.
       01 docFont type font.PDFont.
       01 fontSize binary-long property.
       01 prefix String.
       
       method-id new (docPrefix as string = "pdf_", docFontSize as binary-long=12).
       local-storage section.
       procedure division.
           try
               set document to new PDDocument()               
           catch
               invoke type System::out::println(exception-object::getMessage())
           end-try
           set currentY to zero
           set fontSize to docFontSize
           set docFont to new font.PDType1Font(type font.Standard14Fonts+FontName::HELVETICA)           
           set prefix to docPrefix
           set currentPage to null
           set contentStream to null           
           goback.
       end method.

       method-id WritePDF (textLines as type ArrayList[String]).
       local-storage section.
       procedure division.
           set docFont to new font.PDType1Font(type font.Standard14Fonts+FontName::HELVETICA)
           set currentY to marginBottom
           perform varying docLine as String thru textLines
               if currentY <= marginBottom
                   invoke self::closeStream()
                   set currentPage to new PDPage()
                   invoke document::addPage(currentPage)
                   set contentStream = new PDPageContentStream(document, currentPage)
                   invoke contentStream::beginText()
                   invoke contentStream::setFont(docFont, fontSize)
                   invoke contentStream::setNonStrokingColor(type java.awt.Color::BLUE)
                   invoke contentStream::newLineAtOffset(marginLeft, marginTop)
                   set currentY to marginTop
               else
                   invoke contentStream::newLineAtOffset(0, (-marginLeading))
               end-if

               invoke contentStream::showText(docLine::trim())
               set currentY to currentY - marginLeading
           end-perform
           invoke self::closeStream()
           goback.
       end method.  

       method-id WriteDocumentLine (outrec as String).
       local-storage section.
       procedure division.

           if currentY = zero
               set currentY to marginBottom
           end-if
           
           if currentY <= marginBottom
               invoke self::closeStream()
               set currentPage to new PDPage()
               invoke document::addPage(currentPage)
               set contentStream = new PDPageContentStream(document, currentPage)
               invoke contentStream::beginText()
               invoke contentStream::setFont(docFont, fontSize)
               invoke contentStream::setNonStrokingColor(type java.awt.Color::BLUE)
               invoke contentStream::newLineAtOffset(marginLeft, marginTop)
               set currentY to marginTop
           else
               invoke contentStream::newLineAtOffset(0, (-marginLeading))
           end-if

           invoke contentStream::showText(outrec::trim())
           set currentY to currentY - marginLeading
           goback.
       end method.
       
       method-id closeStream.
       local-storage section.
       procedure division.
           if contentStream not= null
               invoke contentStream::endText()
               invoke contentStream::close()
               set contentStream to null
           end-if
           goback.
       end method.
       
       method-id close.
       local-storage section.
       procedure division.
           invoke self::closeStream()
           invoke document::save("Reports\" & prefix & type LocalDateTime::now::format(type DateTimeFormatter::ofPattern("MMddyyyy-hhmmss")) & ".pdf")
           invoke document::close()
           goback.
       end method.       
       end class.
