Line	Address	Label	OPCODE	OPERAND	ObjectCode	Comment
5	00000	0	SUM	START	0		
10	00000	0	FIRST	LDX	#0	050000	
15	00003	0		LDA	#0	010000	
20	00006	0		+LDB	#TABLE2	6910178D	
25	0000A	0		BASE	TABLE2		
30	0000A	0	LOOP	ADD	TABLE,X	1BA010	
35	0000D	0		ADD	TABLE2,X	1BC000	
40	00010	0		TIX	COUNT	2F2007	
45	00013	0		JLTA	LOOP		
50	00013	0		+STA	TOTAL	0F102EFD	
55	00017	0		RSUB	 	4F0000	
60	0001A	0	COUNT	RESW	1		
65	0001D	0	TABLE	RESW	2000		
70	0178D	0	TABLE2	RESW	2000		
75	02EFD	0	TOTAL	RESW	1		
80	02F00	 		END	FIRST		
