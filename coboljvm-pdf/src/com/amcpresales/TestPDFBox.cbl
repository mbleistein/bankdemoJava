      $set ilusing"java.lang"
      $set ilusing"java.util"
       program-id. TestPDFBox as "com.amcpresales.TestPDFBox".

       data division.
       working-storage section.
       01 recordList type ArrayList[String].
       01 recData String.
       01 pdfdoc type PDF.
       
       procedure division.
           set recordList to new ArrayList[String]()
           perform varying idx as binary-long from 1 by 1 until idx > 10
               set recData to "My recordList #" & idx 
               invoke recordList::add(recData)
           end-perform
           set pdfdoc to new PDF()
           invoke pdfdoc::WritePDF(recordList)
           goback.

       end program TestPDFBox.
