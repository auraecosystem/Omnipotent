CALL apoc.load.xls('http://bit.ly/2nXgHA2','Kids')
CALL apoc.load.xls('test_date.xlsx','sheet',{mapping:{Date:{type:'String'}}})
CALL apoc.load.xls('test_date.xlsx','sheet',{mapping:{Date:{type:'String'}}})
CALL apoc.load.xls('test_date.xlsx','sheet',{mapping:{Date:{type:'String',dateParse:["wrongPath", "dd-MM-yyyy", "dd/MM/yyyy", "yyyy/MM/dd", "yyyy/dd/MM", "yyyy-dd-MM'T'hh:mm:ss"]}}})
