       program-id. Program1 as "testJsonBuilder.Program1".

       working-storage section.
       01 str String.
       01 pNum binary-long value 45000.
       01 tNum binary-long value 48.
       01 rNum float-short value 5.99.
       
       procedure division.
           set str to "{" & '"principal"' & ":" & type Integer::toString(pNum)  & ","
                          & '"term"' & ":" & type Integer::toString(tNum) & ","
                          & '"rate"' & ":" & type Float::toString(rNum) & "}"
           display str
           goback.

       end program Program1.
