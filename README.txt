README:


MONGODB:
Prerequisites: 
mongodb 32 bit

1. Copy the whole 'loop' files in the db folder and paste it to your preffered directory.
2. Open cmd and set the current directory to the path where your mongodb program resides. 
3. Start mongod.exe (server). The input the following commands: 
--dbpath "your loop's db path" --journal --storageEngine=mmapv1
4. Once successful, you may open the mongo.exe (client) and execute some queries or insertions.
Example commands:
db - to display the current db
show dbs - display all dbs in the current db directory
use loop - use the loop's db
db.user.find().pretty() - display all the user's information in the db in a "prettified form".
db.user.insert({ "name" : "ais" }) - insert a property name 