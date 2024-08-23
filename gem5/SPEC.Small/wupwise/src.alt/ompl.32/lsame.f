      LOGICAL          FUNCTION LSAME( CA, CB )
*
*  -- LAPACK AUXILIARY ROUTINE (VERSION 2.0) --
*     UNIV. OF TENNESSEE, UNIV. OF CALIFORNIA BERKELEY, NAG LTD.,
*     COURANT INSTITUTE, ARGONNE NATIONAL LAB, AND RICE UNIVERSITY
*     SEPTEMBER 30, 1994
*
*     .. SCALAR ARGUMENTS ..
      CHARACTER          CA, CB
*     ..
*
*  PURPOSE
*  =======
*
*  LSAME RETURNS .TRUE. IF CA IS THE SAME LETTER AS CB REGARDLESS OF
*  CASE.
*
*  ARGUMENTS
*  =========
*
*  CA      (INPUT) CHARACTER*1
*  CB      (INPUT) CHARACTER*1
*          CA AND CB SPECIFY THE SINGLE CHARACTERS TO BE COMPARED.
*
* =====================================================================
*
*     .. LOCAL SCALARS ..
      INTEGER            INTA, INTB, ZCODE
*     ..
*     .. EXECUTABLE STATEMENTS ..
*
*     TEST IF THE CHARACTERS ARE EQUAL
*
      LSAME = CA.EQ.CB
      IF( LSAME )
     $   RETURN
*
*     NOW TEST FOR EQUIVALENCE IF BOTH CHARACTERS ARE ALPHABETIC.
*
      ZCODE = ICHAR( 'Z' )
*
*     USE 'Z' RATHER THAN 'A' SO THAT ASCII CAN BE DETECTED ON PRIME
*     MACHINES, ON WHICH ICHAR RETURNS A VALUE WITH BIT 8 SET.
*     ICHAR('A') ON PRIME MACHINES RETURNS 193 WHICH IS THE SAME AS
*     ICHAR('A') ON AN EBCDIC MACHINE.
*
      INTA = ICHAR( CA )
      INTB = ICHAR( CB )
*
      IF( ZCODE.EQ.90 .OR. ZCODE.EQ.122 ) THEN
*
*        ASCII IS ASSUMED - ZCODE IS THE ASCII CODE OF EITHER LOWER OR
*        UPPER CASE 'Z'.
*
         IF( INTA.GE.97 .AND. INTA.LE.122 ) INTA = INTA - 32
         IF( INTB.GE.97 .AND. INTB.LE.122 ) INTB = INTB - 32
*
      ELSE IF( ZCODE.EQ.233 .OR. ZCODE.EQ.169 ) THEN
*
*        EBCDIC IS ASSUMED - ZCODE IS THE EBCDIC CODE OF EITHER LOWER OR
*        UPPER CASE 'Z'.
*
         IF( INTA.GE.129 .AND. INTA.LE.137 .OR.
     $       INTA.GE.145 .AND. INTA.LE.153 .OR.
     $       INTA.GE.162 .AND. INTA.LE.169 ) INTA = INTA + 64
         IF( INTB.GE.129 .AND. INTB.LE.137 .OR.
     $       INTB.GE.145 .AND. INTB.LE.153 .OR.
     $       INTB.GE.162 .AND. INTB.LE.169 ) INTB = INTB + 64
*
      ELSE IF( ZCODE.EQ.218 .OR. ZCODE.EQ.250 ) THEN
*
*        ASCII IS ASSUMED, ON PRIME MACHINES - ZCODE IS THE ASCII CODE
*        PLUS 128 OF EITHER LOWER OR UPPER CASE 'Z'.
*
         IF( INTA.GE.225 .AND. INTA.LE.250 ) INTA = INTA - 32
         IF( INTB.GE.225 .AND. INTB.LE.250 ) INTB = INTB - 32
      END IF
      LSAME = INTA.EQ.INTB
*
*     RETURN
*
*     END OF LSAME
*
      END
