Line	Address	Label	OPCODE	OPERAND	Comment
5	00000	0	SUM	START	0	
10	00000	0	FIRST	LDX	#0	
15	00003	0		LDA	#0	
20	00006	0		+LDB	#TABLE2	
25	0000A	0		BASE	TABLE2	
30	0000A	0	LOOP	ADD	TABLE,X	
35	0000D	0		ADD	TABLE3,X	
40	00010	0		TIX	COUNT	
45	00013	0		JLT	LOOP	
50	00016	0		+STA	TOTAL	
55	0001A	0		RSUB	 	
60	0001D	0	COUNT	RESW	1	
65	00020	0	TABLE	RESW	2000	
70	01790	0	TABLE2	RESW	2000	
75	02F00	0	TOTAL	RESW	1	
80	02F03	 		END	FIRST	
