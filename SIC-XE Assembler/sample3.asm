. This code has CSECT so gives the appropriate errors in error_sample_program2
COPY	START	0
	EXTDEF BUFFER,BUFEND,LENGTH
	EXTREF RDREC,WRREC
FIRST     STL       RETADR
CLOOP     +JSUB     RDREC
          LDA       LENGTH
          COMP      #0
          JEQ       ENDFIL
	  	 +JSUB      WRREC
          J         CLOOP
ENDFIL    LDA       =C'EOF'
          STA       BUFFER
          LDA       #3
          STA       LENGTH
          +JSUB     WRREC
          J         @RETADR
RETADR    RESW      1
LENGTH    RESW      1
	  		LTORG
BUFFER    RESB      4096
BUFFEND   EQU       *
MAXLEN    EQU       BUFFEND-BUFFER
RDREC	CSECT
.
.       SUBROUTINE TO READ RECORD INFO BUFFER
.	 
          EXTREF BUFFER,LENGTH,BUFEND	 
          CLEAR     X
          CLEAR     A
          CLEAR     S
          LDT       MAXLEN
RLOOP     TD        INPUT
          JEQ       RLOOP
          RD        INPUT
          COMPR     A,S
          JEQ       EXIT
          +STCH      BUFFER,X
          TIXR      T
          JLT       RLOOP
EXIT      +STX       LENGTH
          RSUB
INPUT     BYTE      X'F1'
MAXLEN    WORD      BUFEND-BUFFER
.
.     SUBROUTINE TO WRITE RECORD FROM BUFFER
.
       	  EXTREF LENGTH,BUFFER
          CLEAR     X
          +LDT       LENGTH
WLOOP     TD        =X'05'
          JEQ       WLOOP
          +LDCH      BUFFER,X
          WD        =X'05'
          TIXR      T
          JLT       WLOOP
          RSUB
          END       FIRST