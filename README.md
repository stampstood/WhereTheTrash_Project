# WhereTheTrash_Project
INT206 Software Process Management Project  
Link ตัวอย่างของระบบ : http://13.229.76.5:8080/WhereTheTrash_Project/

# Getting started
หลังจากการ Clone Project ลงมาแล้ว ต้องมีการติดตั้งสิ่งที่ต้องใช้ในการ Run Project คือ

### 1. Apache Maven 
Download : http://maven.apache.org/download.cgi 
```
$ cd HelloWorldProject
$ mvn clean install
```
จะใช้งานผ่าน Plugin ของ IDE เพื่อช่วยในการ config dependencies ในไฟล์ pom.xml <br/>
See the [POM file](https://github.com/jidapamy/HelloWorldProject/blob/master/pom.xml)



### 2. Apache Tomcat  

Download : https://tomcat.apache.org/download-80.cgi   
และทำการติดตั้ง add Server บน NetBeans เลือก apache tomcat ตั้ง username  password   



### 3. MySQL Community Server 5.7 	
* [Windows]  
Download : https://dev.mysql.com/downloads/windows/installer/5.7.html  
เมื่อทำการติดตั้งเสร็จสิ้น ให้เปิดโปรแกรม MySQL Workbench เพื่อใช้งาน

* [MacOS]  
Download : https://dev.mysql.com/downloads/mysql/  
(ที่ Select platform: เลือกเป็น Mac OS X จากนั้นเลือกตัวติดตั้งแบบ dmg)  
  
ทำการแก้ไขไฟล์ .bash_profile
```bash
# Add MySQL 
export MYSQL_ROOT=/usr/local/mysql 
export PATH=$MYSQL_ROOT/bin:$PATH
```
เปิดโปรแกรม terminal แล้วพิมพ์คำสั่ง  

```bash
mysql -u root -p
```
ตัว terminal จะแสดง Enter password: ให้ใส่ temporary password ที่ได้มา
และตั้งค่ารหัสใหม่ โดยใช้คำสั่ง  

```bash
SET PASSWORD = PASSWORD('รหัสผ่านที่ต้องการ'); 
```
ปล. สามารถจัดการเกี่ยวกับ database ผ่านทาง command line ได้ หรือจะใช้โปรแกรม MySQL Workbench เพื่อความสะดวกที่มากขึ้น 
(สามารถดาวน์โหลดได้ที่ https://dev.mysql.com/downloads/workbench/ )

# Config Properties
สร้างไฟล์ config.properties ใน /src/main/resoures โดยใส่

```bash
dburl=${databaseURL}
dbuser=${databaseUsername}
dbpassword= ${databasePassword}
```

# Members
58130500002 นายกษิดิศ ศรีจันทรากูล  
58130500010 นายคมวัฏ โชติพิพัฒน์วงศ์  
58130500014 นางสาวจิดาภา สิกพันธ์  
58130500031 นางสาวณิชชรีย์ ศานติวงศ์สกุล  
58130500040 นางสาวนทภรรตรี บุญธรรม  
58130500043 นางสาวนฤภร เรืองสาย  
