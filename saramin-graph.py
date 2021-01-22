import mysql.connector
import  pandas as  pd
from matplotlib import font_manager, rc

font_name = font_manager.FontProperties(fname="c:/Windows/Fonts/malgun.ttf").get_name()
rc('font', family=font_name)

config = {
    "user": "root",
    "password": "1234",
    "host": "192.168.56.101", #local
    "database": "orcl", #Database name
    "port": "3306" #port는 최초 설치 시 입력한 값(기본값은 3306)
}

conn = mysql.connector.connect(**config)

# db select, insert, update, delete 작업 객체
cursor = conn.cursor()


# 실행할 select 문 구성
sql = """ select pay,cnt from car_pay
            where career='신입';
           """
           
# cursor 객체를 이용해서 수행한다.
cursor.execute(sql)

# select 된 결과 셋 얻어오기
resultList = cursor.fetchall()  # tuple 이 들어있는 list
df = pd.DataFrame(resultList)
df.columns = ['연봉(신입)', '기업 수']
print(df[['연봉(신입)','기업 수']])


# 시각화 
result = df['기업 수']
result.index = df['연봉(신입)']
result.plot(kind='bar', color='skyblue',ylim=[0,350])