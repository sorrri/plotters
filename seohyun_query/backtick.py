
#insert your query to remove backticks(`)
query = '''

'''

query2 = query.replace('`','')

query2 = query2.replace('DROP TABLE','DROP TABLE IF EXISTS')

file = open('query.txt','w')
file.write(query2)
file.close()