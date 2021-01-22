import mysql.connector
import  pandas as  pd
from matplotlib import font_manager, rc
from matplotlib import pyplot as plt

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
sql = """ select career,cnt from car_pay
where pay='3800만 이상';
           """
           
# cursor 객체를 이용해서 수행한다.
cursor.execute(sql)

# select 된 결과 셋 얻어오기
resultList = cursor.fetchall()  # tuple 이 들어있는 list
df = pd.DataFrame(resultList)

y_upper=[]
y_lower=[]
for i in df[1]:
    y_upper.append(i+10)
    y_lower.append(i-10)

plt.fill_between(df[0],y_lower,y_upper,alpha=0.2,color='pink') 
plt.plot(df[0],df[1],color='red')
plt.xlabel('3800만원 기준')
plt.show()